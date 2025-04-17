import QtQuick
import "../Config"
import "../Components"
import Mercury
import QtQuick.Layouts

Item {
    id: batteryDebugCluster
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
        id: batteryLabel
        color: Config.fontColor
        font.family: Config.fontStyle
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 15
        }
        text: "Battery"
        font.pixelSize: Config.debugHeaderFontSize
    }

    GaugeTemplate {
        id: packCurrentGauge
        anchors {
            left: batteryDebugCluster.left
            leftMargin: 465
            verticalCenter: batteryDebugCluster.verticalCenter
        }
        gaugeSize: Config.mediumGaugeSize
        minValue: 0
        maxValue: 100
        units: "A"
        gaugeTitle: "Pack Current"
        value: battery.PackCurrent.toFixed(3)
        icon: "BoltIcon.png"
        iconWidth: 25
        iconHeight: 35
    }

    GaugeTemplate {
        id: packVoltageGauge
        anchors {
            left: batteryDebugCluster.left
            leftMargin: 240
            verticalCenter: batteryDebugCluster.verticalCenter
            verticalCenterOffset: 130
        }
        gaugeSize: Config.mediumGaugeSize
        minValue: 0
        maxValue: 100
        units: "V"
        gaugeTitle: "Pack Voltage"
        value:  battery.PackVoltage.toFixed(3)
        icon: "BoltIcon.png"
        iconWidth: 25
        iconHeight: 35
    }

    GaugeTemplate {
        id: depthOfDischargeGauge
        anchors {
            left: batteryDebugCluster.left
            leftMargin: 240
            verticalCenter: batteryDebugCluster.verticalCenter
            verticalCenterOffset: -130
        }
        gaugeSize: Config.mediumGaugeSize
        minValue: 0
        maxValue: 100
        units: "%"
        gaugeTitle: "Depth of Charge"
        value:  battery.PackDepthOfDischarge.toFixed(3)
        icon: "BoltIcon.png"
        iconWidth: 25
        iconHeight: 35
    }

    Text {
        id: batteryIconLabel
        color: Config.fontColor
        font.family: Config.fontStyle
        anchors {
            left: batteryDebugCluster.left
            leftMargin: 80
            verticalCenter: batteryDebugCluster.verticalCenter
            verticalCenterOffset: -30
        }
        text: "Battery Pack"
        font.pixelSize: Config.headerFontSize
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
        
    BatteryIcon {
        id: batteryIcon
        anchors {
            left: batteryDebugCluster.left
            leftMargin: 100
            verticalCenter: batteryDebugCluster.verticalCenter
            verticalCenterOffset: 20
        } 
    }

    ColumnLayout {
        id: tempColumn
        Layout.preferredWidth: 350
        Layout.preferredHeight: 360
        anchors {
            verticalCenter: batteryDebugCluster.verticalCenter
            horizontalCenter: batteryDebugCluster.horizontalCenter
            verticalCenterOffset: 12
        }
        TemperatureGauge {
            id: highThermistorGauge
            temperatureValue: battery.HighTemperature
            gaugeLabel: "High Thermistor"
        }

        TemperatureGauge {
            id: lowThermistorGauge
            temperatureValue: battery.LowTemperature
            gaugeLabel: "Low Thermistor"
        }

        TemperatureGauge {
            id: averageThermistorGauge
            temperatureValue: battery.AverageTemperature
            gaugeLabel: "Average Thermistor"
        }

        TemperatureGauge {
            id: internalTempGauge
            temperatureValue: battery.InternalTemperature
            gaugeLabel: "Internal Temperature"
        }
    }
    
    RowLayout {
        id: gaugeRow
        Layout.preferredWidth: 570
        Layout.preferredHeight: 180
        spacing: 15
        anchors {
            bottom: batteryDebugCluster.bottom
            right: batteryDebugCluster.right
            bottomMargin: 25
            rightMargin: 100
        }

        GaugeTemplate {
            id: highCellVoltageGauge
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "V"
            gaugeTitle: "High Cell Voltage"
            value:   battery.HighCellVoltage
            icon: "BoltIcon.png"
            iconWidth: 20
            iconHeight: 25
        }

        GaugeTemplate {
            id: averageCellVoltageGauge
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "V"
            gaugeTitle: "Average Cell Voltage"
            value: battery.AverageCellVoltage
            icon: "BoltIcon.png"
            iconWidth: 20
            iconHeight: 25
        }

        GaugeTemplate {
            id: lowCellVoltageGauge
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "V"
            gaugeTitle: "Low Cell Voltage"
            value:  battery.LowCellVoltage
            icon: "BoltIcon.png"
            iconWidth: 20
            iconHeight: 25
        }
    }

    GaugeTemplate {
        id: fanSpeedGauge
        anchors {
            horizontalCenter: gaugeRow.horizontalCenter
            horizontalCenterOffset: 25
            bottom: gaugeRow.top
            bottomMargin: 25
        }
        gaugeSize: Config.largeGaugeSize
        minValue: 0
        maxValue: 2500
        units: "m/s"
        gaugeTitle: "Fan Speed"
        value:  battery.FanSpeed
        icon: "FanIcon.png"
        iconWidth: 50
        iconHeight: 50
    }

    Text {
        id: requestedSpeed
        width: implicitWidth
        height: implicitHeight
        anchors {
            verticalCenter: fanSpeedGauge.verticalCenter
            left: fanSpeedGauge.right
            leftMargin: 25
        }
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: Config.fontColor
        font.family: Config.fontStyle
        text: battery.RequestedFanSpeed + "m/s\nRequested Speed"
        font.pixelSize: Config.headerFontSize 
        font.weight: Font.Medium
    }

    GaugeTemplate {
        id: inputVoltageGauge
        anchors {
            right: fanSpeedGauge.left
            rightMargin: 20
            top: fanSpeedGauge.top
        }
        gaugeSize: Config.extraSmallGaugeSize
        minValue: 0
        maxValue: 100
        units: "m/s"
        gaugeTitle: "12V Input Voltage"
        value:  battery.Input12V.toFixed(3)
        icon: "BoltIcon.png"
        iconWidth: 10
        iconHeight: 15
    }

    GaugeTemplate {
        id: fanVoltageGauge
        anchors {
            right: fanSpeedGauge.left
            rightMargin: 20
            bottom: fanSpeedGauge.bottom
        }
        gaugeSize: Config.extraSmallGaugeSize
        minValue: 0
        maxValue: 100
        units: "m/s"
        gaugeTitle: "Fan Voltage"
        value: battery.FanVoltage.toFixed(3)
        icon: "BoltIcon.png"
        iconWidth: 10
        iconHeight: 15
    }
}
