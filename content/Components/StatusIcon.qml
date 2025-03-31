import QtQuick 2.15
import QtQuick.Controls 2.15
import Mercury

Item {
    id: statusIcon
    width: 32  // Gets redefined when used
    height: 32 // Gets redefined when used

    property string label: ""
    property bool isOn: false 

    Column {
        width: parent.width
        spacing: 4
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            text: statusIcon.label
            font.pixelSize: Config.mpptmbmsFontSizeS
            color: Config.fontColor
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
        }

        Image {
            width: 24
            height: 24
            anchors.horizontalCenter: parent.horizontalCenter
            source: isOn ? "../Images/MpptMbmsStatusOn.png" : "../Images/MpptMbmsStatusOff.png"
            sourceSize: Qt.size(22, 22)
        }
    }
}
