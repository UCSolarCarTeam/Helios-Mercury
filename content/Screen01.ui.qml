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
            text: "BMU Alive: " + battery.BmuAlive
        }
        Text {
            text: "Discharge Relay Enabled: " + battery.DischargeRelayEnabled
        }
        Text {
            text: "Charge Relay Enabled: " + battery.ChargeRelayEnabled
        }
        Text {
            text: "Charger Safety Relay Enabled: " + battery.ChargerSafetyRelayEnabled
        }
        Text {
            text: "Malfunction Indicator Active: " + battery.MalfunctionIndicatorActive
        }
        Text {
            text: "Multi Purpose Input Signal Status: " + battery.MultiPurposeInputSignalStatus
        }
        Text {
            text: "Always On Signal Status: " + battery.AlwaysOnSignalStatus
        }
        Text {
            text: "Is Ready Signal Status: " + battery.IsReadySignalStatus
        }
        Text {
            text: "Is Charging Signal Status: " + battery.IsChargingSignalStatus
        }
        Text {
            text: "Populated Cells: " + battery.PopulatedCells
        }
        Text {
            text: "Input 12V: " + battery.Input12V
        }
        Text {
            text: "Fan Voltage: " + battery.FanVoltage
        }
        Text {
            text: "Pack Current: " + battery.PackCurrent
        }
        Text {
            text: "Pack Voltage: " + battery.PackVoltage
        }
        Text {
            text: "Pack State Of Charge: " + battery.PackStateOfCharge
        }
        Text {
            text: "Pack Amphours: " + battery.PackAmphours
        }
        Text {
            text: "Pack Depth Of Discharge: " + battery.PackDepthOfDischarge
        }
        Text {
            text: "High Temperature: " + battery.HighTemperature
        }
        Text {
            text: "High Thermistor Id: " + battery.HighThermistorId
        }
        Text {
            text: "Low Temperature: " + battery.LowTemperature
        }
        Text {
            text: "Low Thermistor Id: " + battery.LowThermistorId
        }
        Text {
            text: "Average Temperature: " + battery.AverageTemperature
        }
        Text {
            text: "Internal Temperature: " + battery.InternalTemperature
        }
        Text {
            text: "Fan Speed: " + battery.FanSpeed
        }
        Text {
            text: "Requested Fan Speed: " + battery.RequestedFanSpeed
        }
        Text {
            text: "Low Cell Voltage: " + battery.LowCellVoltage
        }
        Text {
            text: "Low Cell Voltage Id: " + battery.LowCellVoltageId
        }
        Text {
            text: "High Cell Voltage: " + battery.HighCellVoltage
        }
        Text {
            text: "High Cell Voltage Id: " + battery.HighCellVoltageId
        }
        Text {
            text: "Average Cell Voltage: " + battery.AverageCellVoltage
        }
    }
}
