import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    // Determines Icon Used
    property string errorType
    // Determines Message Displayed
    property string messageText
    // Determines background color, can be either low,mid,high
    property string severity


    property string icon: errorType === "motor" ? "../Images/MotorFault.png" : errorType === "sensor" ? "../Images/SensorFault.png" :
                          errorType === "battery" ? "../Images/BatteryFault.png" : ""
    property color backGroundColor: severity === "high" ? "#FC1313" :  // Red for severe
                                 severity === "mid" ? "#F6EC93" :     // Yellow for mid
                                 severity === "low" ? "#B2F693":      // Green for low
                                                      "white"       // White default
    width: 400
    height: 35
    color: backGroundColor
    radius: 10


      Row {
        spacing:20
        anchors.fill: parent

          Image {
              id: iconImage
              width:30
              height:30
              anchors.verticalCenter:text.verticalCenter
              anchors.right:text.left
              anchors.rightMargin: 20
              source: icon
          }
          Text {
              id:text
              text:messageText
              anchors.centerIn: parent
              font.pixelSize: 20
              color:"black"
          }
    }
  }
