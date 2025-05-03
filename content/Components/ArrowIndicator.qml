import QtQuick 2.0
import QtQuick.Effects
import Mercury

Item {
    id: arrowIndicator
    width: 32
    height: 32
    property bool isOn: false

    Image {
        id: arrowImage
        anchors.fill: parent
        anchors {
            left: parent.left
        }
        source: "../Images/Arrow.png"
        visible: false
    }

    MultiEffect {
        anchors.fill: parent
        source: arrowImage
        colorization: 1.0 
        colorizationColor: Config.btnDisabled
    }

    Item {
        id: arrowFillContainer
        anchors.fill: arrowImage
        visible: false

        Rectangle {
            property real elapsedTime: 0

            Timer {
                interval: 32
                running: arrowIndicator.isOn
                repeat: true
                onTriggered: {
                    parent.elapsedTime += interval / 1000;
                    if(parent.elapsedTime >= 1){
                        parent.elapsedTime = 0;
                    }
                }
            }

            Connections {
                target: arrowIndicator
                function onIsOnChanged() {
                    if (!arrowIndicator.isOn) {
                        arrowFill.elapsedTime = 0;
                    }
                }
            }

            id: arrowFill
            width: parent.width * Math.max(0, Math.min(1, (elapsedTime/0.66)))
            height: parent.height
            anchors.bottom: parent.bottom
            color: Config.primary
        }
    }

    ShaderEffectSource {
        id: arrowMask
        sourceItem: arrowImage
        hideSource: false
    }

    ShaderEffectSource {
        id: arrowFillSource
        sourceItem: arrowFillContainer
        hideSource: true
    }

    MultiEffect {
        anchors.fill: arrowImage
        source: arrowFillSource
        maskSource: arrowMask
        maskEnabled: true
    }
}
