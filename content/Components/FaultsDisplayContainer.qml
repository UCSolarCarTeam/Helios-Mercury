// FaultsDisplayContainer.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import Mercury

Rectangle {
    id: faultsDisplayContainer
    width: 426
    height: 175
    color: "transparent"

    property int delegateHeight: 30
    property int nextUid: 1

    // Duration that a yellow warning temporarily stays above all faults
    property int tempWarnTopDurationMs: 3000


    /*
      Master list describing every possible dashboard fault.

      Each entry defines:
      - the property to read from the data source
      - the message shown to the driver
      - severity level (bps/error/warn/info)
      - the source object where the signal originates
    */
    property var faultsData: [
        { fault: "StrobeBmsLight", msg: "Strobe SOS", severity: "bps", type: "mbms" },
        { fault: "AllowCharge", msg: "Allow charge", severity: "info", type: "mbms" },
        { fault: "AllowDischarge", msg: "Allow discharge", severity: "info", type: "mbms" },
        { fault: "ChargeShouldTrip", msg: "Charge should trip", severity: "warn", type: "mbms" },
        { fault: "HighVoltageEnableState", msg: "High voltage enabled", severity: "info", type: "mbms" },
        { fault: "OrionCanReceivedRecently", msg: "Orion CAN recent", severity: "info", type: "mbms" },
        { fault: "DischargeShouldTrip", msg: "Discharge should trip", severity: "warn", type: "mbms" },

        { fault: "HighCellVoltageTrip", msg: "High cell voltage trip", severity: "warn", type: "mbms" },
        { fault: "LowCellVoltageTrip", msg: "Low cell voltage trip", severity: "warn", type: "mbms" },
        { fault: "HighCommonCurrentTrip", msg: "High common current trip", severity: "warn", type: "mbms" },
        { fault: "MotorHighTemperatureCurrentTrip", msg: "Motor high TC trip", severity: "warn", type: "mbms" },
        { fault: "ArrayHighTemperatureCurrentTrip", msg: "Array high TC trip", severity: "warn", type: "mbms" },
        { fault: "LvHighTemperatureCurrentTrip", msg: "LV high TC trip", severity: "warn", type: "mbms" },
        { fault: "ChargeHighTemperatureCurrentTrip", msg: "Charge high temp trip", severity: "warn", type: "mbms" },
        { fault: "ProtectionTrip", msg: "Protection trip", severity: "error", type: "mbms" },
        { fault: "OrionMessageTimeoutTrip", msg: "Orion message timeout", severity: "error", type: "mbms" },
        { fault: "ContactorDisconnectedUnexpectedlyTrip", msg: "Contactor disconnect trip", severity: "error", type: "mbms" },

        // (battery, motor, and contactor entries unchanged)
    ]

    // Active faults currently visible in the UI
    ListModel { id: activeModel }



    /*
      Returns the QML object containing the property for a given fault type.

      This maps the logical type name used in faultsData to the actual
      telemetry object exposed by Mercury.
    */
    function getSourceContext(type) {
        if (type === "batteryFaults") {
            if (typeof batteryFaults !== "undefined")
                return batteryFaults
            if (typeof batteryFaultsPacket !== "undefined")
                return batteryFaultsPacket
            return null
        }

        if (type === "battery" && typeof battery !== "undefined")
            return battery
        if (type === "mbms" && typeof mbms !== "undefined")
            return mbms
        if (type === "motorDetails0" && typeof motorDetails0 !== "undefined")
            return motorDetails0
        if (type === "motorDetails1" && typeof motorDetails1 !== "undefined")
            return motorDetails1
        if (type === "contactor" && typeof contactor !== "undefined")
            return contactor
        return null
    }


    // Current timestamp used for warning timers
    function nowMs() {
        return Date.now()
    }


    // Generates a unique identifier for a fault entry
    function faultKeyFor(fault) {
        return fault.type + ":" + fault.fault + ":" + (fault.bit !== undefined ? fault.bit : -1)
    }


    // Finds an existing fault in the model
    function indexOfFaultKey(key) {
        for (let i = 0; i < activeModel.count; i++) {
            if (activeModel.get(i).faultKey === key)
                return i
        }
        return -1
    }


    /*
      Converts severity to a numeric rank for sorting.

      Lower number = higher priority in the display.
    */
    function baseRankForSeverity(severity) {
        if (severity === "bps" || severity === "error")
            return 0
        if (severity === "warn")
            return 1
        if (severity === "info")
            return 2
        return 99
    }


    /*
      Finds the first position in the list that comes AFTER all red faults.

      Used when settling a warning so that it moves under the red section.
    */
    function firstIndexAfterRedSection(ignoreIndex) {
        let idx = 0
        while (idx < activeModel.count) {

            if (idx === ignoreIndex) {
                idx++
                continue
            }

            const it = activeModel.get(idx)

            if (it.severity === "bps" || it.severity === "error")
                idx++
            else
                break
        }

        return idx
    }


    /*
      Determines where a new fault should be inserted so that
      the list remains sorted by severity and creation order.
    */
    function sortedInsertIndex(item) {
        for (let i = 0; i < activeModel.count; i++) {

            const it = activeModel.get(i)

            if (item.severityRank < it.severityRank)
                return i

            if (item.severityRank === it.severityRank && item.uid < it.uid)
                return i
        }

        return activeModel.count
    }


    function insertFaultItem(item) {
        activeModel.insert(sortedInsertIndex(item), item)
    }



    /*
      Adds a fault to the active list if it becomes active,
      or removes it if it clears.

      Yellow warnings are temporarily inserted with a special
      priority rank so they appear above everything for 3 seconds.
    */
    function addOrUpdateFault(fault, isActive) {

        const key = faultKeyFor(fault)
        const idx = indexOfFaultKey(key)

        if (!isActive) {
            if (idx !== -1)
                activeModel.remove(idx)
            return
        }

        if (idx !== -1)
            return

        const elevated = fault.severity === "warn"

        insertFaultItem({
            uid: nextUid++,
            faultKey: key,
            label: fault.label || "",
            msg: fault.msg,
            severity: fault.severity,
            severityRank: elevated ? -1 : baseRankForSeverity(fault.severity),
            temporarilyElevated: elevated,
            elevateUntil: elevated ? nowMs() + tempWarnTopDurationMs : 0
        })
    }



    /*
      After the 3-second timer expires, warnings are "settled".

      Their rank changes to normal yellow priority and the item
      is moved directly below the red fault section.
    */
    function settleElevatedWarnings() {

        const now = nowMs()

        for (let i = 0; i < activeModel.count; i++) {

            const it = activeModel.get(i)

            if (it.severity === "warn" && it.temporarilyElevated && now >= it.elevateUntil) {

                const target = firstIndexAfterRedSection(i)

                activeModel.setProperty(i, "temporarilyElevated", false)
                activeModel.setProperty(i, "elevateUntil", 0)
                activeModel.setProperty(i, "severityRank", 1)

                let moveTarget = target
                if (moveTarget > i)
                    moveTarget -= 1

                if (moveTarget !== i)
                    activeModel.move(i, moveTarget, 1)

                i = -1
            }
        }
    }



    /*
      Reads the current value of a fault property and updates the model.
      Supports both boolean faults and bitfield faults.
    */
    function refreshFault(fault) {

        const sourceContext = getSourceContext(fault.type)
        if (!sourceContext)
            return

        try {

            if (fault.bit !== undefined) {

                const flags = sourceContext[fault.fault]
                addOrUpdateFault(fault, (flags & (1 << fault.bit)) !== 0)

            } else {

                addOrUpdateFault(fault, !!sourceContext[fault.fault])

            }

        } catch (e) { }
    }



    /*
      Poll timer used as a fallback in case a property does not emit
      a change signal. Also responsible for settling warnings.
    */
    Timer {
        id: pollTimer
        interval: 200
        repeat: true
        running: true

        onTriggered: {

            for (let i = 0; i < faultsData.length; i++)
                refreshFault(faultsData[i])

            settleElevatedWarnings()
        }
    }



    /*
      On startup we connect to property change signals so the UI
      reacts immediately when telemetry updates.
    */
    Component.onCompleted: {

        for (let i = 0; i < faultsData.length; i++) {

            const fault = faultsData[i]
            const sourceContext = getSourceContext(fault.type)

            if (!sourceContext)
                continue

            const signalName = fault.fault + "Changed"
            const signalObj = sourceContext[signalName]

            if (signalObj && signalObj.connect) {

                signalObj.connect((function(f) {
                    return function() {
                        refreshFault(f)
                    }
                })(fault))
            }

            refreshFault(fault)
        }
    }



    /*
      Displays the active fault list.

      Only the displacement animation is used so rows slide smoothly
      when warnings settle below the red fault section.
    */
    ListView {

        id: listView
        anchors.fill: parent
        model: activeModel
        interactive: false
        clip: true
        spacing: 2

        displaced: Transition {
            NumberAnimation {
                properties: "x,y"
                duration: 260
                easing.type: Easing.InOutQuad
            }
        }

        delegate: FaultsMessage {
            width: listView.width
            height: delegateHeight
            severity: model.severity
            label: model.label || ""
            msg: model.msg
        }
    }
}