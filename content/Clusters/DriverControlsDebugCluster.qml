import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../Config"
import "../Components"
import Mercury

Item {
    id: driverControlsDebugCluster
    width: 1920
    height: 550

    property bool hornActive: b3.HornSignalOut
    property bool hazardActive: b3.HazardLightsIn
    property bool headlightsActive: b3.HeadlightSignalOut
    property bool leftSignalActive: b3.LeftSignalOut
    property bool rightSignalActive: b3.RightSignalOut
    property bool parkingBrakeActive: b3.HandbrakeSwitch
    property bool drlActive: b3.DaytimeRunningLightSignalOut
    property bool brakeActive: b3.BrakeLightSignalOut
    property bool mtrResetActive: b3.MotorReset

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

        hornActive: driverControlsDebugCluster.hornActive
        hazardActive: driverControlsDebugCluster.hazardActive
        headlightsActive: driverControlsDebugCluster.headlightsActive
        leftSignalActive: driverControlsDebugCluster.leftSignalActive
        rightSignalActive: driverControlsDebugCluster.rightSignalActive
        parkingBrakeActive: driverControlsDebugCluster.parkingBrakeActive
    }


    // Middle Text (Looks really empty without it)
    Text {
        id: debugTimeDisplay
        text: "00:00:000"
        font.pixelSize: 64
        font.family: Config.fontStyle
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        color: "#ffffff"
    }

    // Middle text
    Text {
        id: motorStatus
        text: "8/8"
        font.pixelSize: 24
        color: "#ffffff"
        anchors.right: debugTimeDisplay.right
        anchors.top: debugTimeDisplay.bottom
        anchors.topMargin: 10
    }

    // Signal list on right
    Column {
        x:parent.width * (3/4)
        spacing: 20
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
                height: 40

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

    // RND because no P
    Item {
        id: rndDisplay
        x: 120
        y:parent.height/4 + 50
        width: 50
        height: 150

        property var gears: ["R", "N", "D"]
        property int currentGear: b3.Reverse ? 0 : (b3.ForwardIn ? 2 : 1)


        Column {
            id: gearColumn
            spacing: 15
            anchors.centerIn: parent

            Repeater {
                model: rndDisplay.gears.length

                Text {
                    text: rndDisplay.gears[index]
                    font.pixelSize: 35
                    font.family: Config.fontStyle
                    color: index === rndDisplay.currentGear ? "red" : "white"
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }
}
