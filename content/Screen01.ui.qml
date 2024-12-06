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
        anchors.left: parent.left
        anchors.leftMargin: 300

        Text {
            text: "GPS Year: " + telemetry.GpsYear
        }
        Text {
            text: "GPS Month: " + telemetry.GpsMonth
        }
        Text {
            text: "GPS Day: " + telemetry.GpsDay
        }
        Text {
            text: "GPS Hour: " + telemetry.GpsHour
        }
        Text {
            text: "GPS Minute: " + telemetry.GpsMinute
        }
        Text {
            text: "GPS Second: " + telemetry.GpsSecond
        }
        Text {
            text: "GPS Validity Flags: " + telemetry.GpsValidityFlags
        }
        Text {
            text: "GPS Fix Status Flags: " + telemetry.GpsFixStatusFlags
        }
        Text {
            text: "GPS Additional Flags: " + telemetry.GpsAdditionalFlags
        }
        Text {
            text: "GPS Longitude: " + telemetry.GpsLongitude
        }
        Text {
            text: "GPS Latitude: " + telemetry.GpsLatitude
        }
        Text {
            text: "MPU Acceleration X: " + telemetry.MpuAccelerationX
        }
        Text {
            text: "MPU Acceleration Y: " + telemetry.MpuAccelerationY
        }
        Text {
            text: "MPU Acceleration Z: " + telemetry.MpuAccelerationZ
        }
        Text {
            text: "MPU Rotation X: " + telemetry.MpuRotationX
        }
        Text {
            text: "MPU Rotation Y: " + telemetry.MpuRotationY
        }
        Text {
            text: "MPU Rotation Z: " + telemetry.MpuRotationZ
        }
        Text {
            text: "MPU Temperature: " + telemetry.MpuTemperature
        }
    }
}
