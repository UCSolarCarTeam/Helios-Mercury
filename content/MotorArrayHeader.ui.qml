import QtQuick

Rectangle {
    id: motorArrayHeader
    width: 1062
    height: 108
    color: "transparent"
    property alias motorLeftCurrentText: motorLeftCurrent.text
    property alias motorRightCurrentText: motorRightCurrent.text
    property alias totalArraysCurrentText: totalArraysCurrent.text

    Text {
        id: motorRightCurrent
        color: "#a2180f"
        text: qsTr("Motor R Current: 100 A")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.rightMargin: 476
        font.weight: Font.Normal
        anchors.leftMargin: 1
        font.family: "Jost"
        anchors.bottomMargin: 50
    }

    Text {
        id: motorLeftCurrent
        color: "#a2180f"
        text: qsTr("Motor L Current: 100 A")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.rightMargin: 476
        font.weight: Font.Normal
        anchors.leftMargin: 1
        font.family: "Jost"
        anchors.topMargin: 50
    }

    Text {
        id: totalArraysCurrent
        color: "#a2180f"
        text: qsTr("Total Arrays Current: 100 A")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.rightMargin: -2
        font.weight: Font.Normal
        anchors.leftMargin: 479
        font.family: "Jost"
        anchors.bottomMargin: 11
        anchors.topMargin: 39
    }
}
