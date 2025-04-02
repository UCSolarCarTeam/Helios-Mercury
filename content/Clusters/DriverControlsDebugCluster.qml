import QtQuick 2.15
import "../Config"

Item {
    id: driverControlsDebugCluster
    width: 1920
    height: 550

    Image {
        id: driverControlsDebugClusterFrameBackground
        x: 1
        y: 2
        source: "../Images/RaceClusterFrameBackground.png"
    }

    Image {
        id: driverControlsDebugClusterFrameOutline
        anchors.fill: parent
        source: "../Images/RaceClusterFrameOutline.png"
    }

    Text {
        id: driverControlsLabel
        y: 14
        color: "#ffffff"
        font.family: Config.fontStyle
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Driver Controls")
        font.pixelSize: 24
    }
}
