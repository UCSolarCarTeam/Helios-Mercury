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
            text: "Channel Number: " + mppt0.ChannelNumber
        }
        Text {
            text: "MPPT Status: " + mppt0.MpptStatus
        }
        Text {
            text: "Array Voltage: " + mppt0.ArrayVoltage
        }
        Text {
            text: "Array Current: " + mppt0.ArrayCurrent
        }
        Text {
            text: "Battery Voltage: " + mppt0.BatteryVoltage
        }
        Text {
            text: "Temperature: " + mppt0.Temperature
        }
    }
}
