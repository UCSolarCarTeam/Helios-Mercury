import QtQuick
import QtQuick.Controls
import Mercury

Item {
    id: raceClusterHeader
    width: 438
    height: 40

    Text {
        id: motor0
        x: 0
        y: 0
        width: 122
        height: 16
        text: "Motor 0 current: " + motorDetails0.InverterPeakCurrent + "A"
        font.pixelSize: 12
        color: "white"
    }

    Text {
        id: motor1
        x: 0
        y: 24
        width: 122
        height: 16
        text: "Motor 1 current: " + motorDetails1.InverterPeakCurrent + "A"
        font.pixelSize: 12
        color: "white"
    }

    Row {
        id: arrayCurrentRow
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        spacing: 5  // Adjust as needed

        Text {
            id: totalArrayCurrentLabel
            width: 122
            height: 16
            anchors.verticalCenter: parent.verticalCenter
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
                width: 60
                height: 16
                text: "0: " + mppt0.ArrayCurrent + " A"
                font.pixelSize: 12
                color: "white"
            }

            Text {
                id: totalArrayCurrent1
                width: 60
                height: 16
                text: "1: " + mppt1.ArrayCurrent + " A"
                font.pixelSize: 12
                color: "white"
            }

            Text {
                id: totalArrayCurrent2
                width: 60
                height: 16
                text: "2: " + mppt2.ArrayCurrent + " A"
                font.pixelSize: 12
                color: "white"
            }

            Text {
                id: totalArrayCurrent3
                width: 60
                height: 16
                text: "3: " + mppt3.ArrayCurrent + " A"
                font.pixelSize: 12
                color: "white"
            }
        }
    }
}
