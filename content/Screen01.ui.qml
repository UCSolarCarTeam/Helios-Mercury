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
            text: "Common Contactor State: " + mbms.CommonContactorState
        }
        Text {
            text: "Motor Contactor State: " + mbms.MotorContactorState
        }
        Text {
            text: "Array Contactor State: " + mbms.ArrayContactorState
        }
        Text {
            text: "LV Contactor State: " + mbms.LvContactorState
        }
        Text {
            text: "Charge Contactor State: " + mbms.ChargeContactorState
        }
        Text {
            text: "Common Contactor Error: " + mbms.CommonContactorError
        }
        Text {
            text: "Motor Contactor Error: " + mbms.MotorContactorError
        }
        Text {
            text: "Array Contactor Error: " + mbms.ArrayContactorError
        }
        Text {
            text: "LV Contactor Error: " + mbms.LvContactorError
        }
        Text {
            text: "Charge Contactor Error: " + mbms.ChargeContactorError
        }
        Text {
            text: "Strobe BMS Light: " + mbms.StrobeBmsLight
        }
        Text {
            text: "Allow Charge: " + mbms.AllowCharge
        }
        Text {
            text: "High Voltage Enable State: " + mbms.HighVoltageEnableState
        }
        Text {
            text: "Allow Discharge: " + mbms.AllowDischarge
        }
        Text {
            text: "Orion CAN Received Recently: " + mbms.OrionCanReceivedRecently
        }
        Text {
            text: "Discharge Should Trip: " + mbms.DischargeShouldTrip
        }
        Text {
            text: "Charge Should Trip: " + mbms.ChargeShouldTrip
        }
        Text {
            text: "Auxillary Battery Voltage: " + mbms.AuxillaryBatteryVoltage
        }
        Text {
            text: "Motor Voltage: " + mbms.MotorVoltage
        }
        Text {
            text: "Array Voltage: " + mbms.ArrayVoltage
        }
        Text {
            text: "LV Voltage: " + mbms.LvVoltage
        }
        Text {
            text: "Charge Voltage: " + mbms.ChargeVoltage
        }
        Text {
            text: "Common Current: " + mbms.CommonCurrent
        }
        Text {
            text: "Motor Current: " + mbms.MotorCurrent
        }
        Text {
            text: "Array Current: " + mbms.ArrayCurrent
        }
        Text {
            text: "LV Current: " + mbms.LvCurrent
        }
        Text {
            text: "Charge Current: " + mbms.ChargeCurrent
        }
        Text {
            text: "High Cell Voltage Trip: " + mbms.HighCellVoltageTrip
        }
        Text {
            text: "Low Cell Voltage Trip: " + mbms.LowCellVoltageTrip
        }
        Text {
            text: "High Common Current Trip: " + mbms.HighCommonCurrentTrip
        }
        Text {
            text: "Motor High Temperature Current Trip: " + mbms.MotorHighTemperatureCurrentTrip
        }
        Text {
            text: "Array High Temperature Current Trip: " + mbms.ArrayHighTemperatureCurrentTrip
        }
        Text {
            text: "LV High Temperature Current Trip: " + mbms.LvHighTemperatureCurrentTrip
        }
        Text {
            text: "Charge High Temperature Current Trip: " + mbms.ChargeHighTemperatureCurrentTrip
        }
        Text {
            text: "Protection Trip: " + mbms.ProtectionTrip
        }
        Text {
            text: "Orion Message Timeout Trip: " + mbms.OrionMessageTimeoutTrip
        }
        Text {
            text: "Contactor Disconnected Unexpectedly Trip: " + mbms.ContactorDisconnectedUnexpectedlyTrip
        }
    }
}
