import QtQuick
import QtQuick.Controls
import Mercury

Item {
    id: raceClusterHeader
    width: 440
    height: 40

    Text {
        id: motor0
        anchors.left: parent.left
        anchors.top: parent.top
        width: 120
        height: 16
        text: "Motor 0 current: " + motorDetails0.InverterPeakCurrent + " A"
        font.pixelSize: 12
        color: "white"
    }

    Text {
        id: motor1
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width: 120
        height: 16
        text: "Motor 1 current: " + motorDetails1.InverterPeakCurrent + " A"
        font.pixelSize: 12
        color: "white"
    }

    Row {
        id: arrayCurrentRow
        x: 182
        width: 255
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        Text {
            id: totalArrayCurrentLabel
            width: 120
            height: 16
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 120
            text: "Array Current:"
            font.pixelSize: 12
            color: "white"
        }

        Grid {
            id: arrayCurrentGrid
            columns: 2  // Two columns (2x2 layout)
            rows: 2
            spacing: 5  // Adjust spacing as needed

            Text {
                id: totalArrayCurrent0s
                width: 90
                height: 16
                text: "0: " + mppt0.ArrayCurrent + " mA"
                font.pixelSize: 12
                color: "white"
            }

            Text {
                id: totalArrayCurrent1
                width: 90
                height: 16
                text: "1: " + mppt1.ArrayCurrent + " mA"
                font.pixelSize: 12
                color: "white"
            }

            Text {
                id: totalArrayCurrent2
                width: 90
                height: 16
                text: "2: " + mppt2.ArrayCurrent + " mA"
                font.pixelSize: 12
                color: "white"
            }

            Text {
                id: totalArrayCurrent3
                width: 90
                height: 16
                text: "3: " + mppt3.ArrayCurrent + " mA"
                font.pixelSize: 12
                color: "white"
            }
        }
    }
}
