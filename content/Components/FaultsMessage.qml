// FaultsMessage.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: faultMessage
    width: parent.width
    height: 33
    radius: 8
    border.color: "black"

    property string type
    property string msg
    property string severity

    property string icon: type === "motor" ? "../Images/MotorFault.png"
                        : type === "batteryFaults" ? "../Images/BatteryFault.png"
                        : type === "mbms" ? "../Images/MotorFault.png"
                        : "" //TODO: add other icons and default icon

    property color backgroundColor: severity === "high" ? "#FC1313"
                                  : severity === "mid" ? "#F6EC93"
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
            iconMaskColor: "black"
        }

        Text {
            text: msg
            font.pixelSize: 15
            color: "black"
            verticalAlignment: Text.AlignVCenter
        }
    }
}
