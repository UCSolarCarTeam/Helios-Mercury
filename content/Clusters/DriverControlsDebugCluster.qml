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

    Text {
        id: clusterTitle
        y: 14
        color: "#ffffff"
        font.family: Config.fontStyle
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Driver Controls")
        font.pixelSize: 24
    }

    // Background images
    Image {
        id: raceClusterFrameBackground
        x: 1
        y: 2
        source: "../Images/RaceClusterFrameBackground.png"
    }

    Image {
        id: raceClusterFrameOutline
        anchors.fill: parent
        source: "../Images/RaceClusterFrameOutline.png"
    }

    // Acceleration Gauge
    GaugeTemplate {
        id: accelerationGauge
        gaugeSize: Config.mediumGaugeSize
        minValue: 0
        maxValue: 100
        gaugeTitle: "Acceleration"
        //TODO: confirm correct units for this gauge
        units: "m/s²"
        value: b3.Acceleration
        anchors {
            left: driverControlsDebugCluster.left
            leftMargin: 650
            top: driverControlsDebugCluster.top
            topMargin: parent.height/4
        }
    }

    // Regen Braking Gauge
    GaugeTemplate {
        id: regenBrakingGauge
        gaugeSize: Config.mediumGaugeSize
        minValue: 0
        maxValue: 100
        gaugeTitle: "Regen Braking"
        //TODO: confirm correct units for this gauge
        units: "kW"
        value: b3.RegenBraking
        anchors {
            right: driverControlsDebugCluster.right
            rightMargin: 650
            top: driverControlsDebugCluster.top
            topMargin: parent.height/4
        }
    }

    // RND Component
    Rnd {
        id: rnd
        x: 870
        y: 439
    }

    // B3 Light Outputs
    DriverIcons {
        id: driverIconComponent
        x: 161
        y: 131
        hornActive: b3.HornSignalOut
        hazardActive: b3.HazardLightsIn
        headlightsActive: b3.HeadlightSignalOut
        leftSignalActive: b3.LeftSignalOut
        rightSignalActive: b3.RightSignalOut
        parkingBrakeActive: b3.HandbrakeSwitch
        daylightRunningLightsActive: b3.DaytimeRunningLightSignalOut
    }

    // B3 Switches
    Column {
        x: parent.width * (3/4)
        spacing: 20
        anchors.verticalCenter: parent.verticalCenter

        Repeater {
            model: [
                { label: "Headlights", active: b3.HeadlightsSwitchIn},
                { label: "Horn", active: b3.HornSwitchIn },
                { label: "Forward", active: b3.ForwardSwitchIn },
                { label: "Brake", active: b3.BrakeSwitch },
                { label: "Motor Reset", active: b3.MotorReset}
            ]
            delegate: Item {
                width: parent.width
                height: 40

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    text: modelData.label
                    color: modelData.active ? "blue" : "white"
                    font.pixelSize: 25
                    font.family: Config.fontStyle
                }
            }
        }
    }
}
