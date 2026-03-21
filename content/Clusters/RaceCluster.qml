import QtQuick 2.15
import Mercury
import "../Components"

Item {
    id: raceCluster
    width: 1920
    height: 550

    Backplate { 
        id: backplate
    }

    MotorArrayHeader {
        id: motorArrayHeader
        anchors {
            horizontalCenter: parent.horizontalCenter
            horizontalCenterOffset: -30
            top: parent.top
            topMargin: 7
        }
    }

    ArrowIndicator {
        id: leftArrowIndicator
        x: 608
        y: 15
        z: 1000
        isOn: b3.LeftSignalInput || b3.HazardLightsInput
        rotation: 180
    }

    ArrowIndicator {
        id: rightArrowIndicator
        x: 1278
        y: 15
        z: 1000
        isOn: b3.RightSignalInput || b3.HazardLightsInput
    }

    RaceClusterIcons {
        id: raceDashboardIcons
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 55
        anchors.horizontalCenterOffset: 0
    }

    CameraView {
        id:cameraView
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -75
    }

    RpmGauge {
        visible: false
        id: rpmGauge
        x: 1598
        y: -8
        minValue: 0
        maxValue: 1500
        value: ( motorDetails0.MotorVelocity + motorDetails1.MotorVelocity ) / 2
        flipped: true
    }
    
    FaultsDisplayContainer{
        anchors.top: cameraView.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
    }

    Speedometer {
        id: speedometer
        x: 1237
        y: 48
    }

    Rnd {
        id: rnd
        anchors {
            top: speedometer.bottom
            topMargin: -115
            left: speedometer.left
            leftMargin: 140
        }
    }

    BatteryIcon {
        id: batteryIcon
        anchors { 
            top: raceCluster.top
            left: raceCluster.left
            leftMargin: 75
            topMargin: 90
        }
    }

    GaugeTemplate {
        id: motorTempGauge
        x: 25
        y: 150
        minValue: 0
        maxValue: 100
        gaugeTitle: "Motor Temp"
        units: "°C"
        value: (motorDetails0.MotorTemp + motorDetails1.MotorTemp) / 2
        iconWidth: 50
        iconHeight: 35
        icon: "MotorIcon.png"
        gaugeSize: Config.mediumGaugeSize
    }

    GaugeTemplate {
        id: packVoltageGauge
        x: 250
        y: 150
        minValue: 0
        maxValue: 100
        gaugeTitle: "Cell Voltage"
        units: "V"
        value: battery.PackVoltage / 10
        iconWidth: 40
        iconHeight: 40
        icon: "BoltIcon.png"
        gaugeSize: Config.mediumGaugeSize
    }

    GaugeTemplate {
        id: highCellTempGauge
        x: 475
        y: 150
        minValue: 0
        maxValue: 100
        gaugeTitle: "High Cell Temp"
        units: "°C"
        value: battery.HighTemperature
        iconWidth: 35
        iconHeight: 35
        icon: "ThermometerIcon.png"
        gaugeSize: Config.mediumGaugeSize
    }
    GaugeTemplate {
        id: motorCurrentRight
        x: 1730
        y: 130
        minValue: 0
        maxValue: 100
        gaugeTitle: "Motor Current"
        units: "A"
        icon: "RightMotor.png"
        value: motorDetails1.BusCurrent
        iconWidth: 40
        iconHeight: 30
        gaugeSize: Config.extraSmallGaugeSize
    }
    GaugeTemplate {
        id: motorCurrentLeft
        x: 1730
        y: 285
        minValue: 0
        maxValue: 100
        gaugeTitle: "Motor Current"
        units: "A"
        icon: "LeftMotor.png"
        value: motorDetails0.BusCurrent
        iconWidth: 40
        iconHeight: 25
        gaugeSize: Config.extraSmallGaugeSize
    }
    ContactorStatus {
        id: contactorsComponent
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            horizontalCenterOffset: -72
            bottomMargin: 9
        }
    }

    TelemetryIcon {
        id: telemetryIcon
        anchors {
            left: contactorsComponent.right
            leftMargin: 30
            bottom: contactorsComponent.bottom
            bottomMargin: 5
        }
    }

    // Text {
    //     id: driverNameComponent
    //     width: 350
    //     height: Config.fontSize5
    //     color: Config.fontColor
    //     text: "Driver Name: " + pi.DriverName
    //     wrapMode: Text.Wrap
    //     verticalAlignment: Text.AlignVCenter
    //     horizontalAlignment: Text.AlignHCenter
    //     font {
    //         pixelSize: Config.fontSize5
    //         weight: Font.Medium
    //         family: Config.fontStyle
    //     }
    //     anchors {
    //         horizontalCenter: raceCluster.horizontalCenter
    //         horizontalCenterOffset: -450
    //         bottom: raceCluster.bottom
    //         bottomMargin: 55
    //     }
    // }
}
