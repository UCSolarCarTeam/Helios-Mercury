import QtQuick 2.15

Item {
    id: root
    width: 140
    height: 70

    property int minValue: 0
    property int maxValue: 100
    property string units: "%"
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

    Text {
        id: batteryPercentage
        width: 70
        height: 26
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 70
        anchors.topMargin: 20
        color: "#ffffff"
        text: root.value.toString() + root.units
        font.pixelSize: 26
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: "SF Pro"
    }
}
