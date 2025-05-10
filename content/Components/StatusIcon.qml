import QtQuick 2.15
import QtQuick.Controls 2.15
import Mercury

Item {
    id: statusIcon
    width: 65  // Gets redefined when used
    height: 50 // Gets redefined when used

    property string label: ""
    property bool isOn: false 

    Column {
        width: parent.width
        spacing: 5
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            width: parent.width
            text: statusIcon.label
            font.pixelSize: Config.contactorLabelFontSize
            color: Config.fontColor
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.NoWrap
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: Config.fontStyle
        }

        DashIcon {
            width: 24
            height: 24
            anchors.horizontalCenter: parent.horizontalCenter
            imageSource: isOn ? "../Images/MpptMbmsStatusOn.png" : "../Images/MpptMbmsStatusOff.png"
            iconMaskColor: isOn ? Config.contactorConnectedColor : Config.contactorDisconnectedColor
        }
    }
}
