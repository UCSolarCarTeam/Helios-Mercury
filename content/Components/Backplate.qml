import QtQuick 6.2
import QtQuick.Controls 2.15
import QtQuick.Effects
import Mercury

Item {
    id: backplate
    width: Config.windowWidth
    height: Config.windowHeight
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
        colorization: 1.0 
        colorizationColor: Config.backplateColor
        antialiasing: true
        layer.enabled: true
        layer.smooth: true
    }

    Image {
        id: raceClusterFrameOutline
        width: Config.windowWidth
        height: Config.windowHeight
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
        colorization: 1.0 
        colorizationColor: Config.primary
        antialiasing: true
        layer.enabled: true
        layer.smooth: true
    }
}
