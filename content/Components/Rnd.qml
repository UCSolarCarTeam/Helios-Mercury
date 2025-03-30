import QtQuick 2.15
import QtQuick.Controls 2.15
import Mercury
import "../Config"
import QtQuick.Effects

Item {
    id: rndComponent
    width: 180
    height: 50

    // Property to track selected gear (0: R, 1: N, 2: D)
    property var gears: ["R", "N", "D"]
    property int currentGear: b3.Reverse ? 0 : (b3.ForwardIn ? 2 : 1)

    // Faint Horizontal Line
    Rectangle {
        id: baseLine
        width: gearRow.width + 10
        height: 2
        color: Config.faintGrey
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
    }

    // Blue Marker for Selected Gear
    Rectangle {
        id: gearMarker
        width: 24
        height: 5
        color: Config.primary
        y: baseLine.y + (baseLine.height - height) / 2

        // Marker aligns with selected gear safely
        x: {
            if (gearRow.children.length < gears.length) {
                return 0;
            }

            switch (currentGear) {
                case 0:
                    return Math.max(gearRow.children[0].x + gearRow.x - width / 2, baseLine.x);
                case 1:
                    return gearRow.children[1].x + gearRow.x + (gearRow.children[1].width - width) / 2;
                case 2:
                    return Math.min(gearRow.children[2].x + gearRow.x + gearRow.children[2].width - width / 2, baseLine.x + baseLine.width - width);
                default:
                    return 0;
            }
        }

        Behavior on x {
            NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
        }

        // MultiEffect {
        //     source: gearMarker
        //     shadowScale: 1.25
        //     anchors.fill: gearMarker
        //     shadowColor: Config.primary
        //     shadowEnabled: true
        //     shadowBlur: 0.25
        //     shadowOpacity: 0.75
        // }
    }

    // Gear Letters Row
    Row {
        id: gearRow
        spacing: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: baseLine.bottom
        anchors.topMargin: 5

        Repeater {
            model: gears.length

            Item {
                width: gearText.width
                height: gearText.height

                Text {
                    id: gearText
                    text: gears[index]
                    font.pixelSize: Config.rndfontSize
                    color: index === currentGear ? Config.primary : Config.fontColor
                    anchors.centerIn: parent
                }

                MultiEffect {
                    source: gearText
                    anchors.fill: gearText
                    shadowEnabled: index === currentGear
                    shadowBlur: 0.25
                    shadowColor: Config.primary
                    shadowOpacity: 0.75
                    shadowScale: 1.25
                }
            }
        }
    }
}
