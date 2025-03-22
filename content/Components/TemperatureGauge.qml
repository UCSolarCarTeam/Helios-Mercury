import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Effects
import Qt5Compat.GraphicalEffects
import "../Config"

Item {
    id: root
    // Define a fixed “base” size for the overall design.
    property real baseWidth: 350
    property real baseHeight: 108
    width: baseWidth
    height: baseHeight

    // Temperature properties
    property real temperatureValue: 100
    property real minTemp: 0
    property real maxTemp: 100
    property real neutralLowerBound
    property real neutralUpperBound

    // Variable for defining gauge label
    property string gaugeLabel

    // Function for dynamic coloring applied on gauge components based on temperature value
    property color temperatureColor: {
        // Define color stops in the gradient
        var stops = [
            { pos: 0.0,  r: 27/255,  g: 70/255,  b: 183/255 },  // Blue (#1B46B7)
            { pos: 0.33, r: 79/255,  g: 143/255, b: 255/255 },   // Light Blue (#4F8FFF)
            { pos: 0.66, r: 1,       g: 140/255, b: 0 },          // Orange (#FF8C00)
            { pos: 1.0,  r: 206/255, g: 71/255,  b: 39/255 }       // Red (#CE4727)
        ];
        var temp = Math.min(Math.max(temperatureValue, minTemp), maxTemp);
        var fraction;
        // Rapid color change to blue when temperature reaches below lower bound
        if (temp <= neutralLowerBound) {
            fraction = ((temp - minTemp) / (neutralLowerBound - minTemp)) * 0.48;
        // Rapid color change to red when temperature reaches above upper bound
        } else if (temp >= neutralUpperBound) {
            fraction = 0.52 + ((temp - neutralUpperBound) / (maxTemp - neutralUpperBound)) * (1.0 - 0.52);
        // Gradual color change when temperature is within neutral zone (play around with decimal values if needed)
        } else {
            var f = (temp - neutralLowerBound) / (neutralUpperBound - neutralLowerBound);
            fraction = 0.48 + f * (0.52 - 0.48);
        }
        // Iterate through segments of color gradient to return the correct color for a temperature value
        for (var i = 0; i < stops.length - 1; i++) {
            if (fraction >= stops[i].pos && fraction <= stops[i+1].pos) {
                var localFraction = (fraction - stops[i].pos) / (stops[i+1].pos - stops[i].pos);
                var r = stops[i].r + localFraction * (stops[i+1].r - stops[i].r);
                var g = stops[i].g + localFraction * (stops[i+1].g - stops[i].g);
                var b = stops[i].b + localFraction * (stops[i+1].b - stops[i].b);
                return Qt.rgba(r, g, b, 1);
            }
        }
        var last = stops[stops.length - 1];
        return Qt.rgba(last.r, last.g, last.b, 1);
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
            }

            // The needle is positioned relative to the tempBar.
            Rectangle {
                id: needle
                width: 20
                height: 5
                color: root.temperatureColor
                y: -5
                x: {
                    var clampedTemp = Math.max(root.minTemp, Math.min(root.temperatureValue, root.maxTemp));
                    return ((clampedTemp - root.minTemp) / (root.maxTemp - root.minTemp))
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

            Image {
                id: thermostatIconImage
                width: 20
                height: 20
                source: "../Images/ThermometerIcon.png"
                fillMode: Image.PreserveAspectFit
            }
            ColorOverlay {
                anchors.fill: thermostatIconImage
                source: thermostatIconImage
                color: root.temperatureColor
            }
        }

        // Temperature reading text
        Text {
            id: temperatureText
            height: 18
            text: root.temperatureValue + "°C"
            color: root.temperatureColor
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
