import QtQuick 6.2
import QtQuick.Layouts
import QtQuick.Controls
import "../Components"
import Mercury

Item {
    id: motorDebugCluster
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
        text: "Motor"
        font.pixelSize: Config.debugHeaderFontSize
        font.weight: Font.Medium
    }

    ColumnLayout {
        id: motor0Layout
        width: implicitWidth
        height: implicitHeight
        spacing: 12
        anchors {
            verticalCenter: motorDebugCluster.verticalCenter
            verticalCenterOffset: -7
            left: motorDebugCluster.left
            leftMargin: 35
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
                

                delegate: StatusIcon {
                    width: 100
                    label: modelData.name
                    isOn: modelData.isOn
                }
            }
        }
    }

    ColumnLayout {
        id: motor1Layout
        width: implicitWidth
        height: implicitHeight
        spacing: 12
        anchors {
            verticalCenter: motorDebugCluster.verticalCenter
            verticalCenterOffset: -7
            right: motorDebugCluster.right
            rightMargin: 35
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
                
                delegate: StatusIcon {
                    width: 100
                    label: modelData.name
                    isOn: modelData.isOn
                }
            }
        }
    }

    RpmGauge {
        id: motor0RpmGauge
        anchors {
            verticalCenter: motorDebugCluster.verticalCenter
            horizontalCenter: motorDebugCluster.horizontalCenter
            horizontalCenterOffset: -150
        }
        minValue: 0
        maxValue: 1500
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
            leftMargin: -80
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
            horizontalCenterOffset: 150
        }
        minValue: 0
        maxValue: 1500
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
            rightMargin: -80
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
            horizontalCenterOffset: 203
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
            horizontalCenterOffset: -241
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
        id: controlFlagContainers
        width: 370
        height: 35
        anchors {
            horizontalCenter: motorDebugCluster.horizontalCenter
            horizontalCenterOffset: -35
            bottom: motorDebugCluster.bottom
            bottomMargin: 15
        }
        
        Repeater {
            model: [
                { name: "Control Mode", isOn: keyMotor.ControlMode, componentWidth: 65 },
                { name: "Motor Mode", isOn: keyMotor.MotorMode, componentWidth: 65 },
                { name: "Software Enable", isOn: keyMotor.SoftwareEnable, componentWidth: 80 },
                { name: "Debug Mode", isOn: keyMotor.DebugMode, componentWidth: 65 }
            ]
           
            delegate: StatusIcon {
                Layout.fillWidth: true
                columnSpacing: 2
                width: modelData.componentWidth
                label: modelData.name
                isOn: modelData.isOn
            }
        }
    }
}
