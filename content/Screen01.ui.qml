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
        anchors.top: parent.top
        spacing: 10

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
        id: column2
        anchors.left: column1.right
        anchors.top: parent.top
        anchors.leftMargin: 20
        spacing: 10
        
        Text {
            text: "Motor Setpoint: " + keyMotor.MotorSetpoint
        }
        Text {
            text: "Control Mode: " + keyMotor.ControlMode
        }
        Text {
            text: "Motor Mode: " + keyMotor.MotorMode
        }
        Text {
            text: "Software Enable: " + keyMotor.SoftwareEnable
        }
        Text {
            text: "Debug Mode: " + keyMotor.DebugMode
        }
    }
}
