import QtQuick 2.15
import Qt5Compat.GraphicalEffects

Item {
    id: root
    width: 140
    height: 70

    property int minValue: 0
    property int maxValue: 100
    property int value

    Image {
        id: batteryImage
        width: 35
        height: 58
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 18
        anchors.topMargin: 6
        source: "../Images/Battery.png"
    }

    Item {
        id: batteryFillContainer
        width: batteryImage.width
        height: batteryImage.height
        anchors.left: batteryImage.left
        anchors.top: batteryImage.top

        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: batteryImage
        }

        Rectangle {
            id: batteryFill
            width: parent.width
            height: parent.height * ((root.value - root.minValue) / (root.maxValue - root.minValue))
            anchors.bottom: parent.bottom
            color: "#20d426"
            opacity: 1.0

            Behavior on height {
                NumberAnimation { duration: 300 }
            }
        }
    }

    Text {
        id: batteryPercentage
        width: 70
        height: 26
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 70
        anchors.topMargin: 20
        color: "#ffffff"
        text: root.value.toString() + "%"
        font.pixelSize: 26
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: "SF Pro"
    }
}
