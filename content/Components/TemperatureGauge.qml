import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Effects
import "../Config"

Item {
    id: temperatureGauge
    property real baseWidth: 350
    property real baseHeight: 108
    width: baseWidth
    height: baseHeight

    // Temperature properties
    property real temperatureValue: 100
    property real minTemp: 0
    property real maxTemp: 100
    property real neutralLowerBound: 30
    property real neutralUpperBound: 70

    // Variable for defining gauge label
    property string gaugeLabel

    // Function for dynamic coloring applied on gauge components based on temperature value
    property color temperatureColor: {
        var blueColor = Qt.rgba(27/255, 70/255, 183/255, 1);     // Blue (#1B46B7)
        var lightBlueColor = Qt.rgba(79/255, 143/255, 255/255, 1); // Light Blue (#4F8FFF)
        var orangeColor = Qt.rgba(1, 140/255, 0, 1);             // Orange (#FF8C00)
        var redColor = Qt.rgba(206/255, 71/255, 39/255, 1);       // Red (#CE4727)

        var temp = Math.min(Math.max(temperatureValue, minTemp), maxTemp);
        var fraction;
        var r, g, b;

        if (temp <= neutralLowerBound) {
            fraction = (temp - minTemp) / (neutralLowerBound - minTemp);

            r = blueColor.r + fraction * (lightBlueColor.r - blueColor.r);
            g = blueColor.g + fraction * (lightBlueColor.g - blueColor.g);
            b = blueColor.b + fraction * (lightBlueColor.b - blueColor.b);

        } else if (temp >= neutralUpperBound) {
            fraction = (temp - neutralUpperBound) / (maxTemp - neutralUpperBound);
            r = orangeColor.r + fraction * (redColor.r - orangeColor.r);
            g = orangeColor.g + fraction * (redColor.g - orangeColor.g);
            b = orangeColor.b + fraction * (redColor.b - orangeColor.b);

        } else {
            fraction = (temp - neutralLowerBound) / (neutralUpperBound - neutralLowerBound);

            r = lightBlueColor.r + fraction * (orangeColor.r - lightBlueColor.r);
            g = lightBlueColor.g + fraction * (orangeColor.g - lightBlueColor.g);
            b = lightBlueColor.b + fraction * (orangeColor.b - lightBlueColor.b);
        }
        return Qt.rgba(r, g, b, 1);
    }

    Row {
        id: gaugeRow
        spacing: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        // Cool bar
        Image {
            id: cool
            source: "../Images/Cool.png"
            fillMode: Image.PreserveAspectFit
        }

        // TempBar container
        Item {
            id: tempBarContainer
            width: tempBar.implicitWidth
            height: tempBar.implicitHeight

            Image {
                id: tempBar
                source: "../Images/TempBar.png"
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
                smooth: true
                visible: false
            }

            MultiEffect {
                id: fillEffect
                anchors.fill: parent
                source: tempBar
                colorization: 1.0
                colorizationColor: temperatureColor
                antialiasing: true
                layer.enabled: true
                layer.smooth: true
            }

            // The needle is positioned relative to the tempBar.
            Rectangle {
                id: needle
                width: 20
                height: 5
                color: temperatureGauge.temperatureColor
                y: -5
                x: {
                    var clampedTemp = Math.max(temperatureGauge.minTemp, Math.min(temperatureGauge.temperatureValue, temperatureGauge.maxTemp));
                    return ((clampedTemp - temperatureGauge.minTemp) / (temperatureGauge.maxTemp - temperatureGauge.minTemp))
                           * (parent.width - width);
                }
                Behavior on x { NumberAnimation { duration: 200 } }
            }
        }

        // Hot bar
        Image {
            id: hot
            source: "../Images/Hot.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    Row {
        id: tempRow
        spacing: 0
        anchors.top: gaugeRow.bottom
        anchors.topMargin: -5
        anchors.horizontalCenter: parent.horizontalCenter

        // Thermometer icon (with a tint effect)
        Item {
            id: thermometerIconContainer
            width: thermostatIconImage.width
            height: thermostatIconImage.height

            DashIcon {
                id: thermostatIconImage
                imageSource: "../Images/ThermometerIcon.png"
                iconMaskColor: temperatureGauge.temperatureColor
                width: 24
                height: 24
            }
        }

        // Temperature reading text
        Text {
            id: temperatureText
            height: 18
            text: temperatureGauge.temperatureValue + "°C"
            color: temperatureGauge.temperatureColor
            font.pixelSize: Config.tempGaugeFontSize
            font.weight: Font.Medium
            font.family: Config.fontStyle
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignHCenter
        }
    }


    // Gauge label text at the top
    Text {
        id: gaugeLabelText
        width: parent.width
        text: gaugeLabel
        font.pixelSize: Config.tempGaugeLabelFontSize
        font.weight: Font.Medium
        font.family: Config.fontStyle
        color: Config.fontColor
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.NoWrap
    }
}
