import QtQuick 2.15
import QtQuick.Effects
import Mercury

Item {
    id: batteryIcon
    property real rawValue: battery.PackStateOfCharge
    property real value: rawValue / 2 //Unit Conversion from 0.5% to 1%

    function getBatteryColor(value) {
        if (value>75) 
            return Config.valueLow
        if (value<=75 && value>=25)
            return Config.valueModerate
        if (value < 25)
            return Config.valueHigh
    }
    Item {
        width: 60
        height: 25
        id: batteryImageAndPercentage
        anchors {
            top: batteryGauge.bottom
            topMargin: 10
            horizontalCenter: batteryGauge.horizontalCenter
        }
        Image {
            id: batteryImage
            width: 30
            height: parent.height
            source: "../Images/Battery.png"
        }
        Text {
            id: batteryPercentage
            width: 30
            height: parent.height
            anchors {
                left: batteryImage.right
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
        
    Rectangle {
        id: batteryGauge
        width: 340
        height: 20
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
            color: getBatteryColor(batteryIcon.value)
            Behavior on color {
                ColorAnimation { duration: 300 }
            }
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
        id: batteryLow
        width: 35
        height: 15
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
        width: 75
        height: 15
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


