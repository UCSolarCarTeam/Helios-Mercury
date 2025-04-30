import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../Config"
import "../Components"

Item {
    id: driverControlsDebugCluster
    width: 1920
    height: 550

    property bool leftSignalActive: false
    property bool rightSignalActive: false
    property bool drlActive: false
    property bool headlightsActive: false
    property bool brakeActive: false
    property bool mtrResetActive: false
    property bool hornActive: false
    property bool parkingBrakeActive: false
    property bool hazardActive: false

    // Background images
    Image {
        id: frameBackground
        x: 1
        y: 2
        source: "../Images/RaceClusterFrameBackground.png"
    }

    Image {
        id: frameOutline
        anchors.fill: parent
        source: "../Images/RaceClusterFrameOutline.png"
    }

    Text {
        id: clusterTitle
        y: 14
        color: "#ffffff"
        font.family: Config.fontStyle
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Driver Controls")
        font.pixelSize: 24
    }

    DriverIcons {
        id: driverIconComponent
        x: 242
        y: 131
    }


    // Central debug time
    Text {
        id: debugTimeDisplay
        text: "00:00:000"
        font.pixelSize: 64
        font.family: Config.fontStyle
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        color: "#ffffff"
    }

    // Motor status
    Text {
        id: motorStatus
        text: "8/8"
        font.pixelSize: 24
        color: "#ffffff"
        anchors.right: debugTimeDisplay.right
        anchors.top: debugTimeDisplay.bottom
        anchors.topMargin: 10
    }

    // Signal list with heading
    Column {
        spacing: 15
        anchors.right: parent.right
        anchors.rightMargin: 120
        anchors.verticalCenter: parent.verticalCenter

        Text {
            text: "Signal"
            font.pixelSize: 22
            font.family: Config.fontStyle
            color: "white"
        }

        Repeater {
            model: [
                { label: "Left", active: leftSignalActive },
                { label: "Right", active: rightSignalActive },
                { label: "DRL", active: drlActive },
                { label: "Headlights", active: headlightsActive },
                { label: "Brake", active: brakeActive },
                { label: "Mtr Reset", active: mtrResetActive },
                { label: "Horn", active: hornActive }
            ]
            delegate: Text {
                text: modelData.label
                color: modelData.active ? "green" : "red"
                font.pixelSize: 22
                font.family: Config.fontStyle
            }
        }
    }

    // Placeholder for PRNDL
    Text {
        id: prndlLabel
        text: "PRNDL: TBD"
        font.pixelSize: 24
        color: "#cccccc"
        anchors.left: parent.left
        anchors.leftMargin: 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
    }
}
