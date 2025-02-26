import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: prndComponent
    width: parent.width
    height: parent.height

    // Property to track selected gear (0: R, 1: N, 2: D)
    property int currentGear: 1
    property var gears: ["R", "N", "D"]

    // Poll B3 for gear updates
    Timer {
        interval: 100  // Poll every 100ms
        running: true
        repeat: true
        onTriggered: {
            if (b3.Reverse) {
                currentGear = 0;
            } else if (b3.Neutral) {
                currentGear = 1;
            } else if (b3.ForwardIn) {
                currentGear = 2;
            }
        }
    }

    // Faint Horizontal Line
    Rectangle {
        id: baseLine
        width: gearRow.width + 10
        height: 2
        color: "#aaa"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
    }

    // Blue Marker for Selected Gear
    Rectangle {
        id: gearMarker
        width: 20
        height: 4
        color: "#00A8FF"
        y: baseLine.y + (baseLine.height - height) / 2

        // Marker aligns with selected gear safely
        x: {
                    if (currentGear === 0) {
                        // Position far left (R)
                        return Math.max(gearRow.children[0].x + gearRow.x - width / 2, baseLine.x);
                    } else if (currentGear === 1) {
                        // Position in the middle (N)
                        return gearRow.children[1].x + gearRow.x + (gearRow.children[1].width - width) / 2;
                    } else if (currentGear === 2) {
                        // Position far right (D)
                        return Math.min(gearRow.children[2].x + gearRow.x + gearRow.children[2].width - width / 2, baseLine.x + baseLine.width - width);
                    }
                    return 0;
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
                font.pixelSize: 20
                color: index === currentGear ? "#00A8FF" : "white"
                opacity: 1.0
            }
        }
    }
}
