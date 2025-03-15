import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Effects

Item {
    id: root

    // Define a fixed “base” size for the design.
    property real baseWidth: 350
    property real baseHeight: 108

    width: baseWidth
    height: baseHeight

    // Temperature properties
    property real temperatureValue: 20
    property real minTemp: 0
    property real maxTemp: 100
    property string gaugeLabel

    property color temperatureColor: {
        var clamped = Math.max(minTemp, Math.min(temperatureValue, maxTemp));
        var fraction = (clamped - minTemp) / (maxTemp - minTemp);

        var stops = [
            { pos: 0.0,  r: 27/255,  g: 70/255,  b: 183/255 },
            { pos: 0.33, r: 79/255,  g: 143/255, b: 255/255 },
            { pos: 0.66, r: 1,       g: 140/255, b: 0 },
            { pos: 1.0,  r: 206/255, g: 71/255,  b: 39/255 }
        ];

        for (var i = 0; i < stops.length - 1; i++) {
            if (fraction >= stops[i].pos && fraction <= stops[i+1].pos) {
                var localFraction = (fraction - stops[i].pos) / (stops[i+1].pos - stops[i].pos);
                var r = stops[i].r + localFraction * (stops[i+1].r - stops[i].r);
                var g = stops[i].g + localFraction * (stops[i+1].g - stops[i].g);
                var b = stops[i].b + localFraction * (stops[i+1].b - stops[i].b);
                return Qt.rgba(r, g, b, 1);
            }
        }
        return Qt.rgba(0, 0, 0, 1);
    }

    property real scaleFactor: width / baseWidth

    // Container for all content that will be scaled.
    Item {
        id: container
        width: baseWidth
        height: baseHeight
        anchors.centerIn: parent

        // Apply a uniform scale transform to the container.
        transform: Scale {
            xScale: root.scaleFactor
            yScale: root.scaleFactor
            origin.x: 0
            origin.y: 0
        }

        Image {
            id: cool
            source: "../Images/COOL.png"
            fillMode: Image.PreserveAspectFit
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 8
        }

        Image {
            id: hot
            source: "../Images/HOT.png"
            fillMode: Image.PreserveAspectFit
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 8
        }

        // TempBar in the horizontal center between COOL and HOT
        Image {
            id: tempBar
            x: 75
            source: "../Images/TempBar.png"
            anchors.verticalCenterOffset: 0
            fillMode: Image.PreserveAspectFit

            anchors.left: cool.right
            anchors.right: hot.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 8
            width: 200

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
                Behavior on x {
                    NumberAnimation { duration: 200 }
                }
            }

            // Thermometer icon anchored at the center of TempBar
            Button {
                id: thermostatIconImage
                width: thermostatIconImage.implicitWidth
                height: thermostatIconImage.implicitHeight
                icon.source: "../Images/ThermometerIcon.png"
                icon.color: root.temperatureColor
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 14
                anchors.horizontalCenterOffset: -18
                background: Rectangle {
                        color: "transparent"
                        border.width: 0
                    }
            }
        }

        Text {
            id: temperatureText
            width: root.width
            height: 18
            text: root.temperatureValue + "°C"
            color: root.temperatureColor
            font.pixelSize: 16
            font.weight: Font.Medium
            font.family: Config.fontStyle
            anchors.horizontalCenter: tempBar.horizontalCenter
            anchors.top: tempBar.bottom
            anchors.topMargin: -3
            anchors.horizontalCenterOffset: 15
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: gaugeLabelText
            width: root.width
            text: gaugeLabel
            font.pixelSize: 20
            font.weight: Font.Medium
            font.family: Config.fontStyle
            color: "white"
            transformOrigin: Item.Top
            anchors.top: root.top
            anchors.horizontalCenter: root.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.NoWrap
            z: 1
        }
    }
}
