/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 6.2
import QtQuick.Controls 6.2
import Mercury

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    Text {
        id: label
        text: qsTr("Hello Mercury")
        font.family: Constants.font.family
        anchors.topMargin: 45
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Column {
        Text {
            text: "PROX 1: " + proximitySensors.ProximitySensor1
        }
        Text {
            text: "PROX 2: " + proximitySensors.ProximitySensor2
        }
        Text {
            text: "PROX 3: " + proximitySensors.ProximitySensor3
        }
        Text {
            text: "PROX 4: " + proximitySensors.ProximitySensor4
        }
    }

    Column {
        Text {
            text: "Internal Communication Fault: " + batteryFaults.InternalCommunicationFault
        }
        Text {
            text: "Internal Conversion Fault: " + batteryFaults.InternalConverversionFault
        }
        Text {
            text: "Weak Cell Fault: " + batteryFaults.WeakCellFault
        }
        Text {
            text: "Low Cell Voltage Fault: " + batteryFaults.LowCellVoltageFault
        }
        Text {
            text: "Open Wiring Fault: " + batteryFaults.OpenWiringFault
        }
        Text {
            text: "Current Sensor Fault: " + batteryFaults.CurrentSensorFault
        }
        Text {
            text: "Pack Voltage Sensor Fault: " + batteryFaults.PackVoltageSensorFault
        }
        Text {
            text: "Weak Pack Fault: " + batteryFaults.WeakPackFault
        }
        Text {
            text: "Voltage Redundancy Fault: " + batteryFaults.VoltageRedundancyFault
        }
        Text {
            text: "Fan Monitor Fault: " + batteryFaults.FanMonitorFault
        }
        Text {
            text: "Thermistor Fault: " + batteryFaults.ThermistorFault
        }
        Text {
            text: "Canbus Communication Fault: " + batteryFaults.CanbusCommunicationFault
        }
        Text {
            text: "Always On Supply Fault: " + batteryFaults.AlwaysOnSupplyFault
        }
        Text {
            text: "High Voltage Isolation Fault: " + batteryFaults.HighVoltageIsolationFault
        }
        Text {
            text: "Power Supply 12V Fault: " + batteryFaults.PowerSupply12VFault
        }
        Text {
            text: "Charge Limit Enforcement Fault: " + batteryFaults.ChargeLimitEnforcementFault
        }
        Text {
            text: "Discharge Limit Enforcement Fault: " + batteryFaults.DischargeLimitEnforcementFault
        }
        Text {
            text: "Charger Safety Relay Fault: " + batteryFaults.ChargerSafetyRelayFault
        }
        Text {
            text: "Internal Memory Fault: " + batteryFaults.InternalMemoryFault
        }
        Text {
            text: "Internal Thermistor Fault: " + batteryFaults.InternalThermistorFault
        }
        Text {
            text: "Internal Logic Fault: " + batteryFaults.InternalLogicFault
        }
        Text {
            text: "DCL Reduced Due to Low SOC: " + batteryFaults.DclReducedDueToLowSoc
        }
        Text {
            text: "DCL Reduced Due to High Cell Resistance: " + batteryFaults.DclReducedDueToHighCellResistance
        }
        Text {
            text: "DCL Reduced Due to Temperature: " + batteryFaults.DclReducedDueToTemperature
        }
        Text {
            text: "DCL Reduced Due to Low Cell Voltage: " + batteryFaults.DclReducedDueToLowCellVoltage
        }
        Text {
            text: "DCL Reduced Due to Low Pack Voltage: " + batteryFaults.DclReducedDueToLowPackVoltage
        }
        Text {
            text: "DCL and CCL Reduced Due to Voltage Failsafe: " + batteryFaults.DclAndCclReducedDueToVoltageFailsafe
        }
        Text {
            text: "DCL and CCL Reduced Due to Communication Failsafe: " + batteryFaults.DclAndCclReducedDueToCommunicationFailsafe
        }
        Text {
            text: "CCL Reduced Due to High SOC: " + batteryFaults.CclReducedDueToHighSoc
        }
        Text {
            text: "CCL Reduced Due to High Cell Resistance: " + batteryFaults.CclReducedDueToHighCellResistance
        }
        Text {
            text: "CCL Reduced Due to Temperature: " + batteryFaults.CclReducedDueToTemperature
        }
        Text {
            text: "CCL Reduced Due to High Cell Voltage: " + batteryFaults.CclReducedDueToHighCellVoltage
        }
        Text {
            text: "CCL Reduced Due to High Pack Voltage: " + batteryFaults.CclReducedDueToHighPackVoltage
        }
        Text {
            text: "CCL Reduced Due to Charger Latch: " + batteryFaults.CclReducedDueToChargerLatch
        }
        Text {
            text: "CCL Reduced Due to Alternate Current Limit: " + batteryFaults.CclReducedDueToAlternateCurrentLimit
        }
    }
}
