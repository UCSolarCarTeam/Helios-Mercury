import QtQuick 2.15
import "../Config"

Item {
    id: mpptMbbsDebugCluster
    width: 1920
    height: 550

    Image {
        id: mpptMbbsDebugClusterFrameBackground
        x: 1
        y: 2
        source: "../Images/RaceClusterFrameBackground.png"
    }

    Image {
        id: mpptMbbsDebugClusterFrameOutline
        anchors.fill: parent
        source: "../Images/RaceClusterFrameOutline.png"
    }


}
