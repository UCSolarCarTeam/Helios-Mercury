import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Effects
import Mercury

Item {
    id: proximitySensorsIcon
    width: 150
    height: 180

    // === Distance inputs ===
    property int sensorLeftDistance: proximitySensors.ProximitySensor1 
    property int sensorCenterLeftDistance: proximitySensors.ProximitySensor2
    property int sensorCenterRightDistance: proximitySensors.ProximitySensor3
    property int sensorRightDistance: proximitySensors.ProximitySensor4   

    function truncateToDecimal(num, decimals) {
        var factor = Math.pow(10, decimals);
        return Math.floor(num * factor) / factor;
    }

    function getProximityColor(distance) {
        return distance <= 100 ? Config.proximityRed
             : distance < 500 ? Config.proximityYellow
             : distance < 1000 ? Config.proximityYellow
             : Config.proximityGreen;
    }

    function getVisibleFraction(distance) {
        return distance <= 100 ? 0.25
             : distance < 500 ? 0.50
             : distance < 1000 ? 0.75
             : 1.0;
    }

    function formatDistanceLabel(distance) {
        var meters = distance / 100.0;
        return meters < 10
            ? truncateToDecimal(meters, 1).toFixed(1) + "m"
            : Math.round(meters) + "m";
    }

    function getMarginValue(distance, a, b, c, d) {
        return distance <= 100 ? a
             : distance < 500 ? b
             : distance < 1000 ? c
             : d;
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
        anchors.right: carImage.left
        anchors.top: carImage.bottom
        anchors.rightMargin: 58
        anchors.topMargin: 16
        transform: Rotation {
            origin.x: width / 2
            origin.y: height / 2
            angle: 45
        }
        imageSource: "../Images/ProximitySensorBarsIcon.png"
        iconMaskColor: getProximityColor(sensorLeftDistance)
        visibleFraction: getVisibleFraction(sensorLeftDistance)
    }
    Text {
        text: formatDistanceLabel(sensorLeftDistance)
        anchors.right: carImage.left
        anchors.top: carImage.bottom
        anchors.rightMargin: getMarginValue(sensorLeftDistance, -18, -12, -5, 2)
        anchors.topMargin: getMarginValue(sensorLeftDistance, -3, 3, 10, 16)
        transform: Rotation { angle: 45 }
        color: getProximityColor(sensorLeftDistance)
        font.pixelSize: Config.proximityFontSize
        font.bold: true
    }

    // ========== SENSOR CENTER LEFT ==========
    DashIcon {
        id: sensorCenterLeft
        width: carImage.width * 0.375
        height: carImage.height * 0.213
        anchors.horizontalCenter: carImage.horizontalCenter
        anchors.top: carImage.bottom
        anchors.topMargin: 4
        anchors.horizontalCenterOffset: -15
        transform: Rotation {
            origin.x: width / 2
            origin.y: height / 2
            angle: 0
        }
        imageSource: "../Images/ProximitySensorBarsIcon.png"
        iconMaskColor: getProximityColor(sensorCenterLeftDistance)
        visibleFraction: getVisibleFraction(sensorCenterLeftDistance)
    }
    Text {
        text: formatDistanceLabel(sensorCenterLeftDistance)
        anchors.horizontalCenter: carImage.horizontalCenter
        anchors.top: carImage.bottom
        anchors.topMargin: getMarginValue(sensorCenterLeftDistance, 16, 25, 34, 43)
        anchors.horizontalCenterOffset: -15
        transform: Rotation { angle: 0 }
        color: getProximityColor(sensorCenterLeftDistance)
        font.pixelSize: Config.proximityFontSize
        font.bold: true
    }    

    // ========== SENSOR CENTER RIGHT ==========
    DashIcon {
        id: sensorCenterRight
        width: carImage.width * 0.375
        height: carImage.height * 0.213
        anchors.horizontalCenter: carImage.horizontalCenter
        anchors.top: carImage.bottom
        anchors.topMargin: 4
        anchors.horizontalCenterOffset: 16
        transform: Rotation {
            origin.x: width / 2
            origin.y: height / 2
            angle: 0
        }
        imageSource: "../Images/ProximitySensorBarsIcon.png"
        iconMaskColor: getProximityColor(sensorCenterRightDistance)
        visibleFraction: getVisibleFraction(sensorCenterRightDistance)
    } 
    Text {
        text: formatDistanceLabel(sensorCenterRightDistance)
        anchors.horizontalCenter: carImage.horizontalCenter
        anchors.top: carImage.bottom
        anchors.topMargin: getMarginValue(sensorCenterRightDistance, 16, 25, 34, 43)
        anchors.horizontalCenterOffset: 17
        transform: Rotation { angle: 0 }
        color: getProximityColor(sensorCenterRightDistance)
        font.pixelSize: Config.proximityFontSize
        font.bold: true
    }        

    // ========== SENSOR RIGHT ==========
    DashIcon {
        id: sensorRight
        width: carImage.width * 0.375
        height: carImage.height * 0.207
        anchors.left: carImage.right
        anchors.top: carImage.bottom
        anchors.leftMargin: 25
        anchors.topMargin: -68
        transform: Rotation {
            origin.x: width / 2
            origin.y: height / 2
            angle: -45
        }
        imageSource: "../Images/ProximitySensorBarsIcon.png"
        iconMaskColor: getProximityColor(sensorRightDistance)
        visibleFraction: getVisibleFraction(sensorRightDistance)
    }    

    Text {
        text: formatDistanceLabel(sensorRightDistance)
        anchors.left: carImage.right
        anchors.top: carImage.bottom
        anchors.leftMargin: getMarginValue(sensorRightDistance, -8, -2, 6, 11)
        anchors.topMargin: getMarginValue(sensorRightDistance, 18, 25, 31, 36)
        transform: Rotation { angle: -45 }
        color: getProximityColor(sensorRightDistance)
        font.pixelSize: Config.proximityFontSize
        font.bold: true
    }       
}
