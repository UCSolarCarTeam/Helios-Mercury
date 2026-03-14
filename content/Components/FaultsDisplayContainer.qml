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
    property int tempWarnTopDurationMs: 3000

    property var faultsData: [
        // MBMS
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

        // Battery faults
        { fault: "InternalCommunicationFault", msg: "Battery internal communication fault", severity: "error", type: "batteryFaults" },
        { fault: "InternalConversionFault", msg: "Battery internal conversion fault", severity: "error", type: "batteryFaults" },
        { fault: "WeakCellFault", msg: "Weak cell fault", severity: "error", type: "batteryFaults" },
        { fault: "LowCellVoltageFault", msg: "Low cell voltage fault", severity: "error", type: "batteryFaults" },
        { fault: "OpenWiringFault", msg: "Open wiring fault", severity: "error", type: "batteryFaults" },
        { fault: "CurrentSensorFault", msg: "Current sensor fault", severity: "error", type: "batteryFaults" },
        { fault: "PackVoltageSensorFault", msg: "Pack voltage sensor fault", severity: "error", type: "batteryFaults" },
        { fault: "WeakPackFault", msg: "Weak pack fault", severity: "error", type: "batteryFaults" },
        { fault: "VoltageRedundancyFault", msg: "Voltage redundancy fault", severity: "error", type: "batteryFaults" },
        { fault: "FanMonitorFault", msg: "Fan monitor fault", severity: "error", type: "batteryFaults" },
        { fault: "ThermistorFault", msg: "Thermistor fault", severity: "error", type: "batteryFaults" },
        { fault: "CanbusCommunicationFault", msg: "Battery CAN communication fault", severity: "error", type: "batteryFaults" },
        { fault: "AlwaysOnSupplyFault", msg: "Always-on supply fault", severity: "error", type: "batteryFaults" },
        { fault: "HighVoltageIsolationFault", msg: "High voltage isolation fault", severity: "error", type: "batteryFaults" },
        { fault: "PowerSupply12VFault", msg: "12V power supply fault", severity: "error", type: "batteryFaults" },
        { fault: "ChargeLimitEnforcementFault", msg: "Charge limit enforcement fault", severity: "error", type: "batteryFaults" },
        { fault: "DischargeLimitEnforcementFault", msg: "Discharge limit enforcement fault", severity: "error", type: "batteryFaults" },
        { fault: "ChargerSafetyRelayFault", msg: "Charger safety relay fault", severity: "error", type: "batteryFaults" },
        { fault: "InternalMemoryFault", msg: "Battery internal memory fault", severity: "error", type: "batteryFaults" },
        { fault: "InternalThermistorFault", msg: "Battery internal thermistor fault", severity: "error", type: "batteryFaults" },
        { fault: "InternalLogicFault", msg: "Battery internal logic fault", severity: "error", type: "batteryFaults" },

        { fault: "DclReducedDueToLowSoc", msg: "DCL reduced due to low SOC", severity: "warn", type: "batteryFaults" },
        { fault: "DclReducedDueToHighCellResistance", msg: "DCL reduced due to high cell resistance", severity: "warn", type: "batteryFaults" },
        { fault: "DclReducedDueToTemperature", msg: "DCL reduced due to temperature", severity: "warn", type: "batteryFaults" },
        { fault: "DclReducedDueToLowCellVoltage", msg: "DCL reduced due to low cell voltage", severity: "warn", type: "batteryFaults" },
        { fault: "DclReducedDueToLowPackVoltage", msg: "DCL reduced due to low pack voltage", severity: "warn", type: "batteryFaults" },
        { fault: "DclAndCclReducedDueToVoltageFailsafe", msg: "DCL/CCL reduced due to voltage failsafe", severity: "warn", type: "batteryFaults" },
        { fault: "DclAndCclReducedDueToCommunicationFailsafe", msg: "DCL/CCL reduced due to comm failsafe", severity: "warn", type: "batteryFaults" },
        { fault: "CclReducedDueToHighSoc", msg: "CCL reduced due to high SOC", severity: "warn", type: "batteryFaults" },
        { fault: "CclReducedDueToHighCellResistance", msg: "CCL reduced due to high cell resistance", severity: "warn", type: "batteryFaults" },
        { fault: "CclReducedDueToTemperature", msg: "CCL reduced due to temperature", severity: "warn", type: "batteryFaults" },
        { fault: "CclReducedDueToHighCellVoltage", msg: "CCL reduced due to high cell voltage", severity: "warn", type: "batteryFaults" },
        { fault: "CclReducedDueToHighPackVoltage", msg: "CCL reduced due to high pack voltage", severity: "warn", type: "batteryFaults" },
        { fault: "CclReducedDueToChargerLatch", msg: "CCL reduced due to charger latch", severity: "warn", type: "batteryFaults" },
        { fault: "CclReducedDueToAlternateCurrentLimit", msg: "CCL reduced due to alternate current limit", severity: "warn", type: "batteryFaults" },

        // Motor bitfield faults
        { fault: "ErrorFlags", bit: 0, msg: "Hardware overcurrent", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 1, msg: "Software overcurrent", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 2, msg: "DC bus overvoltage", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 3, msg: "Bad motor position", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 4, msg: "Watchdog reset", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 5, msg: "Config read error", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 6, msg: "BMS fault", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 7, msg: "Communication error", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 8, msg: "Motor overtemperature", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 9, msg: "Inverter overtemperature", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 10, msg: "Flux error", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 11, msg: "BRAM error", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 12, msg: "EEPROM error", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 13, msg: "Hardware undervoltage", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 14, msg: "Hardware overvoltage", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 15, msg: "Hardware overtemperature", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 16, msg: "Hardware fault", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 17, msg: "Software fault", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 18, msg: "DC bus undervoltage", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 19, msg: "DC bus overtemperature", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 20, msg: "Motor current fault", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 21, msg: "Motor speed fault", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 22, msg: "Motor voltage fault", severity: "error", type: "motorDetails0" },
        { fault: "ErrorFlags", bit: 23, msg: "Motor angle fault", severity: "error", type: "motorDetails0" },

        // Contactor
        { fault: "CommonContactorError", msg: "Common contactor error", severity: "error", type: "contactor" },
        { fault: "MotorContactorError", msg: "Motor contactor error", severity: "error", type: "contactor" },
        { fault: "ArrayContactorError", msg: "Array contactor error", severity: "error", type: "contactor" },
        { fault: "ChargeContactorError", msg: "Charge contactor error", severity: "error", type: "contactor" },
        { fault: "LvContactorError", msg: "LV contactor error", severity: "error", type: "contactor" }
    ]

    ListModel { id: activeModel }

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

    function nowMs() {
        return Date.now()
    }

    function faultKeyFor(fault) {
        return fault.type + ":" + fault.fault + ":" + (fault.bit !== undefined ? fault.bit : -1)
    }

    function indexOfFaultKey(key) {
        for (let i = 0; i < activeModel.count; i++) {
            if (activeModel.get(i).faultKey === key)
                return i
        }
        return -1
    }

    function baseRankForSeverity(severity) {
        if (severity === "bps" || severity === "error")
            return 0
        if (severity === "warn")
            return 1
        if (severity === "info")
            return 2
        return 99
    }

    function firstIndexAfterRedSection() {
        let idx = 0
        while (idx < activeModel.count) {
            const it = activeModel.get(idx)
            if (it.severity === "bps" || it.severity === "error")
                idx++
            else
                break
        }
        return idx
    }

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

    function settleElevatedWarnings() {
        const now = nowMs()

        for (let i = 0; i < activeModel.count; i++) {
            const it = activeModel.get(i)

            if (it.severity === "warn" && it.temporarilyElevated && now >= it.elevateUntil) {
                const target = firstIndexAfterRedSection()

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
        } catch (e) {
        }
    }

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