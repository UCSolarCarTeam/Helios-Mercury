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
        { fault: "StrobeBmsLight", msg: "Strobe SOS", severity: "bps", type: "mbms"},
        { fault: "ChargeEnable", msg: "OBMS Charge Disabled", severity: "info", type: "mbms"},
        { fault: "HighCellVoltageTrip", msg: "Cell voltage high", severity: "warn", type: "mbms"},
        { fault: "LowCellVoltageTrip", msg: "Cell voltage low", severity: "warn", type: "mbms"},
        { fault: "HighPackVoltageTrip", msg: "Pack voltage high", severity: "warn", type: "mbms"},
        { fault: "LowPackVoltageTrip", msg: "Pack voltage low", severity: "warn", type: "mbms"},
        { fault: "HighCellTemperatureTrip", msg: "Cell temperature high", severity: "warn", type: "mbms"},
        { fault: "LowCellTemperatureTrip", msg: "Cell temperature low", severity: "warn", type: "mbms"},
        { fault: "HighPackTemperatureTrip", msg: "Pack temperature high", severity: "warn", type: "mbms"},
        { fault: "LowPackTemperatureTrip", msg: "Pack temperature low", severity: "warn", type: "mbms"},
        { fault: "HighPackCurrentTrip", msg: "Pack current high", severity: "warn", type: "mbms"},
        { fault: "LowPackCurrentTrip", msg: "Pack current low", severity: "warn", type: "mbms"},
        { fault: "HighPackSOCTrip", msg: "Pack SOC high", severity: "warn", type: "mbms"},
        { fault: "LowPackSOCTrip", msg: "Pack SOC low", severity: "warn", type: "mbms"},
        { fault: "BmsFaulted", msg: "BMS Faulted", severity: "error", type: "mbms"},
        { fault: "BmsSystemFault", msg: "BMS System Fault", severity: "error", type: "mbms"},
        { fault: "BmsCommsFault", msg: "BMS Comms Fault", severity: "error", type: "mbms"},
        { fault: "BmsCoreTempFault", msg: "BMS Core Temp Fault", severity: "error", type: "mbms"},
        { fault: "BmsCellTempFault", msg: "BMS Cell Temp Fault", severity: "error", type: "mbms"},
        { fault: "BmsCellVoltageFault", msg: "BMS Cell Voltage Fault", severity: "error", type: "mbms"},
        { fault: "BmsCellBalancingFault", msg: "BMS Cell Balancing Fault", severity: "error", type: "mbms"},
        { fault: "BmsLowCellVoltageFault", msg: "BMS Low Cell Voltage Fault", severity: "error", type: "mbms"},
        { fault: "BmsLowPackVoltageFault", msg: "BMS Low Pack Voltage Fault", severity: "error", type: "mbms"},
        { fault: "BmsHighCellVoltageFault", msg: "BMS High Cell Voltage Fault", severity: "error", type: "mbms"},
        { fault: "BmsHighPackVoltageFault", msg: "BMS High Pack Voltage Fault", severity: "error", type: "mbms"},
        { fault: "BmsHighCellTempFault", msg: "BMS High Cell Temp Fault", severity: "error", type: "mbms"},
        { fault: "BmsHighPackTempFault", msg: "BMS High Pack Temp Fault", severity: "error", type: "mbms"},
        { fault: "BmsHighCurrentFault", msg: "BMS High Current Fault", severity: "error", type: "mbms"},
        { fault: "BmsLowCurrentFault", msg: "BMS Low Current Fault", severity: "error", type: "mbms"},
        { fault: "BmsHighSOCFault", msg: "BMS High SOC Fault", severity: "error", type: "mbms"},
        { fault: "BmsLowSOCFault", msg: "BMS Low SOC Fault", severity: "error", type: "mbms"},
        { fault: "BmsChargeDisableFault", msg: "BMS Charge Disable Fault", severity: "error", type: "mbms"},
        { fault: "BmsDischargeDisableFault", msg: "BMS Discharge Disable Fault", severity: "error", type: "mbms"},
        { fault: "BmsOpenWireFault", msg: "BMS Open Wire Fault", severity: "error", type: "mbms"},
        { fault: "BmsCurrentSensorFault", msg: "BMS Current Sensor Fault", severity: "error", type: "mbms"},
        { fault: "BmsEEPROMFault", msg: "BMS EEPROM Fault", severity: "error", type: "mbms"},
        { fault: "BmsChargerFault", msg: "BMS Charger Fault", severity: "error", type: "mbms"},
        { fault: "BmsPackImbalanceFault", msg: "BMS Pack Imbalance Fault", severity: "error", type: "mbms"},
        { fault: "BmsLimpModeFault", msg: "BMS Limp Mode Fault", severity: "error", type: "mbms"},
        { fault: "BmsIsolationFault", msg: "BMS Isolation Fault", severity: "error", type: "mbms"},
        { fault: "BmsContactorsFault", msg: "BMS Contactors Fault", severity: "error", type: "mbms"},
        { fault: "BmsEStopFault", msg: "BMS EStop Fault", severity: "error", type: "mbms"},
        { fault: "BmsPrechargeFault", msg: "BMS Precharge Fault", severity: "error", type: "mbms"},
        { fault: "BmsChargeOverTempFault", msg: "BMS Charge Over Temp Fault", severity: "error", type: "mbms"},
        { fault: "BmsDischargeOverTempFault", msg: "BMS Discharge Over Temp Fault", severity: "error", type: "mbms"},
        { fault: "BmsChargeOverVoltageFault", msg: "BMS Charge Over Voltage Fault", severity: "error", type: "mbms"},
        { fault: "BmsDischargeOverVoltageFault", msg: "BMS Discharge Over Voltage Fault", severity: "error", type: "mbms"},
        { fault: "BmsChargeOverCurrentFault", msg: "BMS Charge Over Current Fault", severity: "error", type: "mbms"},
        { fault: "BmsDischargeOverCurrentFault", msg: "BMS Discharge Over Current Fault", severity: "error", type: "mbms"},
        { fault: "BmsChargeUnderVoltageFault", msg: "BMS Charge Under Voltage Fault", severity: "error", type: "mbms"},
        { fault: "BmsDischargeUnderVoltageFault", msg: "BMS Discharge Under Voltage Fault", severity: "error", type: "mbms"},
        { fault: "BmsChargeUnderCurrentFault", msg: "BMS Charge Under Current Fault", severity: "error", type: "mbms"},
        { fault: "BmsDischargeUnderCurrentFault", msg: "BMS Discharge Under Current Fault", severity: "error", type: "mbms"},

        { fault: "MotorTempTrip", msg: "Motor temperature high", severity: "warn", type: "motorDetails0"},
        { fault: "InverterTempTrip", msg: "Inverter temperature high", severity: "warn", type: "motorDetails0"},
        { fault: "DCCapVoltageTrip", msg: "DC Cap voltage high", severity: "warn", type: "motorDetails0"},
        { fault: "OverCurrentTrip", msg: "Overcurrent", severity: "warn", type: "motorDetails0"},
        { fault: "OverSpeedTrip", msg: "Overspeed", severity: "warn", type: "motorDetails0"},
        { fault: "UndervoltageTrip", msg: "Undervoltage", severity: "warn", type: "motorDetails0"},
        { fault: "OvervoltageTrip", msg: "Overvoltage", severity: "warn", type: "motorDetails0"},
        { fault: "MotorCurrentTrip", msg: "Motor current high", severity: "warn", type: "motorDetails0"},

        { fault: "ErrorFlags", bit: 0, msg: "Hardware overcurrent", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 1, msg: "Software overcurrent", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 2, msg: "DC bus overvoltage", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 3, msg: "Bad motor position", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 4, msg: "Watchdog reset", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 5, msg: "Config read error", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 6, msg: "BMS fault", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 7, msg: "Communication error", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 8, msg: "Motor overtemperature", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 9, msg: "Inverter overtemperature", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 10, msg: "Flux error", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 11, msg: "BRAM error", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 12, msg: "EEPROM error", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 13, msg: "Hardware undervoltage", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 14, msg: "Hardware overvoltage", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 15, msg: "Hardware overtemperature", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 16, msg: "Hardware fault", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 17, msg: "Software fault", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 18, msg: "DC bus undervoltage", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 19, msg: "DC bus overtemperature", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 20, msg: "Motor current fault", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 21, msg: "Motor speed fault", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 22, msg: "Motor voltage fault", severity: "error", type: "motorDetails0"},
        { fault: "ErrorFlags", bit: 23, msg: "Motor angle fault", severity: "error", type: "motorDetails0"},

        { fault: "MotorContactorError", msg: "Motor contactor error", severity: "error", type: "contactor"},
        { fault: "MainContactorError", msg: "Main contactor error", severity: "error", type: "contactor"},
        { fault: "PrechargeError", msg: "Precharge error", severity: "error", type: "contactor"},
        { fault: "IsolationFault", msg: "Isolation fault", severity: "error", type: "contactor"},
        { fault: "BpsTriggered", msg: "BPS TRIGGERED", severity: "bps", type: "batteryFaults"}
    ]

    ListModel { id: activeModel }

    function removeFaultByKey(fault) {
        for (let i = 0; i < activeModel.count; i++) {
            const it = activeModel.get(i)
            if (it.faultKey === fault.type + ":" + fault.fault + ":" + (fault.bit !== undefined ? fault.bit : -1)) {
                activeModel.remove(i)
                return
            }
        }
    }

    function addOrUpdateFault(fault, isActive) {
        const key = fault.type + ":" + fault.fault + ":" + (fault.bit !== undefined ? fault.bit : -1)

        if (!isActive) {
            removeFaultByKey(fault)
            const idxWarn = warnMoveQueue.indexOf(key)
            if (idxWarn !== -1) warnMoveQueue.splice(idxWarn, 1)
            return
        }

        const severityRank = severityRankSettled[fault.severity] !== undefined ? severityRankSettled[fault.severity] : 99

        for (let i = 0; i < activeModel.count; i++) {
            const it = activeModel.get(i)
            if (it.faultKey === key) {
                return
            }
        }

        const uid = nextUid++
        activeModel.append({
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
        if (idx === -1 || !item) return

        activeModel.remove(idx)

        activeModel.append({
            uid: item.uid,
            faultKey: item.faultKey,
            label: item.label,
            msg: item.msg,
            severity: "info",
            settled: true,
            severityRank: severityRankSettled["info"]
        })
    }

    Timer {
        id: warnTimer
        interval: 3000
        repeat: false
        onTriggered: {
            if (warnMoveQueue.length > 0) {
                const key = warnMoveQueue.shift()
                settleWarnByKey(key)
                if (warnMoveQueue.length > 0) warnTimer.restart()
            }
        }
    }

    Component.onCompleted: {
        for (let fault of faultsData) {
            let sourceContext = null

            if (fault.type === "batteryFaults") sourceContext = batteryFaults
            else if (fault.type === "mbms") sourceContext = mbms
            else if (fault.type === "motorDetails0") sourceContext = motorDetails0
            else if (fault.type === "motorDetails1") sourceContext = motorDetails1
            else if (fault.type === "contactor") sourceContext = contactor

            if (!sourceContext) continue

            const signalName = fault.fault + "Changed"
            const signalObj = sourceContext[signalName]

            if (!signalObj || !signalObj.connect) {
                console.warn("[FaultsDisplayContainer] Missing signal:", signalName, "on", fault.type)
                continue
            }

            if (fault.bit !== undefined) {
                signalObj.connect(function() {
                    const errorFlags = sourceContext[fault.fault]
                    const bitActive = (errorFlags & (1 << fault.bit)) !== 0
                    addOrUpdateFault(fault, bitActive)
                })
            } else {
                signalObj.connect(function() {
                    addOrUpdateFault(fault, !!sourceContext[fault.fault])
                })
            }

            if (fault.bit !== undefined) {
                const errorFlags0 = sourceContext[fault.fault]
                const bitActive0 = (errorFlags0 & (1 << fault.bit)) !== 0
                addOrUpdateFault(fault, bitActive0)
            } else {
                addOrUpdateFault(fault, !!sourceContext[fault.fault])
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