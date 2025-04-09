import QtQuick 
import QtQuick.Layouts
import QtQuick.Controls
import "../Components"
import Mercury

Item {
    id: mpptDebugCluster
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
        id: mpptMbbsLabel
        color: Config.fontColor
        font.family: Config.fontStyle
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 15
        }
        text: "MPPT"
        font.pixelSize: Config.headerFontSize
    }

    Text {
        text: "test" + mppt0.ArrayCurrent
        color: "#ffffff"
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
        font.pixelSize: Config.headerFontSize
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
        units: "V"
        gaugeTitle: "MPPT Current"
        value: Math.round(( mppt0.ArrayCurrent + mppt1.ArrayCurrent + mppt2.ArrayCurrent + mppt3.ArrayCurrent ) / 4)
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
        value: Math.round(( mppt0.ArrayVoltage + mppt1.ArrayVoltage + mppt2.ArrayVoltage + mppt3.ArrayVoltage ) / 4)
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
        value: Math.round(( mppt0.BatteryVoltage + mppt1.BatteryVoltage + mppt2.BatteryVoltage + mppt3.BatteryVoltage ) / 4)
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
        temperatureValue: Math.round(( mppt0.Temperature + mppt1.Temperature + mppt2.Temperature + mppt3.Temperature ) / 4)
    }

    // MPPT 0 - Top Left
    ColumnLayout {
        id: mppt0
        Layout.preferredWidth: 570
        Layout.preferredHeight: 250
        spacing: 10
        anchors {
            top: parent.top
            topMargin: 20
            left: parent.left
            leftMargin: 100
        }
        
        Text {
            id: mppt0Label
            Layout.alignment: Qt.AlignHCenter
            color: Config.fontColor
            font.family: Config.fontStyle
            text: "MPPT 0"
            font.pixelSize: Config.headerFontSize
            font.bold: true
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
                units: "V"
                gaugeTitle: "MPPT Current"
                //value: mppt0.ArrayCurrent
                value: b3.Acceleration
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
                value: mppt0.ArrayVoltage
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
                value: mppt0.BatteryVoltage
                icon: "BoltIcon.png"
                iconWidth: 20
                iconHeight: 25
            }
        }

        TemperatureGauge {
            id: tempGauge0
            baseHeight: 0
            Layout.alignment: Qt.AlignHCenter
            temperatureValue: mppt0.Temperature
        }
    }

    // MPPT 1 - Top Right
    ColumnLayout {
        id: mppt1
        Layout.preferredWidth: 570
        Layout.preferredHeight: 250
        spacing: 10
        anchors {
            top: parent.top
            topMargin: 20       
            right: parent.right
            rightMargin: 100
        }
        
        Text {
            id: mppt1Label
            Layout.alignment: Qt.AlignHCenter
            color: Config.fontColor
            font.family: Config.fontStyle
            text: "MPPT 1"
            font.pixelSize: Config.headerFontSize
            font.bold: true
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
                units: "V"
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
                value: mppt1.ArrayVoltage
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
                value: mppt1.BatteryVoltage
                icon: "BoltIcon.png"
                iconWidth: 20
                iconHeight: 25
            }
        }

        TemperatureGauge {
            id: tempGauge1
            baseHeight: 0
            Layout.alignment: Qt.AlignHCenter
            temperatureValue: mppt1.Temperature
        }
    }

    // MPPT 2 - Bottom Left
    ColumnLayout {
        id: mppt2
        Layout.preferredWidth: 570
        Layout.preferredHeight: 250
        spacing: 10
        anchors {
            bottom: parent.bottom
            bottomMargin: 50
            left: parent.left
            leftMargin: 100
        }
        
        Text {
            id: mppt2Label
            Layout.alignment: Qt.AlignHCenter
            color: Config.fontColor
            font.family: Config.fontStyle
            text: "MPPT 2"
            font.pixelSize: Config.headerFontSize
            font.bold: true
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
                units: "V"
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
                value: mppt2.ArrayVoltage
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
                value: mppt2.BatteryVoltage
                icon: "BoltIcon.png"
                iconWidth: 20
                iconHeight: 25
            }
        }

        TemperatureGauge {
            id: tempGauge2
            baseHeight: 0
            Layout.alignment: Qt.AlignHCenter
            temperatureValue: mppt2.Temperature
        }
    }

    // MPPT 3 - Bottom Right
    ColumnLayout {
        id: mppt3
        Layout.preferredWidth: 570
        Layout.preferredHeight: 250
        spacing: 10
        anchors {
            bottom: parent.bottom
            bottomMargin: 50
            right: parent.right
            rightMargin: 100
        }
        
        Text {
            id: mppt3Label
            Layout.alignment: Qt.AlignHCenter
            color: Config.fontColor
            font.family: Config.fontStyle
            text: "MPPT 3"
            font.pixelSize: Config.headerFontSize
            font.bold: true
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
                units: "V"
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
                value: mppt3.ArrayVoltage
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
                value: mppt3.BatteryVoltage
                icon: "BoltIcon.png"
                iconWidth: 20
                iconHeight: 25
            }
        }

        TemperatureGauge {
            id: tempGauge3
            baseHeight: 0
            Layout.alignment: Qt.AlignHCenter
            temperatureValue: mppt3.Temperature
        }
    }
}
