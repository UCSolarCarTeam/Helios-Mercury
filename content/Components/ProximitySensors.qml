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
        return distance <= 100 ? Config.valueHigh
            : distance < 500 ? Config.valueModerate
            : distance < 1000 ? Config.valueModerate
            : Config.valueLow;
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
    * - < 10m: shows one decimal place (e.g., "9.4m")
    * - = 10m: shows "10m"
    * - > 10m: shows "10m+"
    *
    * @param {number} distance - Distance in centimeters.
    * @returns {string} A formatted string like "8.3m", "10m", or "10m+".
    */
    function formatDistanceLabel(distance) {
        if (distance > 1000)
            return "10m+";
        if (distance === 1000)
            return "10m";

        var meters = distance / 100.0;
        return truncateToDecimal(meters, 1).toFixed(1) + "m";
    }

    /**
    * Returns a margin value based on the distance range.
    * - ≤ 100 cm: marginClose
    * - > 100 cm and < 500 cm: marginMidClose
    * - ≥ 500 cm and < 1000 cm: marginMidFar
    * - == 1000 cm: marginExact
    * - > 1000 cm: marginFar
    *
    * @param {number} distance - Distance in centimeters.
    * @param {*} marginClose - For distance ≤ 100 cm.
    * @param {*} marginMidClose - For 100 < distance < 500 cm.
    * @param {*} marginMidFar - For 500 ≤ distance < 1000 cm.
    * @param {*} marginExact - For distance == 1000 cm.
    * @param {*} marginFar - For distance > 1000 cm.
    * @returns {*} The selected margin value.
    */
    function getMarginValue(distance, marginClose, marginMidClose, marginMidFar, marginExact, marginFar) {
        if (distance <= 100)
            return marginClose;
        if (distance < 500)
            return marginMidClose;
        if (distance < 1000)
            return marginMidFar;
        if (distance === 1000)
            return marginExact;
        return marginFar;
    }

    // === Car image ===
    DashIcon {
        id: carImage 
        width: 80
        height: 160
        anchors.horizontalCenter: proximitySensorsIcon.horizontalCenter
        imageSource: "../Images/ProximitySensorCar.png"
        iconMaskColor: Config.fontColor
        aspectRatioWidth: 512
        aspectRatioHeight: 512
    }

    // ========== SENSOR LEFT ==========
    DashIcon {
        id: sensorLeft
        width: carImage.width * 0.375
        height: carImage.height * 0.207
        anchors.right: carImage.left
        anchors.top: carImage.bottom
        anchors.rightMargin: 63
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
        anchors.rightMargin: getMarginValue(sensorLeftDistance, -15, -9, -2, 7, 3)
        anchors.topMargin: getMarginValue(sensorLeftDistance, -3, 3, 10, 16, 16)
        transform: Rotation { angle: 45 }
        color: getProximityColor(sensorLeftDistance)
        font.pixelSize: Config.fontSize1
        font.bold: true
    }

    // ========== SENSOR CENTER LEFT ==========
    DashIcon {
        id: sensorCenterLeft
        width: carImage.width * 0.375
        height: carImage.height * 0.213
        anchors.horizontalCenter: carImage.horizontalCenter
        anchors.top: carImage.bottom
        anchors.topMargin: 6
        anchors.horizontalCenterOffset: -17
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
        anchors.topMargin: getMarginValue(sensorCenterLeftDistance, 16, 25, 34, 43, 43)
        anchors.horizontalCenterOffset: -17
        transform: Rotation { angle: 0 }
        color: getProximityColor(sensorCenterLeftDistance)
        font.pixelSize: Config.fontSize1
        font.bold: true
    }

    // ========== SENSOR CENTER RIGHT ==========
    DashIcon {
        id: sensorCenterRight
        width: carImage.width * 0.375
        height: carImage.height * 0.213
        anchors.horizontalCenter: carImage.horizontalCenter
        anchors.top: carImage.bottom
        anchors.topMargin: 6
        anchors.horizontalCenterOffset: 18
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
        anchors.topMargin: getMarginValue(sensorCenterRightDistance, 16, 25, 34, 43, 43)
        anchors.horizontalCenterOffset: sensorCenterRightDistance > 1000 ? 19 : 18
        transform: Rotation { angle: 0 }
        color: getProximityColor(sensorCenterRightDistance)
        font.pixelSize: Config.fontSize1
        font.bold: true
    }   

    // ========== SENSOR RIGHT ==========
    DashIcon {
        id: sensorRight
        width: carImage.width * 0.375
        height: carImage.height * 0.207
        anchors.left: carImage.right
        anchors.top: carImage.bottom
        anchors.leftMargin: 30
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
        anchors.leftMargin: getMarginValue(sensorRightDistance, -4, 2, 9, 16, 13)
        anchors.topMargin: getMarginValue(sensorRightDistance, 18, 24, 30, 36, 39)
        transform: Rotation { angle: -45 }
        color: getProximityColor(sensorRightDistance)
        font.pixelSize: Config.fontSize1
        font.bold: true
    }       
}
