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

    ThreeQuarterGauge {
        id: motorTempGauge
        x: 212
        y: 21
        minValue: 0
        maxValue: 100
        gaugeTitle: "Motor Temp"
        units: "°C"
        value: (motorDetails0.MotorTemp + motorDetails1.MotorTemp) / 2
    }

    ThreeQuarterGauge {
        id: packVoltageGauge
        x: 68
        y: 180
        minValue: 0
        maxValue: 100
        gaugeTitle: "Pack Voltage"
        units: "V"
        value: battery.PackVoltage / 10
    }

    ThreeQuarterGauge {
        id: highCellTempGauge
        x: 178
        y: 290
        minValue: 0
        maxValue: 100
        gaugeTitle: "High Cell Temp"
        units: "°C"
        value: battery.HighTemperature
    }

    ContactorStatus {
        id: contactorsComponent
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            horizontalCenterOffset: -60
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
