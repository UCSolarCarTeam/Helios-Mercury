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
    property var warnMoveQueue: []

    property var severityRankSettled: ({
        "bps": 0,
        "error": 0,
        "warn": 1,
        "info": 2
    })

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
        if (type === "batteryFaults") return batteryFaults
        if (type === "mbms") return mbms
        if (type === "motorDetails0") return motorDetails0
        if (type === "motorDetails1") return motorDetails1
        if (type === "contactor") return contactor
        return null
    }

    function faultKeyFor(fault) {
        return fault.type + ":" + fault.fault + ":" + (fault.bit !== undefined ? fault.bit : -1)
    }

    function insertionIndexFor(rank, uid) {
        for (let i = 0; i < activeModel.count; i++) {
            const it = activeModel.get(i)
            if (rank < it.severityRank)
                return i
            if (rank === it.severityRank && uid < it.uid)
                return i
        }
        return activeModel.count
    }

    function insertFaultItem(item) {
        const index = insertionIndexFor(item.severityRank, item.uid)
        activeModel.insert(index, item)
    }

    function removeFaultByKey(fault) {
        const key = faultKeyFor(fault)
        for (let i = 0; i < activeModel.count; i++) {
            const it = activeModel.get(i)
            if (it.faultKey === key) {
                activeModel.remove(i)
                return
            }
        }
    }

    function addOrUpdateFault(fault, isActive) {
        const key = faultKeyFor(fault)

        if (!isActive) {
            removeFaultByKey(fault)
            const idxWarn = warnMoveQueue.indexOf(key)
            if (idxWarn !== -1)
                warnMoveQueue.splice(idxWarn, 1)
            return
        }

        for (let i = 0; i < activeModel.count; i++) {
            const it = activeModel.get(i)
            if (it.faultKey === key)
                return
        }

        const severityRank = severityRankSettled[fault.severity] !== undefined
                ? severityRankSettled[fault.severity]
                : 99

        const uid = nextUid++
        insertFaultItem({
            uid: uid,
            faultKey: key,
            label: fault.label || "",
            msg: fault.msg,
            severity: fault.severity,
            settled: fault.severity !== "warn",
            severityRank: severityRank
        })

        if (fault.severity === "warn") {
            warnMoveQueue.push(key)
            warnTimer.restart()
        }
    }

    function settleWarnByKey(key) {
        let idx = -1
        let item = null

        for (let i = 0; i < activeModel.count; i++) {
            const it = activeModel.get(i)
            if (it.faultKey === key) {
                idx = i
                item = it
                break
            }
        }

        if (idx === -1 || !item)
            return

        activeModel.remove(idx)

        insertFaultItem({
            uid: item.uid,
            faultKey: item.faultKey,
            label: item.label,
            msg: item.msg,
            severity: "info",
            settled: true,
            severityRank: severityRankSettled["info"]
        })
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
        id: warnTimer
        interval: 3000
        repeat: false
        onTriggered: {
            if (warnMoveQueue.length > 0) {
                const key = warnMoveQueue.shift()
                settleWarnByKey(key)
                if (warnMoveQueue.length > 0)
                    warnTimer.restart()
            }
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

        delegate: FaultsMessage {
            width: listView.width
            height: delegateHeight
            severity: model.severity
            label: model.label || ""
            msg: model.msg
        }
    }
}