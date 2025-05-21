import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Effects
import Mercury

Item {
    id: proximitySensorsIcon
    width: 150
    height: 180

    // === Distance inputs ===
    // property int sensorLeftDistanceCm: 33
    // property int sensorCenterLeftDistanceCm: 60
    // property int sensorCenterRightDistanceCm: 45
    // property int sensorRightDistanceCm: 15
    property int sensorLeftDistanceCm
    property int sensorCenterLeftDistanceCm
    property int sensorCenterRightDistanceCm
    property int sensorRightDistanceCm  

    Component.onCompleted: {
        console.log("Left Sensor Distance:", sensorLeftDistanceCm)
        console.log("Left-Center Sensor Distance:", sensorCenterLeftDistanceCm)
        console.log("Right-Center Sensor Distance:", sensorCenterRightDistanceCm)
        console.log("Right Sensor Distance:", sensorRightDistanceCm)
    }

    // === Car image ===
    Image {
        id: carImage
        width: 80
        height: 145
        source: "../Images/ProximitySensorCar.png"
        sourceSize: Qt.size(80, 145)
        smooth: true
    }

    // ========== SENSOR LEFT ==========
    DashIcon {
        id: sensorLeft
        width: carImage.width * 0.375
        height: carImage.height * 0.207
        anchors { 
            right: carImage.left
            top: carImage.bottom
            rightMargin: 58
            topMargin: 16
        }
        transform: Rotation {
            origin.x: width / 2
            origin.y: height / 2
            angle: 45
        }
        imageSource: "../Images/ProximitySensorBarsIcon.png"
        iconMaskColor: sensorLeftDistanceCm <= 20 ? Config.proximityRed
                    : sensorLeftDistanceCm <= 50 ? Config.proximityYellow
                    : Config.proximityGreen

        // Set visibleFraction based on sensorLeftDistanceCm:
        visibleFraction: sensorLeftDistanceCm <= 20 ? 0.25
                        : sensorLeftDistanceCm < 35 ? 0.50
                        : sensorLeftDistanceCm <= 50 ? 0.75
                        : 1.0
    }


    // ========== SENSOR CENTER LEFT ==========
    DashIcon {
        id: sensorCenterLeft
        width: carImage.width * 0.375
        height: carImage.height * 0.213
        anchors { 
            horizontalCenter: carImage.horizontalCenter
            top: carImage.bottom
            topMargin: 4
            horizontalCenterOffset: -16
        }
        transform: Rotation {
            origin.x: width / 2
            origin.y: height / 2
            angle: 0
        }
        imageSource: "../Images/ProximitySensorBarsIcon.png"
        iconMaskColor: sensorCenterLeftDistanceCm <= 20 ? Config.proximityRed
                    : sensorCenterLeftDistanceCm <= 50 ? Config.proximityYellow
                    : Config.proximityGreen
        // Set visibleFraction based on sensorLeftDistanceCm:
        visibleFraction: sensorCenterLeftDistanceCm <= 20 ? 0.25
                        : sensorCenterLeftDistanceCm < 35 ? 0.50
                        : sensorCenterLeftDistanceCm <= 50 ? 0.75
                        : 1.0                    
    }

    // ========== SENSOR CENTER RIGHT ==========
    DashIcon {
        id: sensorCenterRight
        width: carImage.width * 0.375
        height: carImage.height * 0.213
        anchors { 
            horizontalCenter: carImage.horizontalCenter
            top: carImage.bottom
            topMargin: 4
            horizontalCenterOffset: 18
        }
        transform: Rotation {
            origin.x: width / 2
            origin.y: height / 2
            angle: 0
        }
        imageSource: "../Images/ProximitySensorBarsIcon.png"
        iconMaskColor: sensorCenterRightDistanceCm <= 20 ? Config.proximityRed
                    : sensorCenterRightDistanceCm <= 50 ? Config.proximityYellow
                    : Config.proximityGreen
        // Set visibleFraction based on sensorLeftDistanceCm:
        visibleFraction: sensorCenterRightDistanceCm <= 20 ? 0.25
                        : sensorCenterRightDistanceCm < 35 ? 0.50
                        : sensorCenterRightDistanceCm <= 50 ? 0.75
                        : 1.0                    
    }    

    // ========== SENSOR RIGHT ==========
    DashIcon {
        id: sensorRight
        width: carImage.width * 0.375
        height: carImage.height * 0.207
        anchors { 
            left: carImage.right
            top: carImage.bottom
            leftMargin: 25
            topMargin: -68
        }
        transform: Rotation {
            origin.x: width / 2
            origin.y: height / 2
            angle: -45
        }
        imageSource: "../Images/ProximitySensorBarsIcon.png"
        iconMaskColor: sensorRightDistanceCm <= 20 ? Config.proximityRed
                    : sensorRightDistanceCm <= 50 ? Config.proximityYellow
                    : Config.proximityGreen
        // Set visibleFraction based on sensorLeftDistanceCm:
        visibleFraction: sensorRightDistanceCm <= 20 ? 0.25
                        : sensorRightDistanceCm < 35 ? 0.50
                        : sensorRightDistanceCm <= 50 ? 0.75
                        : 1.0                    
    }     
}
