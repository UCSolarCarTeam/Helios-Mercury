import QtQuick 2.15
import "../Components"

Item {
    id: _item
    width: 1920
    height: 550
    Text {
        id: _text
        x: 816
        y: 219
        z: 100
        width: 247
        height: 53
        text: qsTr("TODO: RACE CLUSTER")
        font.pixelSize: 24
    }

    Image {
        id: raceClusterFrame
        x: 0
        y: 0
        source: "../Images/RaceClusterFrame.png"
        fillMode: Image.PreserveAspectFit

        Text {
            id: _text1
            x: 711
            y: 12
            width: 157
            height: 16
            text: qsTr("Motor R Current: XXX A")
            font.pixelSize: 12
        }

        Text {
            id: _text2
            x: 711
            y: 29
            width: 157
            height: 16
            text: qsTr("Motor L Current: XXX A")
            font.pixelSize: 12
        }

        ArrowIndicator {
            id: arrowIndicator
            x: 1292
            y: 15
            z:1000
        }
    }

}
