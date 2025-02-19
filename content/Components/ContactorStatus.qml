import QtQuick
import QtQuick.Controls

Item {
    id: contactorStatusFrame
    width: 45
    height: 40

    property string contactor
    property bool isConnected: false


    Text{
        id: contactorTitle
        text: contactor
        font.pixelSize: 12
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Image {
        id: contactorIcon
        width: 24
        height:24
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 2
        source: isConnected ? "../Images/ContactorConnected.png" : "../Images/ContactorDisconnected.png"
    }
}
