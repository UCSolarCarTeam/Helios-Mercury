import QtQuick

Rectangle {
    id: dataSource
    width: 313
    height: 105
    color: "transparent"
    property alias cellularModemText: cellularModem.text
    property alias radioBoardText: radioBoard.text

    Text {
        id: cellularModem
        color: "#a2180f"
        text: qsTr("Cellular Modem")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.rightMargin: -1
        font.weight: Font.Normal
        font.family: "Jost"
        anchors.bottomMargin: 30
    }

    Text {
        id: radioBoard
        color: "#a2180f"
        text: qsTr("Radio Board")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.rightMargin: -1
        font.weight: Font.Normal
        font.family: "Jost"
        anchors.topMargin: 47
    }
}
