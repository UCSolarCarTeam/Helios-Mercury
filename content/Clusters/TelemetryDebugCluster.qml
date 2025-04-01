import QtQuick 2.15
import "../Config"

Item {
    id: telemetryDebugCluster
    width: 1920
    height: 550

    Image {
        id: telemetryDebugClusterFrameBackground
        x: 1
        y: 2
        source: "../Images/RaceClusterFrameBackground.png"
    }

    Image {
        id: telemetryDebugClusterFrameOutline
        anchors.fill: parent
        source: "../Images/RaceClusterFrameOutline.png"
    }

    Text {
        id: telemetryLabel
        y: 14
        color: "#ffffff"
        font.family: Config.fontStyle
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Telemetry")
        font.pixelSize: 24
    }
}
