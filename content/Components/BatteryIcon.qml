import QtQuick 2.15
import QtQuick.Effects
import Mercury

Item {
    id: batteryIcon
    width: 170
    height: 60
    property real rawValue: battery.PackStateOfCharge
    property real value: rawValue / 2 //Unit Conversion from 0.5% to 1%

    Image {
        id: batteryImage
        width: 35
        height: 60
        anchors {
            left: parent.left
        }
        source: "../Images/Battery.png"
    }

    Item {
        id: batteryFillContainer
        anchors.fill: batteryImage
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
            width: parent.width
            height: parent.height * Math.max(0, Math.min(1, (batteryIcon.value) / 100))
            anchors.bottom: parent.bottom
            color: Config.primary

            Behavior on height {
                NumberAnimation { duration: 300 }
            }
        }
    }

    ShaderEffectSource {
        id: batteryMask
        sourceItem: batteryImage
        hideSource: false
    }

    ShaderEffectSource {
        id: batteryFillSource
        sourceItem: batteryFillContainer
        hideSource: true
    }

    MultiEffect {
        anchors.fill: batteryImage
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
            left: batteryImage.right
            verticalCenter: batteryIcon.verticalCenter
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
}
