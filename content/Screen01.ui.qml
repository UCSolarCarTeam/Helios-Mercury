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
        id: column1
        anchors.left: parent.left
        anchors.top: label.bottom
        width: childrenRect.width
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
        id: motorDetails0Column
        anchors.left: parent.right
        anchors.top: label.bottom
        width: childrenRect.width
        Text {
            text: "Control Value: " + motorDetails0.ControlValue
        }
        Text {
            text: "Control Mode: " + motorDetails0.ControlMode
        }
        Text {
            text: "Motor Mode: " + motorDetails0.MotorMode
        }
        Text {
            text: "Software Enable: " + motorDetails0.SoftwareEnable
        }
        Text {
            text: "Debug Mode: " + motorDetails0.DebugMode
        }
        Text {
            text: "Current Motor Torque: " + motorDetails0.CurrentMotorTorque
        }
        Text {
            text: "Current RPM Value: " + motorDetails0.CurrentRpmValue
        }
        Text {
            text: "Motor Temperature: " + motorDetails0.MotorTemperature
        }
        Text {
            text: "Inverter Peak Current: " + motorDetails0.InverterPeakCurrent
        }
        Text {
            text: "Current Motor Power: " + motorDetails0.CurrentMotorPower
        }
        Text {
            text: "Absolute Angle: " + motorDetails0.AbsuluteAngle
        }
        Text {
            text: "Motor About To Stall: " + motorDetails0.MotorAboutToStall
        }
        Text {
            text: "Delay In Reading Temp Sensor: " + motorDetails0.DelayInReadingTempSensor
        }
        Text {
            text: "Delay In Reading Pos Sensor: " + motorDetails0.DelayInReadingPosSensor
        }
        Text {
            text: "Inverter 1 Temp Very High: " + motorDetails0.Inverter1TempVeryHigh
        }
        Text {
            text: "Inverter 2 Temp Very High: " + motorDetails0.Inverter2TempVeryHigh
        }
        Text {
            text: "Inverter 3 Temp Very High: " + motorDetails0.Inverter3TempVeryHigh
        }
        Text {
            text: "Inverter 4 Temp Very High: " + motorDetails0.Inverter4TempVeryHigh
        }
        Text {
            text: "Inverter 5 Temp Very High: " + motorDetails0.Inverter5TempVeryHigh
        }
        Text {
            text: "Inverter 6 Temp Very High: " + motorDetails0.Inverter6TempVeryHigh
        }
        Text {
            text: "CPU Temperature Very High: " + motorDetails0.CpuTemperatureVeryHigh
        }
        Text {
            text: "Hall Temperature Very High: " + motorDetails0.HallTemperatureVeryHigh
        }
        Text {
            text: "DCLINK Temperature Very High: " + motorDetails0.DclinkTemperatureVeryHigh
        }
        Text {
            text: "Delay In DCLINK Communication: " + motorDetails0.DelayInDclinkCommunication
        }
        Text {
            text: "Inverter 1 Over Current Warning: " + motorDetails0.Inverter1OverCurrentWarning
        }
        Text {
            text: "Inverter 2 Over Current Warning: " + motorDetails0.Inverter2OverCurrentWarning
        }
        Text {
            text: "Inverter 3 Over Current Warning: " + motorDetails0.Inverter3OverCurrentWarning
        }
        Text {
            text: "Inverter 4 Over Current Warning: " + motorDetails0.Inverter4OverCurrentWarning
        }
        Text {
            text: "Inverter 5 Over Current Warning: " + motorDetails0.Inverter5OverCurrentWarning
        }
        Text {
            text: "Inverter 6 Over Current Warning: " + motorDetails0.Inverter6OverCurrentWarning
        }
        Text {
            text: "DC Overvoltage Warning: " + motorDetails0.DcOvervoltageWarning
        }
        Text {
            text: "DC Undervoltage Warning: " + motorDetails0.DcUndervoltageWarning
        }
        Text {
            text: "CAN Comms Timeout: " + motorDetails0.CanCommsTimeout
        }
        Text {
            text: "Inverter 1 Fault Warning: " + motorDetails0.Inverter1FaultWarning
        }
        Text {
            text: "Inverter 2 Fault Warning: " + motorDetails0.Inverter2FaultWarning
        }
        Text {
            text: "Inverter 3 Fault Warning: " + motorDetails0.Inverter3FaultWarning
        }
        Text {
            text: "Inverter 4 Fault Warning: " + motorDetails0.Inverter4FaultWarning
        }
        Text {
            text: "Inverter 5 Fault Warning: " + motorDetails0.Inverter5FaultWarning
        }
        Text {
            text: "Inverter 6 Fault Warning: " + motorDetails0.Inverter6FaultWarning
        }
        Text {
            text: "CAN Send Warning: " + motorDetails0.CanSendWarning
        }
        Text {
            text: "Lost Frames On CAN Bus Warning: " + motorDetails0.LostFramesOnCanBusWarning
        }
        Text {
            text: "Overspeed Warning: " + motorDetails0.OverspeedWarning
        }
        Text {
            text: "CPU Overload: " + motorDetails0.CpuOverload
        }
        Text {
            text: "Torque Limited: " + motorDetails0.TorqueLimited
        }
        Text {
            text: "Start At High RPM: " + motorDetails0.StartAtHighRpm
        }
        Text {
            text: "Init Error: " + motorDetails0.InitError
        }
        Text {
            text: "Settings Not Found: " + motorDetails0.SettingsNotFound
        }
        Text {
            text: "Motor Stalled: " + motorDetails0.MotorStalled
        }
        Text {
            text: "Controller Data Reading Timeout: " + motorDetails0.ControllerDataReadingTimeout
        }
        Text {
            text: "Invalid Hall Sensor Sequence: " + motorDetails0.InvalidHallSensorSequence
        }
        Text {
            text: "Invalid Hall Sector: " + motorDetails0.InvalidHallSector
        }
        Text {
            text: "Error Reading Temp Sensor: " + motorDetails0.ErrorReadingTempSensor
        }
        Text {
            text: "Position Sensor Reading Error: " + motorDetails0.PositionSensorReadingError
        }
        Text {
            text: "Error Reading Encoder: " + motorDetails0.ErrorReadingEncoder
        }
        Text {
            text: "Zero Position Offset Not Set: " + motorDetails0.ZeroPositionOffsetNotSet
        }
        Text {
            text: "HW Enable Not Set: " + motorDetails0.HwEnableNotSet
        }
        Text {
            text: "Inverter 1 Temp Too High: " + motorDetails0.Inverter1TempTooHigh
        }
        Text {
            text: "Inverter 2 Temp Too High: " + motorDetails0.Inverter2TempTooHigh
        }
        Text {
            text: "Inverter 3 Temp Too High: " + motorDetails0.Inverter3TempTooHigh
        }
        Text {
            text: "Inverter 4 Temp Too High: " + motorDetails0.Inverter4TempTooHigh
        }
        Text {
            text: "Inverter 5 Temp Too High: " + motorDetails0.Inverter5TempTooHigh
        }
        Text {
            text: "Inverter 6 Temp Too High: " + motorDetails0.Inverter6TempTooHigh
        }
        Text {
            text: "CPU Temperature Too High: " + motorDetails0.CpuTemperatureTooHigh
        }
        Text {
            text: "Hall Temperature Too High: " + motorDetails0.HallTemperatureTooHigh
        }
        Text {
            text: "DCLINK Temperature Too High: " + motorDetails0.DclinkTemperatureTooHigh
        }
        Text {
            text: "Error In DCLINK Communication: " + motorDetails0.ErrorInDclinkCommunication
        }
        Text {
            text: "Inverter 1 Overcurrent Error: " + motorDetails0.Inverter1OvercurrentError
        }
        Text {
            text: "Inverter 2 Overcurrent Error: " + motorDetails0.Inverter2OvercurrentError
        }
        Text {
            text: "Inverter 3 Overcurrent Error: " + motorDetails0.Inverter3OvercurrentError
        }
        Text {
            text: "Inverter 4 Overcurrent Error: " + motorDetails0.Inverter4OvercurrentError
        }
        Text {
            text: "Inverter 5 Overcurrent Error: " + motorDetails0.Inverter5OvercurrentError
        }
        Text {
            text: "Inverter 6 Overcurrent Error: " + motorDetails0.Inverter6OvercurrentError
        }
        Text {
            text: "DC Overvoltage Error: " + motorDetails0.DcOvervoltageError
        }
        Text {
            text: "DC Undervoltage Error: " + motorDetails0.DcUndervoltageError
        }
        Text {
            text: "Double CAN ID On Bus: " + motorDetails0.DoubleCanIdOnBus
        }
        Text {
            text: "CAN Comms Timeout Error: " + motorDetails0.CanCommsTimeoutError
        }
        Text {
            text: "Inverter 1 Fault Error: " + motorDetails0.Inverter1FaultError
        }
        Text {
            text: "Inverter 2 Fault Error: " + motorDetails0.Inverter2FaultError
        }
        Text {
            text: "Inverter 3 Fault Error: " + motorDetails0.Inverter3FaultError
        }
        Text {
            text: "Inverter 4 Fault Error: " + motorDetails0.Inverter4FaultError
        }
        Text {
            text: "Inverter 5 Fault Error: " + motorDetails0.Inverter5FaultError
        }
        Text {
            text: "Inverter 6 Fault Error: " + motorDetails0.Inverter6FaultError
        }
        Text {
            text: "CAN Send Error: " + motorDetails0.CanSendError
        }
        Text {
            text: "Lost Frames On CAN Bus Error: " + motorDetails0.LostFramesOnCanBusError
        }
        Text {
            text: "Overspeed Error: " + motorDetails0.OverspeedError
        }
        Text {
            text: "CPU Overloaded: " + motorDetails0.CpuOverloaded
        }
    }
}
