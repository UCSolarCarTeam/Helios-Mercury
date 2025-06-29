// FaultsMessage.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import Mercury

Rectangle {
    id: faultMessage
    width: parent.width
    height: 33
    radius: 8
    border.color: "black"
    border.width: 1

    property string type
    property string msg
    property string severity

    property string icon: type === "motor" ? "../Images/MotorFault.png"
                        : type === "batteryFaults" ? "../Images/BatteryFault.png"
                        : type === "mbms" ? "../Images/MotorFault.png"
                        : "" //TODO: add other icons and default icon

    property color backgroundColor: severity === "error" ? Config.valueHigh
                                  : severity === "warn" ? Config.valueModerate
                                  : severity === "info" ? Config.valueLow
                                  : "white"
    color: backgroundColor

    Row {
        anchors.fill: parent
        anchors.margins: 5
        spacing: 8

        DashIcon {
            id: faultIcon
            width: icon ? 25 : 0
            height: icon ? 25 : 0
            imageSource: icon
            iconMaskColor: Config.fontColor
        }

        Text {
            text: msg
            font.pixelSize: 15
            color: Config.fontColor
            verticalAlignment: Text.AlignVCenter
        }
    }
}
