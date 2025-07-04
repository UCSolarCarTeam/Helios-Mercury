import QtQuick 6.2
import QtQuick.Layouts
import QtQuick.Controls
import "../Components"
import Mercury

Item {
    id: mpptDebugCluster
    width: 1920
    height: 550

    Backplate { 
        id: backplate
    }

    Text {
        id: mpptLabel
        color: Config.fontColor
        font.family: Config.fontStyle
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 13
        }
        text: "MPPT"
        font.pixelSize: Config.fontSize6
        font.weight: Font.Medium
    }

    Text {
        id: mpptAverageLabel
        anchors {
            horizontalCenter: mpptDebugCluster.horizontalCenter
            verticalCenter: mpptDebugCluster.verticalCenter
            verticalCenterOffset: -190
        }
        color: Config.fontColor
        font.family: Config.fontStyle
        text: "MPPT Average"
        font.pixelSize: Config.fontSize4
        font.bold: true
    }

    GaugeTemplate {
        id: mpptAverageCurrentGauge
        anchors {
            horizontalCenter: mpptDebugCluster.horizontalCenter
            top: mpptAverageLabel.bottom
            topMargin: 20
        }
        gaugeSize: Config.smallGaugeSize
        minValue: 0
        maxValue: 100
        units: "mA"
        gaugeTitle: "MPPT Current"
        value: (( mppt0.ArrayCurrent + mppt1.ArrayCurrent + mppt2.ArrayCurrent + mppt3.ArrayCurrent ) / 4)
        icon: "BoltIcon.png"
        iconWidth: 20
        iconHeight: 25
    }

    GaugeTemplate {
        id: mpptAverageVoltageGauge
        anchors {
            horizontalCenter: mpptDebugCluster.horizontalCenter
            horizontalCenterOffset: 140
            top: mpptAverageCurrentGauge.verticalCenter
            topMargin: 40
        }
        gaugeSize: Config.smallGaugeSize
        minValue: 0
        maxValue: 100
        units: "V"
        gaugeTitle: "MPPT Voltage"
        value: (( mppt0.ArrayVoltage + mppt1.ArrayVoltage + mppt2.ArrayVoltage + mppt3.ArrayVoltage ) / 400) // 10 mV 
        icon: "BoltIcon.png"
        iconWidth: 20
        iconHeight: 25
    }

    GaugeTemplate {
        id: mpptAverageBatteryGauge
        anchors {
            horizontalCenter: mpptDebugCluster.horizontalCenter
            horizontalCenterOffset: -140
            top: mpptAverageCurrentGauge.verticalCenter
            topMargin: 40
        }
        gaugeSize: Config.smallGaugeSize
        minValue: 0
        maxValue: 100
        units: "V" 
        gaugeTitle: "Battery Voltage"
        value: (( mppt0.BatteryVoltage + mppt1.BatteryVoltage + mppt2.BatteryVoltage + mppt3.BatteryVoltage ) / 400) // 10 mV 
        icon: "BoltIcon.png"
        iconWidth: 20
        iconHeight: 25
    }

    TemperatureGauge {
        id: averageTempGauge
        anchors {
            horizontalCenter: mpptDebugCluster.horizontalCenter
            top: mpptAverageBatteryGauge.bottom
            topMargin: 25
        }
        baseHeight: 0
        temperatureValue: ((mppt0.Temperature + mppt1.Temperature + mppt2.Temperature + mppt3.Temperature) / 400) // 1/100th °C 
    }

    ColumnLayout {
        id: mppt0Container
        Layout.preferredWidth: 570
        Layout.preferredHeight: 250
        spacing: 10
        anchors {
            top: parent.top
            topMargin: 20
            left: parent.left
            leftMargin: 100
        }
        
        RowLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: Config.fontSize4
            spacing: 10
            
            Text {
                id: mppt0Label
                Layout.preferredWidth: implicitWidth  
                Layout.alignment: Qt.AlignVCenter     
                color: Config.fontColor
                font.family: Config.fontStyle
                text: "MPPT 0"
                font.pixelSize: Config.fontSize4
                font.bold: true
            }

            DashIcon {
                Layout.preferredWidth: 24
                Layout.preferredHeight: 24
                imageSource: mppt0.MpptStatus ? "../Images/MpptMbmsStatusOn.png" : "../Images/MpptMbmsStatusOff.png"
                iconMaskColor: mppt0.MpptStatus ? Config.valueLow : Config.valueHigh
            }
        }

        RowLayout {
            id: mppt0Gauges
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: 180
            spacing: 10

            GaugeTemplate {
                id: mppt0CurrentGauge
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "mA"
                gaugeTitle: "MPPT Current"
                value: mppt0.ArrayCurrent
                icon: "BoltIcon.png"
                iconWidth: 20
                iconHeight: 25
            }

            GaugeTemplate {
                id: mppt0VoltageGauge
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "V" 
                gaugeTitle: "MPPT Voltage"
                value: mppt0.ArrayVoltage / 100 // 10 mV
                icon: "BoltIcon.png"
                iconWidth: 20
                iconHeight: 25
            }

            GaugeTemplate {
                id: mppt0BatteryGauge
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "V"
                gaugeTitle: "Battery Voltage"
                value: mppt0.BatteryVoltage / 100 // 10 mV
                icon: "BoltIcon.png"
                iconWidth: 20
                iconHeight: 25
            }
        }

        TemperatureGauge {
            id: tempGauge0
            baseHeight: 0
            Layout.alignment: Qt.AlignHCenter
            temperatureValue: mppt0.Temperature / 100 // 1/100th °C 
        }
    }

    ColumnLayout {
        id: mppt1Container
        Layout.preferredWidth: 570
        Layout.preferredHeight: 250
        spacing: 10
        anchors {
            top: parent.top
            topMargin: 20       
            right: parent.right
            rightMargin: 100
        }
        
        RowLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: Config.fontSize4
            spacing: 10
            
            Text {
                id: mppt1Label
                Layout.preferredWidth: implicitWidth  
                Layout.alignment: Qt.AlignVCenter     
                color: Config.fontColor
                font.family: Config.fontStyle
                text: "MPPT 1"
                font.pixelSize: Config.fontSize4
                font.bold: true
            }

            DashIcon {
                Layout.preferredWidth: 24
                Layout.preferredHeight: 24
                imageSource: mppt1.MpptStatus ? "../Images/MpptMbmsStatusOn.png" : "../Images/MpptMbmsStatusOff.png"
                iconMaskColor: mppt1.MpptStatus ? Config.valueLow : Config.valueHigh
            }
        }

        RowLayout {
            id: mppt1Gauges
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: 180
            spacing: 10

            GaugeTemplate {
                id: mppt1CurrentGauge
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "mA"
                gaugeTitle: "MPPT Current"
                value: mppt1.ArrayCurrent
                icon: "BoltIcon.png"
                iconWidth: 20
                iconHeight: 25
            }

            GaugeTemplate {
                id: mppt1VoltageGauge
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "V" 
                gaugeTitle: "MPPT Voltage" 
                value: mppt1.ArrayVoltage / 100 // 10 mV
                icon: "BoltIcon.png"
                iconWidth: 20
                iconHeight: 25
            }

            GaugeTemplate {
                id: mppt1BatteryGauge
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "V" 
                gaugeTitle: "Battery Voltage" 
                value: mppt1.BatteryVoltage / 100 // 10 mV
                icon: "BoltIcon.png"
                iconWidth: 20
                iconHeight: 25
            }
        }

        TemperatureGauge {
            id: tempGauge1
            baseHeight: 0
            Layout.alignment: Qt.AlignHCenter
            temperatureValue: mppt1.Temperature / 100 // 1/100th °C 
        }
    }

    ColumnLayout {
        id: mppt2Container
        Layout.preferredWidth: 570
        Layout.preferredHeight: 250
        spacing: 10
        anchors {
            bottom: parent.bottom
            bottomMargin: 50
            left: parent.left
            leftMargin: 100
        }
        
        RowLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: Config.fontSize4
            spacing: 10
            
            Text {
                id: mppt2Label
                Layout.preferredWidth: implicitWidth  
                Layout.alignment: Qt.AlignVCenter     
                color: Config.fontColor
                font.family: Config.fontStyle
                text: "MPPT 2"
                font.pixelSize: Config.fontSize4
                font.bold: true
            }

            DashIcon {
                Layout.preferredWidth: 24
                Layout.preferredHeight: 24
                imageSource: mppt2.MpptStatus ? "../Images/MpptMbmsStatusOn.png" : "../Images/MpptMbmsStatusOff.png"
                iconMaskColor: mppt2.MpptStatus ? Config.valueLow : Config.valueHigh
            }
        }

        RowLayout {
            id: mppt2Gauges
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: 180
            spacing: 10

            GaugeTemplate {
                id: mppt2CurrentGauge
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "mA"
                gaugeTitle: "MPPT Current"
                value: mppt2.ArrayCurrent
                icon: "BoltIcon.png"
                iconWidth: 20
                iconHeight: 25
            }

            GaugeTemplate {
                id: mppt2VoltageGauge
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "V" 
                gaugeTitle: "MPPT Voltage"
                value: mppt2.ArrayVoltage / 100 // 10 mV
                icon: "BoltIcon.png"
                iconWidth: 20
                iconHeight: 25
            }

            GaugeTemplate {
                id: mppt2BatteryGauge
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "V" 
                gaugeTitle: "Battery Voltage"
                value: mppt2.BatteryVoltage / 100 // 10 mV
                icon: "BoltIcon.png"
                iconWidth: 20
                iconHeight: 25
            }
        }

        TemperatureGauge {
            id: tempGauge2
            baseHeight: 0
            Layout.alignment: Qt.AlignHCenter
            temperatureValue: mppt2.Temperature / 100 // 1/100th °C 
        }
    }

    ColumnLayout {
        id: mppt3Container
        Layout.preferredWidth: 570
        Layout.preferredHeight: 250
        spacing: 10
        anchors {
            bottom: parent.bottom
            bottomMargin: 50
            right: parent.right
            rightMargin: 100
        }
        
        RowLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: Config.fontSize4
            spacing: 10
            
            Text {
                id: mppt3Label
                Layout.preferredWidth: implicitWidth  
                Layout.alignment: Qt.AlignVCenter     
                color: Config.fontColor
                font.family: Config.fontStyle
                text: "MPPT 3"
                font.pixelSize: Config.fontSize4
                font.bold: true
            }

            DashIcon {
                Layout.preferredWidth: 24
                Layout.preferredHeight: 24
                imageSource: mppt3.MpptStatus ? "../Images/MpptMbmsStatusOn.png" : "../Images/MpptMbmsStatusOff.png"
                iconMaskColor: mppt3.MpptStatus ? Config.valueLow : Config.valueHigh
            }
        }

        RowLayout {
            id: mppt3Gauges
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: 180
            spacing: 10

            GaugeTemplate {
                id: mppt3CurrentGauge
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "mA"
                gaugeTitle: "MPPT Current"
                value: mppt3.ArrayCurrent
                icon: "BoltIcon.png"
                iconWidth: 20
                iconHeight: 25
            }

            GaugeTemplate {
                id: mppt3VoltageGauge
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "V" 
                gaugeTitle: "MPPT Voltage"
                value: mppt3.ArrayVoltage / 100 // 10 mV
                icon: "BoltIcon.png"
                iconWidth: 20
                iconHeight: 25
            }

            GaugeTemplate {
                id: mppt3BatteryGauge
                gaugeSize: Config.smallGaugeSize
                minValue: 0
                maxValue: 100
                units: "V"
                gaugeTitle: "Battery Voltage"
                value: mppt3.BatteryVoltage / 100 // 10 mV
                icon: "BoltIcon.png"
                iconWidth: 20
                iconHeight: 25
            }
        }

        TemperatureGauge {
            id: tempGauge3
            baseHeight: 0
            Layout.alignment: Qt.AlignHCenter
            temperatureValue: mppt3.Temperature / 100 // 1/100th °C 
        }
    }
}
