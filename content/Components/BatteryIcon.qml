import QtQuick 2.15
import QtQuick.Effects

Item {
    id: root
    width: 170
    height: 70
    property real minValue: 0.0
    property real maxValue: 100.0
    property real value

    Image {
        id: batteryImage
        width: 35
        height: 58
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 18
        anchors.topMargin: 6
        source: "../Images/Battery.png"
        visible: true
    }

    Item {
        id: batteryFillContainer
        width: batteryImage.width
        height: batteryImage.height
        anchors.left: batteryImage.left
        anchors.top: batteryImage.top
        visible: false

        Rectangle {
            id: batteryFill
            width: parent.width
            height: parent.height * Math.max(0, Math.min(1, (root.value - root.minValue) / (root.maxValue - root.minValue)))
            anchors.bottom: parent.bottom
            color: "#20d426"

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
        anchors.left: batteryImage.left
        anchors.top: batteryImage.top
        width: batteryImage.width
        height: batteryImage.height
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
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 70
        anchors.topMargin: 20
        color: "#ffffff"
        text: {
            if (Math.floor(root.value) === root.value) {
                return Math.floor(root.value) + "%";
            } else {
                    return root.value.toFixed(1) + "%";
            }
        }
        font.pixelSize: 26
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: "SF Pro"
    }
}
