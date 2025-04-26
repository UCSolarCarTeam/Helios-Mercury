import QtQuick 2.0
import QtQuick.Effects
import Mercury

Item {
    id: batteryIcon
    width: 32
    height: 32
    property bool isOn: false

    Image {
        id: batteryImage
        anchors.fill: parent
        anchors {
            left: parent.left
        }
        source: "../Images/Arrow.png"
    }

    MultiEffect {
        anchors.fill: parent
        source: batteryImage
        colorization: 1.0 
        colorizationColor: Config.btnDisabled
        antialiasing: true
        layer.enabled: true
        layer.smooth: true
    }

    Item {
        id: batteryFillContainer
        anchors.fill: batteryImage
        visible: false

        Rectangle {
            property real elapsedTime: 0

            Timer {
                interval: 32
                running: batteryIcon.isOn
                repeat: true
                onTriggered: {
                    parent.elapsedTime += interval / 1000;
                    console.log("TEST", parent.elapsedTime)
                    console.log(parent.width)
                    if(parent.elapsedTime >= 1){
                        parent.elapsedTime = 0;
                    }
                }
            }

            id: batteryFill
            width: parent.width * Math.max(0, Math.min(1, (elapsedTime/0.66)))

            height: parent.height
            anchors.bottom: parent.bottom
            color: Config.primary
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
}
