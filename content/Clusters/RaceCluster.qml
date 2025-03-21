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

    RaceClusterIcons{
        id: raceDashboardIcons
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 55
        anchors.horizontalCenterOffset: 0
    }

    CameraView{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -75
    }

    Rnd {
        id: rnd
        x: 1518
        y: 449
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
        x: 178
        y: 290
        minValue: 0
        maxValue: 100
        gaugeTitle: "AVG Cell Temp"
        units: "°C"
        value: battery.AverageTemperature
    }

    GaugeTemplate {
        id: smallGaugeTest
        x: 1290
        y: 66
        minValue: 0
        maxValue: 100
        gaugeTitle: "Small Gauge Test"
        units: "u"
        value: battery.AverageTemperature
        gaugeSize: 165
        // icon: "BoltIcon.png"
        // iconColor: Config.fontColor
        // iconWidth: 15
        // iconHeight: 25
    }

    GaugeTemplate {
        id: mediumGaugeTest
        x: 1261
        y: 265
        minValue: 0
        maxValue: 100
        gaugeTitle: "Medium Gauge Test"
        units: "u"
        value: battery.AverageTemperature
        gaugeSize: 240
        icon: "BoltIcon.png"
        //iconColor: Config.primary
        iconWidth: 20
        iconHeight: 35
    }

    GaugeTemplate {
        id: largeGaugeTest
        x: 1507
        y: 42
        minValue: 0
        maxValue: 100
        gaugeTitle: "Large Gauge Test"
        units: "u"
        value: battery.AverageTemperature
        gaugeSize: 300
        icon: "AccelerationIcon.png"
        iconColor: Config.needleColor
        iconWidth: 50
        iconHeight: 45
    }
}
