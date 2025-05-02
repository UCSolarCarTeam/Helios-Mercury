import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../Config"
import "../Components"

Item {
    id: driverControlsDebugCluster
    width: 1920
    height: 550

    property bool hornActive: true
    property bool hazardActive: true
    property bool headlightsActive: true
    property bool leftSignalActive: true
    property bool rightSignalActive: true
    property bool parkingBrakeActive: true
    property bool drlActive: false
    property bool brakeActive: false
    property bool mtrResetActive: false

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

        // hornActive: b3.HornSignalOut
        // hazardActive: b3.HazardLightsIn
        // headlightsActive: b3.HeadlightSignalOut
        // leftSignalActive: b3.LeftSignalIn
        // rightSignalActive: b3.RightSignalIn
        // parkingBrakeActive: b3.HandbrakeSwitch
        hornActive: true
        hazardActive: true
        headlightsActive: true
        leftSignalActive: true
        rightSignalActive: true
        parkingBrakeActive: true
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
        x:parent.width * (3/4) + 30
        spacing: 20
        // anchors.right: parent.right
        // anchors.rightMargin: 200
        anchors.verticalCenter: parent.verticalCenter

        Text {
            text: "Signal"
            font.pixelSize: 35
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
            delegate: Item {
                width: parent.width
                height: 40  // Adjust as needed

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    text: modelData.label
                    color: modelData.active ? "green" : "red"
                    font.pixelSize: 35
                    font.family: Config.fontStyle
                }
            }
        }
    }

    Item {
        id: prndlDisplay
        x: 120
        y:parent.height/4 + 50
        width: 50
        height: 150
        // anchors.left: parent.left
        // anchors.leftMargin: 100
        // anchors.bottom: parent.bottom
        // anchors.bottomMargin: 30

        property var gears: ["P", "R", "N", "D"]
        property int currentGear: 2  // Example: highlight "N"

        Column {
            id: gearColumn
            spacing: 15
            anchors.centerIn: parent

            Repeater {
                model: prndlDisplay.gears.length

                Text {
                    text: prndlDisplay.gears[index]
                    font.pixelSize: 35
                    font.family: Config.fontStyle
                    color: index === prndlDisplay.currentGear ? "red" : "white"
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }
}
