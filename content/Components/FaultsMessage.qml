import QtQuick 2.15
import QtQuick.Controls 2.15


Rectangle {
    id:mainContainer
    anchors.horizontalCenter: parent.horizontalCenter
    // Determines Icon Used
    property string errorType
    // Determines Message Displayed
    property string messageText
    // Determines background color, can be either low,mid,high
    property string severity
    property bool visibile:false
    property string icon: errorType === "motor" ? "../Images/MotorFault.png" : errorType === "battery" ? "../Images/BatteryFault.png" : ""
    property color backGroundColor: severity === "high" ? "#FC1313" :  // Red for severe
                                 severity === "mid" ? "#F6EC93" :     // Yellow for mid
                                                      "white"       // White default
    color:backGroundColor
    radius: 8
    border.color: 'black'
    Row {
        id:row
        anchors.centerIn: mainContainer
        Image {
            id: iconImage
            width:25
            height:25
            source: icon
        }
        Text {
            height:row.height
            verticalAlignment:Text.AlignVCenter
            id:text
            text:messageText
            font.pixelSize: 15
            color:"black"
        }
  }
}
