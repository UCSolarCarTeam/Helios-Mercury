import QtQuick 6.2
import QtQuick.Layouts
import QtQuick.Controls
import "../Components"
import Mercury

Item {
    id: motorDebugCluster
    width: 1920
    height: 550

    Image {
        id: motorDebugClusterFrameBackground
        x: 1
        y: 2
        source: "../Images/RaceClusterFrameBackground.png"
    }

    Image {
        id: motorDebugClusterFrameOutline
        anchors.fill: parent
        source: "../Images/RaceClusterFrameOutline.png"
    }

    Text {
        id: mbmsLabel
        color: Config.fontColor
        font.family: Config.fontStyle
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 13
        }
        text: "Motor"
        font.pixelSize: Config.debugHeaderFontSize
        font.weight: Font.Medium
    }

    ColumnLayout {
        id: motor0Layout
        width: implicitWidth
        height: implicitHeight
        spacing: 15
        anchors {
            verticalCenter: motorDebugCluster.verticalCenter
            verticalCenterOffset: -7
            left: motorDebugCluster.left
            leftMargin: 45
        }
        Layout.alignment: Qt.AlignHCenter

        RowLayout {
            spacing: 10
            Layout.alignment: Qt.AlignHCenter
            Text {
                id: motor0Label
                width: 95
                height: Config.headerFontSize
                color: Config.fontColor
                font.family: Config.fontStyle
                text: "Motor 0"
                font.pixelSize: Config.debugHeaderFontSize
                font.weight: Font.Bold
                // verticalAlignment: Text.AlignVCenter
                // horizontalAlignment: Text.AlignHCenter
                font.bold: true
            }

            Text {
                id: motor0ControlValue
                width: 150
                height: Config.headerFontSize
                color: Config.fontColor
                font.family: Config.fontStyle
                font.weight: Font.Medium
                text: "Control Value: " + motorDetails0.ControlValue
                font.pixelSize: Config.headerFontSize
                // verticalAlignment: Text.AlignVCenter
                // horizontalAlignment: Text.AlignHCenter
            }
        }

        RowLayout {
            width: 460
            height: 180
            spacing: 15
            Layout.alignment: Qt.AlignHCenter

            GaugeTemplate {
                id: motor0Torque
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "Nm"
                value: motorDetails0.CurrentMotorTorque
                gaugeTitle: "Torque"
                icon: "TorqueIcon.png"
                iconWidth: 20
                iconHeight: 20
            }

            GaugeTemplate {
                id: motor0Current
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "A"
                value: motorDetails0.InverterPeakCurrent
                gaugeTitle: "Inverter Peak Current"
                icon: "BoltIcon.png"
                iconWidth: 20
                iconHeight: 25
            }

            GaugeTemplate {
                id: motor0Power
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "W"
                value: motorDetails0.CurrentMotorPower
                gaugeTitle: "Current Motor Power"
                icon: "BoltIcon.png"
                iconWidth: 20
                iconHeight: 25
            }
        }

        RowLayout {
            width: 290
            height: 180
            spacing: 20
            Layout.alignment: Qt.AlignHCenter

            GaugeTemplate {
                id: motor0Angle
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "°"
                value: motorDetails0.AbsuluteAngle
                gaugeTitle: "Absolute Angle"
                icon: "AngleIcon.png"
                iconWidth: 20
                iconHeight: 20
            }

            GaugeTemplate {
                id: motor0Temp
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "°C"
                value: motorDetails0.MotorTemperature
                gaugeTitle: "Motor Temperature"
                icon: "ThermometerIcon.png"
                iconWidth: 20
                iconHeight: 25
            }
        }

        RowLayout {
            id: motor0ControlFlagContainer
            Layout.preferredWidth: 300
            Layout.preferredHeight: 50
            spacing: 10
            Layout.alignment: Qt.AlignHCenter
            
            Repeater {
                model: [
                    { name: "Control Mode", isOn: motorDetails0.ControlMode },
                    { name: "Motor Mode", isOn: motorDetails0.MotorMode },
                    { name: "Software Enable", isOn: motorDetails0.SoftwareEnable },
                    { name: "Debug Mode", isOn: motorDetails0.DebugMode }
                ]
                
                delegate: Item {
                    id: motor0ControlFlagFrame
                    Layout.fillHeight: true
                    width: 100
                    
                    Text {
                        id: motor0ControlFlagTitle
                        text: modelData.name
                        font.pixelSize: Config.contactorLabelFontSize
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: Config.fontStyle
                        color: Config.fontColor
                        anchors.bottom: controlFlagIcon.top
                        anchors.bottomMargin: 2
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    
                    DashIcon {
                        id: motor0ControlFlagIcon
                        width: 20
                        height: 20
                        imageSource: modelData.isOn ? "../Images/MpptMbmsStatusOn.png" : "../Images/MpptMbmsStatusOff.png"
                        iconMaskColor: modelData.isOn ? Config.contactorConnectedColor : Config.contactorDisconnectedColor
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottomMargin: 2
                    }
                }
            }
        }
    }

    ColumnLayout {
        id: motor1Layout
        width: implicitWidth
        height: implicitHeight
        spacing: 15
        anchors {
            verticalCenter: motorDebugCluster.verticalCenter
            verticalCenterOffset: -7
            right: motorDebugCluster.right
            rightMargin: 45
        }
        Layout.alignment: Qt.AlignHCenter

        RowLayout {
            spacing: 10
            Layout.alignment: Qt.AlignHCenter
            Text {
                id: motor1Label
                width: 95
                height: Config.headerFontSize
                color: Config.fontColor
                font.family: Config.fontStyle
                text: "Motor 1"
                font.pixelSize: Config.debugHeaderFontSize
                font.weight: Font.Bold
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
            }

            Text {
                id: motor1ControlValue
                width: 150
                height: Config.headerFontSize
                color: Config.fontColor
                font.family: Config.fontStyle
                font.weight: Font.Medium
                text: "Control Value: " + motorDetails1.ControlValue
                font.pixelSize: Config.headerFontSize
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        RowLayout {
            width: 460
            height: 180
            spacing: 20
            Layout.alignment: Qt.AlignHCenter

            GaugeTemplate {
                id: motor1Torque
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "Nm"
                value: motorDetails1.CurrentMotorTorque
                gaugeTitle: "Torque"
                icon: "TorqueIcon.png"
                iconWidth: 20
                iconHeight: 20
            }

            GaugeTemplate {
                id: motor1Current
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "A"
                value: motorDetails1.InverterPeakCurrent
                gaugeTitle: "Inverter Peak Current"
                icon: "BoltIcon.png"
                iconWidth: 20
                iconHeight: 25
            }

            GaugeTemplate {
                id: motor1Power
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "W"
                value: motorDetails1.CurrentMotorPower
                gaugeTitle: "Current Motor Power"
                icon: "BoltIcon.png"
                iconWidth: 20
                iconHeight: 25
            }
        }

        RowLayout {
            width: 290
            height: 180
            spacing: 20
            Layout.alignment: Qt.AlignHCenter

            GaugeTemplate {
                id: motor1Angle
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "°"
                value: motorDetails1.AbsuluteAngle
                gaugeTitle: "Absolute Angle"
                icon: "AngleIcon.png"
                iconWidth: 20
                iconHeight: 20
            }

            GaugeTemplate {
                id: motor1Temp
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "°C"
                value: motorDetails1.MotorTemperature
                gaugeTitle: "Motor Temperature"
                icon: "ThermometerIcon.png"
                iconWidth: 20
                iconHeight: 25
            }
        }

        RowLayout {
            id: motor1ControlFlagContainer
            Layout.preferredWidth: 300
            Layout.preferredHeight: 50
            spacing: 10
            Layout.alignment: Qt.AlignHCenter
            
            Repeater {
                model: [
                    { name: "Control Mode", isOn: motorDetails1.ControlMode },
                    { name: "Motor Mode", isOn: motorDetails1.MotorMode },
                    { name: "Software Enable", isOn: motorDetails1.SoftwareEnable },
                    { name: "Debug Mode", isOn: motorDetails1.DebugMode }
                ]
                
                delegate: Item {
                    id: motor1ControlFlagFrame
                    Layout.fillHeight: true
                    width: 100
                    
                    Text {
                        id: motor1ControlFlagTitle
                        text: modelData.name
                        font.pixelSize: Config.contactorLabelFontSize
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: Config.fontStyle
                        color: Config.fontColor
                        anchors.bottom: controlFlagIcon.top
                        anchors.bottomMargin: 2
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    
                    DashIcon {
                        id: motor1ControlFlagIcon
                        width: 20
                        height: 20
                        imageSource: modelData.isOn ? "../Images/MpptMbmsStatusOn.png" : "../Images/MpptMbmsStatusOff.png"
                        iconMaskColor: modelData.isOn ? Config.contactorConnectedColor : Config.contactorDisconnectedColor
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottomMargin: 2
                    }
                }
            }
        }
    }

    RpmGauge {
        id: motor0RpmGauge
        anchors {
            verticalCenter: motorDebugCluster.verticalCenter
            horizontalCenter: motorDebugCluster.horizontalCenter
            horizontalCenterOffset: -170
        }
        minValue: 0
        maxValue: 6000
        value: motorDetails0.CurrentRpmValue
        flipped: false
    }

    Text {
        id: motor0Rpm
        color: Config.fontColor
        font.family: Config.fontStyle
        anchors {
            verticalCenter: motorDebugCluster.verticalCenter
            left: motor0RpmGauge.right
            leftMargin: -100
        }
        text: motorDetails0.CurrentRpmValue
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Config.rpmGaugeFontSize
        font.weight: Font.Medium
    }

    Text {
        id: motor0RpmLabel
        color: Config.fontColor
        font.family: Config.fontStyle
        anchors {
            top: motor0Rpm.bottom
            horizontalCenter: motor0Rpm.horizontalCenter
        }
        text: "RPM"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Config.debugHeaderFontSize
        font.weight: Font.Medium
    }

    RpmGauge {
        id: motor1RpmGauge
        anchors {
            verticalCenter: motorDebugCluster.verticalCenter
            horizontalCenter: motorDebugCluster.horizontalCenter
            horizontalCenterOffset: 170
        }
        minValue: 0
        maxValue: 6000
        value: motorDetails1.CurrentRpmValue
        flipped: true
    }

    Text {
        id: motor1Rpm
        color: Config.fontColor
        font.family: Config.fontStyle
        anchors {
            verticalCenter: motorDebugCluster.verticalCenter
            right: motor1RpmGauge.left
            rightMargin: -100
        }
        text: motorDetails1.CurrentRpmValue
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Config.rpmGaugeFontSize
        font.weight: Font.Medium
    }

    Text {
        id: motor1RpmLabel
        color: Config.fontColor
        font.family: Config.fontStyle
        anchors {
            top: motor1Rpm.bottom
            horizontalCenter: motor1Rpm.horizontalCenter
        }
        text: "RPM"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Config.debugHeaderFontSize
        font.weight: Font.Medium
    }

    Text {
        id: motorSetpointLabel
        width: 150
        height: Config.contactorFontSize
        anchors {
            horizontalCenter: motorDebugCluster.horizontalCenter
            horizontalCenterOffset: 200
            bottom: motorDebugCluster.bottom
            bottomMargin: 21
        }
        color: Config.fontColor
        font.family: Config.fontStyle
        font.weight: Font.Medium
        text: "Motor Setpoint:\n" + keyMotor.MotorSetpoint
        font.pixelSize: Config.contactorFontSize
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: keyMotorLabel
        height: Config.contactorFontSize
        anchors {
            horizontalCenter: motorDebugCluster.horizontalCenter
            horizontalCenterOffset: -240
            bottom: motorDebugCluster.bottom
            bottomMargin: 22
        }
        color: Config.fontColor
        font.family: Config.fontStyle
        font.weight: Font.Medium
        text: "Key\nMotor:"
        font.pixelSize: Config.contactorFontSize
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    RowLayout {
        id: controlFlagContainer
        width: 350
        height: 35
        anchors {
            horizontalCenter: motorDebugCluster.horizontalCenter
            horizontalCenterOffset: -40
            bottom: motorDebugCluster.bottom
            bottomMargin: 8
        }
        spacing: 5
        
        Repeater {
            model: [
                { name: "Control Mode", isOn: keyMotor.ControlMode },
                { name: "Motor Mode", isOn: keyMotor.MotorMode },
                { name: "Software Enable", isOn: keyMotor.SoftwareEnable },
                { name: "Debug Mode", isOn: keyMotor.DebugMode }
            ]
            
            delegate: Item {
                id: controlFlagFrame
                Layout.fillWidth: true
                Layout.fillHeight: true
                
                Text {
                    id: controlFlagTitle
                    text: modelData.name
                    font.pixelSize: Config.contactorLabelFontSize
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: Config.fontStyle
                    color: Config.fontColor
                    anchors.bottom: controlFlagIcon.top
                    anchors.bottomMargin: 2
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                
                DashIcon {
                    id: controlFlagIcon
                    width: 20
                    height: 20
                    imageSource: modelData.isOn ? "../Images/MpptMbmsStatusOn.png" : "../Images/MpptMbmsStatusOff.png"
                    iconMaskColor: modelData.isOn ? Config.contactorConnectedColor : Config.contactorDisconnectedColor
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 2
                }
            }
        }
    }
}
