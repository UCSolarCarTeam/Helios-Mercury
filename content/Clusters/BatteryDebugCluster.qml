import QtQuick 2.15
import "../Config"

Item {
    id: batteryDebugCluster
    width: 1920
    height: 550

    Image {
        id: batteryDebugClusterFrameBackground
        x: 1
        y: 2
        source: "../Images/RaceClusterFrameBackground.png"
    }

    Image {
        id: batteryDebugClusterFrameOutline
        anchors.fill: parent
        source: "../Images/RaceClusterFrameOutline.png"
    }

    Text {
        id: batteryDebugLabel
        y: 14
        color: "#ffffff"
        font.family: Config.fontStyle
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Battery")
        font.pixelSize: 24
    }
}
