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
        id: raceClusterFrameBackground
        x: 0
        y: 0
        source: "../Images/raceClusterFrameBackground.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: raceClusterFrameOutline
        x: 0
        y: 0
        source: "../Images/raceClusterFrameOutline.png"
        fillMode: Image.PreserveAspectFit

        ArrowIndicator {
            id: leftArrowIndicator
            x: 608
            y: 15
            z:1000
            isRight: false
            isOn: b3.LeftSignalIn || b3.HazardLightsIn
        }

        ArrowIndicator {
            id: rightArrowIndicator
            x: 1278
            y: 15
            z:1000
            isRight: true
            isOn: b3.RightSignalIn || b3.HazardLightsIn
        }
    }

}
