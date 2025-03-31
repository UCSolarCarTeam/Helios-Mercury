import QtQuick 2.15
import "../Config"

Item {
    id: motorDebugCluster
    width: 1920
    height: 550

    Image {
        id: motorDebugClusterFrameBackground
        x: 1
        y: 2
        source: "../Images/RaceClusterFrameBackground.png"
    }

    Image {
        id: motorDebugClusterFrameOutline
        anchors.fill: parent
        source: "../Images/RaceClusterFrameOutline.png"
    }

    Text {
        id: motorLabel
        y: 14
        color: "#ffffff"
        font.family: Config.fontStyle
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Motor")
        font.pixelSize: 24
    }
}
