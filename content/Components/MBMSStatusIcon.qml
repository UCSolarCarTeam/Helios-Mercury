import QtQuick 2.15
import QtQuick.Controls 2.15
import Mercury

Item {
    id: statusIcon
    width: 32  // Gets redefined whenever the class is called
    height: 32  // Gets redefined whenever the class is called

    property string topText: ""  
    property string bottomText: ""
    property bool isOn: false

    Column {
        width: parent.width
        spacing: 4 
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            text: statusIcon.topText
            font.pixelSize: 12
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
        }

        Text {
            text: statusIcon.bottomText
            font.pixelSize: 12
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
        }

        Image {
            source: isOn ? "../Images/MBMSStatusOn.png" : "../Images/MBMSStatusOff.png"
            width: 24
            height: 24
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}