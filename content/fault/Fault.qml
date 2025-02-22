import QtQuick
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0

Rectangle {
    id: fault
    width: 434
    height: 35
    color: "transparent"
    property alias faultTextText: faultText.text

    SvgPathItem {
        id: faultRectagle
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        strokeStyle: 1
        joinStyle: 0
        strokeColor: "#650808"
        anchors.rightMargin: 0
        fillColor: "#650808"
        antialiasing: true
        path: "M 0 0 L 433.6658630371094 0 L 433.6658630371094 35.23417663574219 L 0 35.23417663574219 L 0 0 Z"
        strokeWidth: 1
        anchors.bottomMargin: 0
    }

    Text {
        id: faultText
        height: 23
        color: "#000000"
        text: qsTr("Motor Fault: Left Motor is non-functional")
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        font.family: "Jost"
        anchors.verticalCenterOffset: 0
        styleColor: "#650808"
        anchors.leftMargin: 11
        style: Text.Outline
        anchors.rightMargin: 15
    }
}
