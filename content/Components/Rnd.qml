import QtQuick 2.15
import QtQuick.Controls 2.15
import "../Config"

Item {
    id: rndComponent
    width: 163
    height: 35

    // Property to track selected gear (0: R, 1: N, 2: D)
    property var gears: ["R", "N", "D"]
    property int currentGear: b3.Reverse ? 0 : (b3.Neutral ? 1 : 2)

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
        width: 20
        height: 4
        color: Config.tronBlue
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

            Text {
                text: gears[index]
                font.pixelSize: Config.fontSize
                color: index === currentGear ? Config.tronBlue : "white"
            }
        }
    }
}
