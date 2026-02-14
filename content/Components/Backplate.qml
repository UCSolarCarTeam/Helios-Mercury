import QtQuick 6.2
import QtQuick.Controls 2.15
import QtQuick.Effects
import Mercury

Item {
    id: backplate
    width: 1920
    height: 550
    smooth: true

    Image {
        id: raceClusterFrameBackground
        width: 1910
        height: 540
        anchors {
            horizontalCenter: backplate.horizontalCenter
            verticalCenter: backplate.verticalCenter
        }
        source: "../Images/RaceClusterFrameBackground.png"
        sourceSize: Qt.size(1920, 550)
        smooth: true
        visible: false
    }

    MultiEffect {
        anchors.fill: raceClusterFrameBackground
        source: raceClusterFrameBackground
        antialiasing: true
        layer.enabled: true
        layer.smooth: true
    }

    Image {
        id: raceClusterFrameOutline
        width: 1920
        height: 550
        anchors {
            horizontalCenter: backplate.horizontalCenter
            verticalCenter: backplate.verticalCenter
        }
        source: "../Images/RaceClusterFrameOutline.png"
        sourceSize: Qt.size(1920, 550)
        smooth: true
        visible: false
    }

    MultiEffect {
        anchors.fill: raceClusterFrameOutline
        source: raceClusterFrameOutline
        antialiasing: true
        layer.enabled: true
        layer.smooth: true
        colorization: 0.9
        colorizationColor: Config.primary
    }
}
