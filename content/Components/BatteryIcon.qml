import QtQuick 2.15
import QtQuick.Effects
import Mercury

Item {
    id: batteryIcon
    width: 265
    height: 367
    property real rawValue: battery.PackStateOfCharge
    property real value: rawValue / 2 //Unit Conversion from 0.5% to 1%

    Image {
        id: batteryImage
        width: 31
        height: 25.71
        anchors {
            top: batteryGauge.bottom
            horizontalCenter: batteryGauge.horizontalCenter
            topMargin: 10
        }
        source: "../Images/Battery.png"
    }
    Rectangle {
        id: batteryGauge
        width: 342
        height: 23.14
        radius: 15
        anchors {
            bottom: parent.bottom
            left: parent.right
        }
    }

    Item {
        id: batteryFillContainer
        anchors.fill: batteryGauge
        visible: false

        Rectangle {
            id: batteryBackground
            width: parent.width
            height: parent.height
            anchors.bottom: parent.bottom
            color: Config.btnDisabled
        }

        Rectangle {
            id: batteryFill
            height: parent.height
            width: parent.width * Math.max(0, Math.min(1, (batteryIcon.value) / 100))
            radius:15
            anchors.bottom: parent.bottom
            color: Config.valueModerate

            Behavior on width {
                NumberAnimation { duration: 300 }
            }
        }
    }

    ShaderEffectSource {
        id: batteryMask
        sourceItem: batteryGauge
        hideSource: false
    }

    ShaderEffectSource {
        id: batteryFillSource
        sourceItem: batteryFillContainer
        hideSource: true
    }

    MultiEffect {
        anchors.fill: batteryGauge
        source: batteryFillSource
        maskSource: batteryMask
        maskEnabled: true
        maskThresholdMin: 0.0
        maskThresholdMax: 1.0
        maskSpreadAtMin: 0.0
        maskSpreadAtMax: 0.0
        maskInverted: false
    }

    Text {
        id: batteryPercentage
        width: 100
        height: 26
        anchors {
            top: batteryGauge.bottom
            left: batteryImage.right
            topMargin: 10
            leftMargin: 10
        }
        color: Config.fontColor
        text: {
            if (Math.floor(batteryIcon.value) === batteryIcon.value) {
                return Math.floor(batteryIcon.value) + " %";
            } else {
                    return batteryIcon.value.toFixed(1) + " %";
            }
        }
        font.pixelSize: Config.fontSize4
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.weight: Font.Medium
        font.family: Config.fontStyle
    }
    Text {
        id: batteryLow
        width: 37
        height: 16.29
        color: Config.fontColor
        anchors {
            right: batteryGauge.left
            verticalCenter: batteryGauge.verticalCenter
        }
        text: "0 %"
        font.pixelSize: Config.fontSize4
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.family: Config.fontStyle
    }
    Text {
        id: batteryHigh
        width: 74
        height: 16.29
        color: Config.fontColor
        anchors {
            left: batteryGauge.right
            verticalCenter: batteryGauge.verticalCenter
            leftMargin: 10
        }
        text: "100 %"
        font.pixelSize: Config.fontSize4
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.family: Config.fontStyle
    }
}
