import "../Components"
import "../Config"
import Mercury
import QtQuick 6.2
import QtQuick.Layouts

Item {
    id: batteryDebugCluster
    width: 1920
    height: 550

    Backplate {
        id: backplate
    }

    Text {
        id: batteryLabel
        color: Config.fontColor
        font.family: Config.fontStyle
        text: "Battery"
        font.pixelSize: Config.fontSize6
        font.weight: Font.Medium
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 13
        }
    }

    GaugeTemplate {
        id: packCurrentGauge
        gaugeSize: Config.mediumGaugeSize
        minValue: 0
        maxValue: 100
        units: "A"
        gaugeTitle: "Pack Current"
        value: battery.PackCurrent.toFixed(2) / 10 // 0.1 A
        icon: "BoltIcon.png"
        iconWidth: 25
        iconHeight: 35
        anchors {
            left: batteryDebugCluster.left
            leftMargin: 465
            verticalCenter: batteryDebugCluster.verticalCenter
        }
    }

    GaugeTemplate {
        id: packVoltageGauge
        gaugeSize: Config.mediumGaugeSize
        minValue: 0
        maxValue: 100
        units: "V"
        gaugeTitle: "Pack Voltage"
        value: battery.PackVoltage.toFixed(2) / 10 // 0.1 V
        icon: "BoltIcon.png"
        iconWidth: 25
        iconHeight: 35
        anchors {
            left: batteryDebugCluster.left
            leftMargin: 225
            verticalCenter: batteryDebugCluster.verticalCenter
            verticalCenterOffset: 130
        }
    }

    GaugeTemplate {
        id: depthOfDischargeGauge
        gaugeSize: Config.mediumGaugeSize
        minValue: 0
        maxValue: 100
        units: "%"
        gaugeTitle: "Depth of Charge"
        value: battery.PackDepthOfDischarge.toFixed(2) / 2 // 0.5%
        icon: "BoltIcon.png"
        iconWidth: 25
        iconHeight: 35
        anchors {
            left: batteryDebugCluster.left
            leftMargin: 225
            verticalCenter: batteryDebugCluster.verticalCenter
            verticalCenterOffset: -130
        }
    }

    Text {
        id: batteryIconLabel
        color: Config.fontColor
        font.family: Config.fontStyle
        text: "Battery Pack"
        font.pixelSize: Config.fontSize4
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            left: batteryDebugCluster.left
            leftMargin: 90
            verticalCenter: batteryDebugCluster.verticalCenter
            verticalCenterOffset: -30
        }
    }

    BatteryIcon {
        id: batteryIcon
        anchors {
            left: batteryDebugCluster.left
            leftMargin: 110
            verticalCenter: batteryDebugCluster.verticalCenter
            verticalCenterOffset: 25
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
            id: highTemperatureGauge

            temperatureValue: battery.HighTemperature
            gaugeLabel: "High Temperature"
        }

        TemperatureGauge {
            id: lowTemperatureGauge

            temperatureValue: battery.LowTemperature
            gaugeLabel: "Low Temperature"
        }

        TemperatureGauge {
            id: averageTemperatureGauge

            temperatureValue: battery.AverageTemperature
            gaugeLabel: "Average Temperature"
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
            bottomMargin: 30
            rightMargin: 100
        }

        GaugeTemplate {
            id: highCellVoltageGauge
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "mV"
            gaugeTitle: "High Cell Voltage"
            value: battery.HighCellVoltage / 10 // 0.1 mV
            icon: "BoltIcon.png"
            iconWidth: 20
            iconHeight: 25
        }

        GaugeTemplate {
            id: averageCellVoltageGauge
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "mV"
            gaugeTitle: "Average Cell Voltage"
            value: battery.AverageCellVoltage / 10 // 0.1 mV
            icon: "BoltIcon.png"
            iconWidth: 20
            iconHeight: 25
        }

        GaugeTemplate {
            id: lowCellVoltageGauge
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "mV"
            gaugeTitle: "Low Cell Voltage"
            value: battery.LowCellVoltage / 10 // 0.1 mV
            icon: "BoltIcon.png"
            iconWidth: 20
            iconHeight: 25
        }
    }

    GaugeTemplate {
        id: fanSpeedGauge
        gaugeSize: Config.largeGaugeSize
        minValue: 0
        maxValue: 6
        //units: "" // units are # in spreadsheet
        gaugeTitle: "Fan Speed"
        value: battery.FanSpeed
        icon: "FanIcon.png"
        iconWidth: 50
        iconHeight: 50
        anchors {
            horizontalCenter: gaugeRow.horizontalCenter
            bottom: gaugeRow.top
            bottomMargin: 20
        }
    }

    Text {
        id: requestedSpeed
        width: implicitWidth
        height: implicitHeight
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: Config.fontColor
        font.family: Config.fontStyle
        text: "Requested Fan Speed: " + battery.RequestedFanSpeed
        font.pixelSize: Config.fontSize4
        font.weight: Font.Medium
        anchors {
            horizontalCenter: fanSpeedGauge.horizontalCenter
            top: fanSpeedGauge.bottom
            topMargin: -15
        }
    }

    GaugeTemplate {
        id: inputVoltageGauge
        gaugeSize: Config.extraSmallGaugeSize
        minValue: 0
        maxValue: 100
        units: "V"
        gaugeTitle: "12V Input Voltage"
        value: battery.Input12V / 10 // 0.1 V
        icon: "BoltIcon.png"
        iconWidth: 10
        iconHeight: 15
        anchors {
            right: fanSpeedGauge.left
            rightMargin: 20
            top: fanSpeedGauge.top
            topMargin: 35
        }
    }

    GaugeTemplate {
        id: fanVoltageGauge
        gaugeSize: Config.extraSmallGaugeSize
        minValue: 0
        maxValue: 100
        units: "V"
        gaugeTitle: "Fan Voltage"
        value: battery.FanVoltage / 100 // 0.01 V
        icon: "BoltIcon.png"
        iconWidth: 10
        iconHeight: 15
        anchors {
            left: fanSpeedGauge.right
            leftMargin: 20
            top: fanSpeedGauge.top
            topMargin: 35
        }
    }
}
