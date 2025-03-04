import QtQuick 2.15
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

    DashIcon {
        id: dashIcon
        x: 1173
        y: 13
        isOn: b3.HeadlightsSwitchIn
        imageSource: "../Images/Headlights.png"
    }

    DashIcon {
        id: dashIcon2
        x: 1116
        y: 13
        isOn: b3.DaytimeRunningLightSignalOut
        imageSource: "../Images/DaytimeRunningLights.png"
    }

    Text {
        id: text1
        x: 711
        y: 12
        width: 157
        height: 16
        text: qsTr("Motor R Current: XXX A")
        font.pixelSize: 12
        color: "white"
    }

    Text {
        id: text2
        x: 711
        y: 29
        width: 157
        height: 16
        text: qsTr("Motor L Current: XXX A")
        font.pixelSize: 12
        color: "white"
    }

    ArrowIndicator {
        id: leftArrowIndicator
        x: 608
        y: 15
        z:1000
        isRight: false
        isOn: b3.LeftSignalIn || b3.HazardLightsIn
    }

    ArrowIndicator {
        id: rightArrowIndicator
        x: 1278
        y: 15
        z:1000
        isRight: true
        isOn: b3.RightSignalIn || b3.HazardLightsIn
    }

    CameraView{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -75
    }

    ThreeQuarterGauge {
        id: motorTempGauge
        x: 212
        y: 21
        minValue: 0
        maxValue: 100
        gaugeTitle: "Motor Temp"
        units: "°C"
        value: ( motorDetails0.MotorTemperature + motorDetails1.MotorTemperature ) / 2
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
        x: 175
        y: 287
        minValue: 0
        maxValue: 100
        gaugeTitle: "AVG Cell Temp"
        units: "°C"
        value: battery.AverageTemperature
    }
}
