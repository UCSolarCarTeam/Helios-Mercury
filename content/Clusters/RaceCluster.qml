import QtQuick 2.15
import Mercury
import "../Components"

Item {
    id: raceCluster
    width: 1920
    height: 550

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
        isRight: false
        isOn: b3.LeftSignalIn || b3.HazardLightsIn
    }

    ArrowIndicator {
        id: rightArrowIndicator
        x: 1278
        y: 15
        z: 1000
        isRight: true
        isOn: b3.RightSignalIn || b3.HazardLightsIn
    }

    RaceClusterIcons {
        id: raceDashboardIcons
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 55
        anchors.horizontalCenterOffset: 0
    }

    CameraView {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -75
    }

    Speedometer {
        id: speedometer
        x: 1356
        y: 46
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
        x: 16
        y: 89
    }

    ThreeQuarterGauge {
        id: motorTempGauge
        x: 212
        y: 21
        minValue: 0
        maxValue: 100
        gaugeTitle: "Motor Temp"
        units: "°C"
        value: (motorDetails0.MotorTemperature + motorDetails1.MotorTemperature) / 2
    }

    ThreeQuarterGauge {
        id: netConsumptionGauge
        x: 68
        y: 180
        minValue: 0
        maxValue: 100
        gaugeTitle: "Net Consumption"
        units: "mV"
        value: battery.AverageCellVoltage / 10
    }

    ThreeQuarterGauge {
        id: averageCellTempGauge
        x: 178
        y: 290
        minValue: 0
        maxValue: 100
        gaugeTitle: "AVG Cell Temp"
        units: "°C"
        value: battery.AverageTemperature
    }

    ContactorStatus {
        id: contactorsComponent
        width: 350
        height: 35
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            horizontalCenterOffset: -80
            bottomMargin: 10
        }
        contactorData: [
            { name: "CMN", isConnected: mbms.CommonContactorState },
            { name: "MOTOR", isConnected: mbms.MotorContactorState },
            { name: "ARRAY", isConnected: mbms.ArrayContactorState },
            { name: "CHARGE", isConnected: mbms.ChargeContactorState }, 
            { name: "LV", isConnected: mbms.LvContactorState }
        ]
    }
}
