import QtQuick 2.15
import "../Config"
import Mercury
import "../Components"

Item {
    id: driverControlsDebugCluster
    width: 1920
    height: 550

    Backplate { 
        id: backplate
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
