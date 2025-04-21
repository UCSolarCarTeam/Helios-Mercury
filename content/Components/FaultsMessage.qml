// FaultsMessage.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: faultMessage
    width: parent ? parent.width : 426
    height: 33
    radius: 8
    border.color: "black"

    property string errorType
    property string messageText
    property string severity

    property string icon: errorType === "motor" ? "../Images/MotorFault.png"
                           : errorType === "battery" ? "../Images/BatteryFault.png"
                           : ""
    property color backGroundColor: severity === "high" ? "#FC1313"
                                      : severity === "mid" ? "#F6EC93"
                                      : "white"
    color: backGroundColor

    Row {
        anchors.fill: parent
        anchors.margins: 5
        spacing: 8
        Image {
            source: icon
            width: icon ? 25 : 0
            height: icon ? 25 : 0
            visible: icon !== ""
        }
        Text {
            text: messageText
            font.pixelSize: 15
            color: "black"
            verticalAlignment: Text.AlignVCenter
        }
    }
}
