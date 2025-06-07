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

    Backplate { 
        id: backplate
    }

    Text {
        id: motorLabel
        color: Config.fontColor
        font.family: Config.fontStyle
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 13
        }
        text: "Driver Controls"
        font.pixelSize: Config.fontSize6
        font.weight: Font.Medium
    }

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
            horizontalCenter: driverControlsDebugCluster.horizontalCenter
            horizontalCenterOffset: -600
            verticalCenter: driverControlsDebugCluster.verticalCenter
            verticalCenterOffset: -120
        }
        icon: "../Images/AccelerationIcon.png"
        iconWidth: 35
        iconHeight: 35
    }

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
            horizontalCenter: driverControlsDebugCluster.horizontalCenter
            horizontalCenterOffset: 600
            verticalCenter: driverControlsDebugCluster.verticalCenter
            verticalCenterOffset: -120
        }
        icon: "../Images/AccelerationIcon.png"
        iconWidth: 35
        iconHeight: 35
    }

    ColumnLayout {
        id: driverInputsLayout
        width: implicitWidth
        height: implicitHeight
        spacing: 50
        anchors {
            horizontalCenter: driverControlsDebugCluster.horizontalCenter
            verticalCenter: driverControlsDebugCluster.verticalCenter
        }

        Text {
            id: driverInputsLabel
            height: Config.fontSize4
            color: Config.fontColor
            font.family: Config.fontStyle
            text: "Driver Inputs"
            font.pixelSize: Config.fontSize6
            font.weight: Font.Bold
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }

        GridLayout {
            width: implicitWidth
            height: implicitHeight
            columns: 5
            rowSpacing: 40
            columnSpacing: 5

            Repeater {
                model: [
                    { label: "Forward Switch", isOn: b3.ForwardSwitchIn},
                    { label: "Horn Switch", isOn: b3.HornSwitchIn},
                    { label: "Forward", isOn: b3.ForwardIn},
                    { label: "Neutral", isOn: b3.Neutral},
                    { label: "Reverse", isOn: b3.Reverse},
                    { label: "Brake Switch", isOn: b3.BrakeSwitch},
                    { label: "Handbrake Switch", isOn: b3.HandbrakeSwitch},
                    { label: "Motor Reset", isOn: b3.MotorReset},
                    { label: "Race Mode", isOn: b3.RaceMode},
                    { label: "Lap", isOn: b3.Lap}
                ]

                delegate: StatusIcon {
                    Layout.preferredWidth: 110
                    label: modelData.label
                    isOn: modelData.isOn
                }
            }
        }
    }

    ColumnLayout {
        id: lightsInputsLayout
        width: implicitWidth
        height: implicitHeight
        spacing: 25
        anchors {
            horizontalCenter: accelerationGauge.horizontalCenter
            top: accelerationGauge.bottom
            topMargin: 50
        }

        Text {
            id: lightsInputsLabel
            height: Config.fontSize6
            color: Config.fontColor
            font.family: Config.fontStyle
            text: "Lights Input"
            font.pixelSize: Config.fontSize6
            font.weight: Font.Bold
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }

        RowLayout {
            spacing: 75
            Layout.alignment: Qt.AlignHCenter

            ArrowIndicator {
                isOn: b3.LeftSignalIn || b3.HazardLightsIn
                rotation: 180
            }

            ArrowIndicator {
                isOn: b3.RightSignalIn || b3.HazardLightsIn
            }
        }

        DashIcon {
            iconMaskColor: b3.HeadlightsSwitchIn ? Config.primary : Config.btnDisabled 
            imageSource: "../Images/Headlights.png"
            Layout.alignment: Qt.AlignCenter
        }
    }

    ColumnLayout {
        id: lightsOutputsLayout
        width: implicitWidth
        height: implicitHeight
        spacing: 25
        anchors {
            horizontalCenter: regenBrakingGauge.horizontalCenter
            top: regenBrakingGauge.bottom
            topMargin: 50
        }

        Text {
            id: lightsOutputsLabel
            height: Config.fontSize6
            color: Config.fontColor
            font.family: Config.fontStyle
            text: "Lights Output"
            font.pixelSize: Config.fontSize6
            font.weight: Font.Bold
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }

        RowLayout {
            spacing: 75
            Layout.alignment: Qt.AlignHCenter

            ArrowIndicator {
                isOn: b3.LeftSignalOut 
                rotation: 180
            }

            ArrowIndicator {
                isOn: b3.RightSignalOut
            }
        }

        RowLayout {
            spacing: 75
            Layout.alignment: Qt.AlignHCenter

            DashIcon {
                iconMaskColor: b3.HeadlightSignalOut ? Config.primary : Config.btnDisabled 
                imageSource: "../Images/Headlights.png"
                Layout.alignment: Qt.AlignCenter
            }

            DashIcon {
                iconMaskColor: b3.DaytimeRunningLightSignalOut ? Config.primary : Config.btnDisabled 
                imageSource: "../Images/DaytimeRunningLights.png"
                Layout.alignment: Qt.AlignCenter
            }

            DashIcon {
                iconMaskColor: b3.BrakeLightSignalOut ? Config.valueHigh : Config.btnDisabled 
                imageSource: "../Images/ParkingBrake.png"
                Layout.alignment: Qt.AlignCenter
            }

            DashIcon {
                iconMaskColor: b3.HornSignalOut ? Config.primary : Config.btnDisabled 
                imageSource: "../Images/CarHorn.png"
                Layout.alignment: Qt.AlignCenter
            }
        }
    }
}
