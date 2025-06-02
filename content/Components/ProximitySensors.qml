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

    /**
    * Truncates a number to a fixed number of decimal places without rounding.
    * @param {number} num - The number to truncate.
    * @param {number} decimals - The number of decimal places to keep.
    * @returns {number} The truncated number.
    */   
    function truncateToDecimal(num, decimals) {     
        var factor = Math.pow(10, decimals);
        return Math.floor(num * factor) / factor;
    }

    /**
    * Returns a color based on distance for proximity indication.
    * @param {number} distance - Distance in centimeters.
    * @returns {string} A color code from the Config object.
    */    
    function getProximityColor(distance) {    
        return distance <= 100 ? Config.proximityRed
             : distance < 500 ? Config.proximityYellow
             : distance < 1000 ? Config.proximityYellow
             : Config.proximityGreen;
    }

    /**
    * Maps distance to a visibility fraction (for UI effects).
    * @param {number} distance - Distance in centimeters.
    * @returns {number} A fractional value between 0.25 and 1.0.
    */  
    function getVisibleFraction(distance) {      
        return distance <= 100 ? 0.23
             : distance < 500 ? 0.50
             : distance < 1000 ? 0.75
             : 1.0;
    }

    /**
    * Formats a distance (in cm) as a label in meters with appropriate precision.
    * @param {number} distance - Distance in centimeters.
    * @returns {string} A formatted string like "1.2m" or "15m".
    */  
    function formatDistanceLabel(distance) {      
        var meters = distance / 100.0;
        return meters < 10
            ? truncateToDecimal(meters, 1).toFixed(1) + "m"
            : Math.round(meters) + "m";
    }

    /**
    * Returns a margin value based on the distance range.
    * @param {number} distance - Distance in centimeters.
    * @param {*} marginClose - Value when distance ≤ 100 cm.
    * @param {*} marginMidClose - Value when 100 < distance < 500 cm.
    * @param {*} marginMidFar - Value when 500 ≤ distance < 1000 cm.
    * @param {*} marginFar - Value when distance ≥ 1000 cm.
    * @returns {*} The selected margin value based on distance.
    */  
    function getMarginValue(distance, marginClose, marginMidClose, marginMidFar, marginFar) {      
        return distance <= 100 ? marginClose
            : distance < 500 ? marginMidClose
            : distance < 1000 ? marginMidFar
            : marginFar;
    }

    // === Car image ===
    DashIcon {
        id: carImage 
        width: 80
        height: 160
        anchors.horizontalCenter: proximitySensorsIcon.horizontalCenter
        imageSource: "../Images/ProximitySensorCar.png"
        iconMaskColor: Config.proximityCar
        aspectRatioWidth: 512
        aspectRatioHeight: 512
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
        iconMaskColor: getProximityColor(sensorLeftDistance)      
        visibleFraction: getVisibleFraction(sensorLeftDistance)
        aspectRatioWidth: 128
        aspectRatioHeight: 128
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
        anchors {
            horizontalCenter: carImage.horizontalCenter
            top: carImage.bottom
            topMargin: 4
            horizontalCenterOffset: -15
        }
        transform: Rotation {
            origin.x: width / 2
            origin.y: height / 2
            angle: 0
        }
        imageSource: "../Images/ProximitySensorBarsIcon.png"
        iconMaskColor: getProximityColor(sensorCenterLeftDistance)  
        visibleFraction: getVisibleFraction(sensorCenterLeftDistance)
        aspectRatioWidth: 128
        aspectRatioHeight: 128
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
        anchors {
            horizontalCenter: carImage.horizontalCenter
            top: carImage.bottom
            topMargin: 4
            horizontalCenterOffset: 16
        }
        transform: Rotation {
            origin.x: width / 2
            origin.y: height / 2
            angle: 0
        }
        imageSource: "../Images/ProximitySensorBarsIcon.png"
        iconMaskColor: getProximityColor(sensorCenterRightDistance)    
        visibleFraction: getVisibleFraction(sensorCenterRightDistance)
        aspectRatioWidth: 128
        aspectRatioHeight: 128
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
        iconMaskColor: getProximityColor(sensorRightDistance)         
        visibleFraction: getVisibleFraction(sensorRightDistance)
        aspectRatioWidth: 128
        aspectRatioHeight: 128
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
