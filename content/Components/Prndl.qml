import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: prndComponent
    width: 150  // Scaled down
    height: 80  // Scaled down

    // Property to track selected gear (0: P, 1: R, 2: N, 3: D)
    property int currentGear: 0
    property var gears: ["P", "R", "N", "D"]

    // Faint Horizontal Line (now matches gear row width)
    Rectangle {
        id: baseLine
        width: gearRow.width
        height: 2
        color: "#aaa" // Faint gray line
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
    }

    // Blue Marker for Selected Gear
    Rectangle {
        id: gearMarker
        width: 10
        height: 3
        color: "blue"
        y: baseLine.y - height / 2

        // Corrected positioning over the selected letter
        x: gearRow.children[currentGear].x + gearRow.x + (gearRow.children[currentGear].width - width) / 2

        Behavior on x {
            NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
        }
    }

    // Gear Letters Row
    Row {
        id: gearRow
        spacing: 15  // Adjusted for scaled size
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: baseLine.bottom
        anchors.topMargin: 5

        Repeater {
            model: gears.length

            Text {
                text: gears[index]
                font.pixelSize: 20  // Scaled down
                color: index === currentGear ? "blue" : "white"
                opacity: 1.0

                MouseArea {
                    anchors.fill: parent
                    onClicked: prndComponent.currentGear = index
                }
            }
        }
    }
}
