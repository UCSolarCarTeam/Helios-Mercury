import QtQuick 2.15
import QtQuick.Controls 2.15
import Mercury

Item {
    id: statusIcon
    width: 65  // Gets redefined when used
    height: 50 // Gets redefined when used

    property string label: ""
    property bool isOn

    property int columnSpacing: 5

    onIsOnChanged: {
        statusImage.source = isOn ? "../Images/MpptMbmsStatusOn.png" : "../Images/MpptMbmsStatusOff.png"
        statusImage.iconMaskColor = isOn ? Config.contactorConnectedColor : Config.contactorDisconnectedColor
    }

    Column {
        width: parent.width
        spacing: parent.columnSpacing
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            width: parent.width
            text: statusIcon.label
            font.pixelSize: Config.contactorLabelFontSize
            color: Config.fontColor
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: Config.fontStyle
        }

        DashIcon {
            id: statusImage
            width: 24
            height: 24
            anchors.horizontalCenter: parent.horizontalCenter
            imageSource: statusIcon.isOn ? "../Images/MpptMbmsStatusOn.png" : "../Images/MpptMbmsStatusOff.png"
            iconMaskColor: statusIcon.isOn ? Config.contactorConnectedColor : Config.contactorDisconnectedColor
        }
    }
}
