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

    // Demo mode: true = show hardcoded test faults, false = hook into real signals
    property bool forceDemoFaults: true

    // Used to uniquely identify each fault instance so the correct warn can be moved after 3s
    property int nextUid: 1

    // Holds pending warnings that are temporarily pinned at the top
    property var warnMoveQueue: []

    // Final ordering when settled: red (error/bps) -> yellow (warn) -> green (info)
    property var severityRankSettled: ({
        "bps": 0,
        "error": 0,
        "warn": 1,
        "info": 2
    })

    // Full library of possible faults
    property var faultsData: [
        { fault: "StrobeBmsLight", msg: "Strobe SOS", severity: "bps", type: "mbms"},
        { fault: "ChargeEnable", msg: "OBMS Charge Disabled", severity: "warn", type: "mbms"},
        { fault: "DischargeEnable", msg: "OBMS Discharge Disabled", severity: "warn", type: "mbms"},
        { fault: "HighCellVoltageTrip", msg: "High Cell Voltage Trip", severity: "bps", type: "mbms"},
        { fault: "LowCellVoltageTrip", msg: "Low Cell Voltage Trip", severity: "bps", type: "mbms"},
        { fault: "CommonHighCurrentTrip", msg: "Common High Current Trip", severity: "bps", type: "mbms"},
        { fault: "MotorHighCurrentTrip", msg: "Motor High Current Trip", severity: "bps", type: "mbms"},
        { fault: "ArrayHighCurrentTrip", msg: "Array High Current Trip", severity: "bps", type: "mbms"},
        { fault: "LvHighCurrentTrip", msg: "LV High Current Trip", severity: "bps", type: "mbms"},
        { fault: "ChargeHighCurrentTrip", msg: "Charge High Current Trip", severity: "bps", type: "mbms"},
        { fault: "ProtectionTrip", msg: "Protection Trip", severity: "bps", type: "mbms"},
        { fault: "OrionMessageTimeoutTrip", msg: "Orion Message Timeout Trip", severity: "bps", type: "mbms"},
        { fault: "ContactorDisconnectedUnexpectedlyTrip", msg: "Contactor Disconnected Unexpectedly Trip", severity: "bps", type: "mbms"},
        { fault: "ContactorConnectedUnexpectedlyTrip", msg: "Contactor Connected Unexpectely Trip", severity: "bps", type: "mbms"},
        { fault: "CommonHeartbeatDeadTrip", msg: "Common Heartbeat Dead Trip", severity: "bps", type: "mbms"},
        { fault: "MotorHeartbeatDeadTrip", msg: "Motor Heartbeat Dead Trip", severity: "bps", type: "mbms"},
        { fault: "ArrayHeartbeatDeadTrip", msg: "Array Heartbeat Dead Trip", severity: "bps", type: "mbms"},
        { fault: "LvHeartbeatDeadTrip", msg: "LV Heartbeat Dead Trip", severity: "bps", type: "mbms"},
        { fault: "ChargeHeartbeatDeadTrip", msg: "Charge Heartbeat Dead Trip", severity: "bps", type: "mbms"},
        { fault: "MpsDisabledTrip", msg: "MPS Disabled Trip", severity: "warn", type: "mbms"},
        { fault: "EsdEnabledTrip", msg: "ESD Enabled Trip", severity: "bps", type: "mbms"},
        { fault: "HighTemperatureTrip", msg: "High Temperature Trip", severity: "bps", type: "mbms"},
        { fault: "LowTemperatureTrip", msg: "Low Temperature Trip", severity: "bps", type: "mbms"},
        { fault: "HighCellVoltageWarning", msg: "High Cell Voltage Warning", severity: "error", type: "mbms"},
        { fault: "LowCellVoltageWarning", msg: "Low Cell Voltage Warning", severity: "error", type: "mbms"},
        { fault: "CommonHighCurrentWarning", msg: "Common High Current Warning", severity: "error", type: "mbms"},
        { fault: "MotorHighCurrentWarning", msg: "Motor High Current Warning", severity: "error", type: "mbms"},
        { fault: "ArrayHighCurrentWarning", msg: "Array High Current Warning", severity: "error", type: "mbms"},
        { fault: "LvHighCurrentWarning", msg: "LV High Current Warning", severity: "error", type: "mbms"},
        { fault: "ChargeHighCurrentWarning", msg: "Charge HIgh Current Warning", severity: "error", type: "mbms"},
        { fault: "HighTemperatureWarning", msg: "High Temperature Warning", severity: "error", type: "mbms"},
        { fault: "LowTemperatureWarning", msg: "Low Temperature Warning", severity: "error", type: "mbms"},
        { fault: "CommonContactorError", msg: "Common Contactor Failed to Close", severity: "error", type: "contactor"},
        { fault: "CommonContactorOpeningError", msg: "Common Contactor Failed to Open", severity: "error", type: "contactor"},
        { fault: "MotorContactorError", msg: "Motor Contactor Failed to Close", severity: "error", type: "contactor"},
        { fault: "MotorBPSError", msg: "Motor Contactor Failed to Open", severity: "error", type: "contactor"},
        { fault: "ArrayContactorError", msg: "Array Contactor Failed to Close", severity: "error", type: "contactor"},
        { fault: "ArrayBPSError", msg: "Array Contactor Failed to Open", severity: "error", type: "contactor"},
        { fault: "LvContactorError", msg: "LV Contactor Failed to Close", severity: "error", type: "contactor"},
        { fault: "LvBpsError", msg: "LV Contactor Failed to Open", severity: "error", type: "contactor"},
        { fault: "ChargeContactorError", msg: "Charge Contactor Failed to Close", severity: "error", type: "contactor"},
        { fault: "ChargeBPSError", msg: "Charge Contactor Failed to Open", severity: "error", type: "contactor"},
        { fault: "ErrorFlags", msg: "Motor 0 Hardware Over Current", severity: "error", type: "motorDetails0", bit: 0},
        { fault: "ErrorFlags", msg: "Motor 0 Software Over Current", severity: "error", type: "motorDetails0", bit: 1},
        { fault: "ErrorFlags", msg: "Motor 0 DC Bus Over Voltage", severity: "error", type: "motorDetails0", bit: 2},
        { fault: "ErrorFlags", msg: "Bad Motor 0 Position Hall Sequence", severity: "error", type: "motorDetails0", bit: 3},
        { fault: "ErrorFlags", msg: "Motor 1 Hardware Over Current", severity: "error", type: "motorDetails1", bit: 0},
        { fault: "ErrorFlags", msg: "Motor 1 Software Over Current", severity: "error", type: "motorDetails1", bit: 1},
        { fault: "ErrorFlags", msg: "Motor 1 DC Bus Over Voltage", severity: "error", type: "motorDetails1", bit: 2},
        { fault: "ErrorFlags", msg: "Bad Motor 1 Position Hall Sequence", severity: "error", type: "motorDetails1", bit: 3}
    ]

    ListModel { id: activeModel }

    function cloneEntry(base) {
        var e = {}
        for (var k in base) e[k] = base[k]
        e.uid = nextUid++
        return e
    }

    // Inserts faults into their settled band (red->yellow->green)
    function insertSettledSorted(entry) {
        var insertIndex = 0
        var entryRank = severityRankSettled[entry.severity]

        while (insertIndex < activeModel.count) {
            var cur = activeModel.get(insertIndex)
            if (cur && cur.pinnedTop) {
                insertIndex++
                continue
            }
            var currentRank = severityRankSettled[cur.severity]
            if (entryRank < currentRank) break
            insertIndex++
        }

        activeModel.insert(insertIndex, entry)
    }

    // New yellows pin to the top for 3 seconds, then get moved into the middle band
    function addFault(entry) {
        var e = cloneEntry(entry)

        if (e.severity === "warn") {
            e.pinnedTop = true
            activeModel.insert(0, e)
            warnMoveQueue.push({ uid: e.uid, due: Date.now() + 3000 })
            return
        }

        insertSettledSorted(e)
    }

    // After 3 seconds, remove the pinned warning and reinsert it as a normal warning below reds and above greens
    function settleWarn(uid) {
        var idx = -1
        for (var i = 0; i < activeModel.count; i++) {
            var it = activeModel.get(i)
            if (it.uid === uid) {
                idx = i
                break
            }
        }
        if (idx === -1) return

        var it2 = activeModel.get(idx)

        // keeps label/msg when moving
        var moved = {
            uid: it2.uid,
            label: it2.label || "",
            msg: it2.msg || "",
            severity: it2.severity || "warn",
            type: it2.type,
            fault: it2.fault,
            bit: it2.bit,
            pinnedTop: false
        }

        activeModel.remove(idx)
        insertSettledSorted(moved)
    }

    // Polls the queue and settles any warnings whose 3-second timer has elapsed
    Timer {
        id: warnSettleTimer
        interval: 50
        repeat: true
        running: true
        onTriggered: {
            var now = Date.now()
            for (var i = warnMoveQueue.length - 1; i >= 0; i--) {
                if (now >= warnMoveQueue[i].due) {
                    var uid = warnMoveQueue[i].uid
                    warnMoveQueue.splice(i, 1)
                    settleWarn(uid)
                }
            }
        }
    }

    // Demo-only initial stack for UI testing
    function forceShowDemoFaults() {
        activeModel.clear()
        warnMoveQueue = []

        addFault({ label: "Motor Fault", msg: "Left Motor is non-functional", severity: "error" })
        addFault({ label: "Motor Fault", msg: "Left Motor is non-functional", severity: "error" })
        addFault({ label: "Motor Fault", msg: "Left Motor is non-functional", severity: "error" })

        addFault({ label: "Sensor Fault", msg: "Left sensor malfunction", severity: "warn" })

        addFault({ label: "Oil Fault", msg: "Change oil", severity: "info" })
    }

    Component.onCompleted: {
        if (forceDemoFaults) {
            forceShowDemoFaults()
            return
        }

        // connect each entry in faultsData to the correct object + signal
        for (let fault of faultsData) {
            let sourceContext = null

            if (fault.type === "batteryFaults") sourceContext = batteryFaults
            else if (fault.type === "mbms") sourceContext = mbms
            else if (fault.type === "motorDetails0") sourceContext = motorDetails0
            else if (fault.type === "motorDetails1") sourceContext = motorDetails1
            else if (fault.type === "contactor") sourceContext = contactor

            if (!sourceContext) continue

            // motor error flags
            if (fault.bit !== undefined) {
                sourceContext["on" + fault.fault + "Changed"].connect(function() {
                    const errorFlags = sourceContext[fault.fault]
                    const bitActive = (errorFlags & (1 << fault.bit)) !== 0
                    if (bitActive) addFault(fault)
                })
            } else {
                // Boolean faults
                sourceContext["on" + fault.fault + "Changed"].connect(function() {
                    if (sourceContext[fault.fault]) addFault(fault)
                })
            }
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
