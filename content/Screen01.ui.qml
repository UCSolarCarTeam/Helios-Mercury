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
        anchors.top: parent.top
        anchors.topMargin: 100
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            text: "Right Signal In: " + b3.RightSignalIn
        }
        Text {
            text: "Left Signal In: " + b3.LeftSignalIn
        }
        Text {
            text: "Hazard Lights In: " + b3.HazardLightsIn
        }
        Text {
            text: "Headlights Switch In: " + b3.HeadlightsSwitchIn
        }
        Text {
            text: "Forward Switch In: " + b3.ForwardSwitchIn
        }
        Text {
            text: "Horn Switch In: " + b3.HornSwitchIn
        }
        Text {
            text: "Forward In: " + b3.ForwardIn
        }
        Text {
            text: "Neutral: " + b3.Neutral
        }
        Text {
            text: "Reverse: " + b3.Reverse
        }
        Text {
            text: "Brake Switch: " + b3.BrakeSwitch
        }
        Text {
            text: "Handbrake Switch: " + b3.HandbrakeSwitch
        }
        Text {
            text: "Motor Reset: " + b3.MotorReset
        }
        Text {
            text: "Race Mode: " + b3.RaceMode
        }
        Text {
            text: "Lap: " + b3.Lap
        }
        Text {
            text: "Zoom Zoom: " + b3.ZoomZoom
        }
        Text {
            text: "Acceleration: " + b3.Acceleration
        }
        Text {
            text: "Regen Braking: " + b3.RegenBraking
        }
        Text {
            text: "Right Signal Out: " + b3.RightSignalOut
        }
        Text {
            text: "Left Signal Out: " + b3.LeftSignalOut
        }
        Text {
            text: "Daytime Running Light Signal Out: " + b3.DaytimeRunningLightSignalOut
        }
        Text {
            text: "Headlight Signal Out: " + b3.HeadlightSignalOut
        }
        Text {
            text: "Brake Light Signal Out: " + b3.BrakeLightSignalOut
        }
        Text {
            text: "Horn Signal Out: " + b3.HornSignalOut
        }
    }
}
