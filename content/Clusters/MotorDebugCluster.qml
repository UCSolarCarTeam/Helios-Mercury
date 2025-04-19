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
            left: motorDebugCluster.left
            leftMargin: 45
        }

        Text {
            id: motor0Label
            width: 95
            height: Config.headerFontSize
            color: Config.fontColor
            font.family: Config.fontStyle
            text: "Motor 0"
            font.pixelSize: Config.debugHeaderFontSize
            font.weight: Font.Bold
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
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
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        RowLayout {
            width: 460
            height: 180
            spacing: 50
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
            spacing: 50
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
    }

    ColumnLayout {
        id: motor1Layout
        width: implicitWidth
        height: implicitHeight
        spacing: 15
        anchors {
            verticalCenter: motorDebugCluster.verticalCenter
            right: motorDebugCluster.right
            rightMargin: 45
        }

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
            Layout.alignment: Qt.AlignHCenter
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
            Layout.alignment: Qt.AlignHCenter
        }

        RowLayout {
            width: 460
            height: 180
            spacing: 50
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
            spacing: 50
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
    }

    RpmGauge {
        id: unflipped
        anchors {
            verticalCenter: motorDebugCluster.verticalCenter
            horizontalCenter: motorDebugCluster.horizontalCenter
            horizontalCenterOffset: 50
        }
        minValue: 0
        maxValue: 100
        value: 50
        flipped: false
    }
}
