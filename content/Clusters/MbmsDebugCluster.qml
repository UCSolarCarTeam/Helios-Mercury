import QtQuick 6.2
import QtQuick.Layouts
import QtQuick.Controls
import "../Components"
import Mercury

Item {
    id: mbmsDebugCluster
    width: Config.windowWidth
    width: Config.windowHeight

    Backplate { 
        id: backplate
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
        text: "MBMS"
        font.pixelSize: Config.fontSize6
        font.weight: Font.Medium
    }

    Text {
        id: contactorLabel
        width: 400
        anchors {
            right: mbmsDebugCluster.right
            top: mbmsDebugCluster.top
            rightMargin: 220
            topMargin: 30
        }
        color: Config.fontColor
        font.family: Config.fontStyle
        text: "Contactor Status"
        font.pixelSize: Config.fontSize4
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    ContactorStatus {
        id: contactorContainer
        anchors {
            horizontalCenter: contactorLabel.horizontalCenter
            top: contactorLabel.bottom
            topMargin: 15
        }
    }

    Text {
        id: statusLabel
        width: 400
        anchors {
            horizontalCenter: contactorContainer.horizontalCenter
            top: contactorContainer.bottom
            topMargin: 30
        }
        color: Config.fontColor
        font.family: Config.fontStyle
        text: "Miscellaneous Status"
        font.pixelSize: Config.fontSize4
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    ColumnLayout {
        id: statusContainer
        width: 305
        anchors {
            horizontalCenter: statusLabel.horizontalCenter
            top: statusLabel.bottom
            topMargin: 15
        }
        spacing: 20

        RowLayout {
            id: statusTopRow
            Layout.alignment: Qt.AlignHCenter
            spacing: 15

            Repeater {
                model: [
                    { label: "Strobe\nBMS Light", isOn: mbms.StrobeBmsLight },
                    { label: "Allow\nCharge", isOn: mbms.AllowCharge },
                    { label: "Allow\nDischarge", isOn: mbms.AllowDischarge },
                    { label: "Charge\nShould Trip", isOn: mbms.ChargeShouldTrip}
                ]

                delegate: StatusIcon {
                    label: modelData.label
                    isOn: modelData.isOn
                }
            }
        }

        RowLayout {
            id: statusBottomRow
            Layout.alignment: Qt.AlignHCenter
            spacing: 15

            Repeater {
                model: [
                    { label: "High Voltage\nEnable State", isOn: mbms.HighVoltageEnableState },
                    { label: "Orion Can\nReceived Recent", isOn: mbms.OrionCanReceivedRecently },
                    { label: "Discharge\nShould Trip", isOn: mbms.DischargeShouldTrip }
                ]

                delegate: StatusIcon {
                    Layout.preferredWidth: 100
                    label:  modelData.label
                    isOn: modelData.isOn
                }
            }
        }
    }

    Text {
        id: tripStatusLabel
        width: 400
        anchors {
            horizontalCenter: statusContainer.horizontalCenter
            top: statusContainer.bottom
            topMargin: 30
        }
        color: Config.fontColor
        font.family: Config.fontStyle
        text: "Trip Status"
        font.pixelSize: Config.fontSize4
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    GridLayout {
        id: tripStatusGrid
        width: 465
        height: 120
        columns: 5
        rowSpacing: 10
        columnSpacing: 5
        anchors {
            horizontalCenter: tripStatusLabel.horizontalCenter
            top: tripStatusLabel.bottom
            topMargin: 15
        }

        Repeater {
            model: [
                { label: "High Cell\nVoltage Trip", isTripped: mbms.HighCellVoltageTrip },
                { label: "Low Cell\nVoltage Trip", isTripped: mbms.LowCellVoltageTrip },
                { label: "High Common\nCurrent Trip", isTripped: mbms.HighCommonCurrentTrip },
                { label: "Motor High TC\nTrip", isTripped: mbms.MotorHighTemperatureCurrentTrip},
                { label: "Array High TC\nTrip", isTripped: mbms.ArrayHighTemperatureCurrentTrip},
                { label: "LV High TC\nTrip", isTripped: mbms.LvHighTemperatureCurrentTrip},
                { label: "Charge\nHigh/Temp Trip", isTripped: mbms.ChargeHighTemperatureCurrentTrip},
                { label: "Protection\nTrip", isTripped: mbms.ProtectionTrip},
                { label: "Orion Message\nTimeout Trip", isTripped: mbms.OrionMessageTimeoutTrip},                
                { label: "Contactor\nDisconnect Trip", isTripped: mbms.ContactorDisconnectedUnexpectedlyTrip}
            ]
            
            delegate: StatusIcon {
                Layout.preferredWidth: 90
                label: modelData.label
                isOn: modelData.isTripped
            }
        }
    }

    GridLayout {
        id: gaugeGrid
        width: 1100
        height: 375
        columns: 5
        rowSpacing: 20
        columnSpacing: 20
        anchors {
            verticalCenter: mbmsDebugCluster.verticalCenter
            left: mbmsDebugCluster.left 
            leftMargin: 110
        }

        GaugeTemplate {
            id: mbmsAuxBatteryVoltage
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "V" // ADC Count
            gaugeTitle: "Aux Battery Voltage"
            value: mbms.AuxillaryBatteryVoltage
            icon: "BoltIcon.png"
            iconWidth: 20
            iconHeight: 25
        }

        GaugeTemplate {
            id: mbmsMotorVoltage
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "V" // ADC Count
            gaugeTitle: "Motor Voltage"
            value: mbms.MotorVoltage
            icon: "BoltIcon.png"
            iconWidth: 20
            iconHeight: 25
        }

        GaugeTemplate {
            id: mbmsArrayVoltage
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "V" // ADC Count
            gaugeTitle: "Array Voltage"
            value: mbms.ArrayVoltage
            icon: "BoltIcon.png"
            iconWidth: 20
            iconHeight: 25
        }

        GaugeTemplate {
            id: mbmsLvVoltage
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "V" // ADC Count
            gaugeTitle: "LV Voltage"
            value: mbms.LvVoltage
            icon: "BoltIcon.png"
            iconWidth: 20
            iconHeight: 25
        }

        GaugeTemplate {
            id: mbmsChargeVoltage
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "V" // ADC Count
            gaugeTitle: "Charge Voltage"
            value: mbms.ChargeVoltage
            icon: "BoltIcon.png"
            iconWidth: 20
            iconHeight: 25
        }

        GaugeTemplate {
            id: mbmsCommonCurrent
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "A" // ADC Count
            gaugeTitle: "Common Current"
            value: mbms.CommonCurrent
            icon: "BoltIcon.png"
            iconWidth: 20
            iconHeight: 25
        }

        GaugeTemplate {
            id: mbmsMotorCurrent
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "A" // ADC Count
            gaugeTitle: "Motor Current"
            value: mbms.MotorCurrent
            icon: "BoltIcon.png"
            iconWidth: 20
            iconHeight: 25
        }

        GaugeTemplate {
            id: mbmsArrayCurrent
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "A" // ADC Count
            gaugeTitle: "Array Current"
            value: mbms.ArrayCurrent
            icon: "BoltIcon.png"
            iconWidth: 20
            iconHeight: 25
        }

        GaugeTemplate {
            id: mbmsLvCurrent
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "A" // ADC Count
            gaugeTitle: "LV Current"
            value: mbms.LvCurrent
            icon: "BoltIcon.png"
            iconWidth: 20
            iconHeight: 25
        }

        GaugeTemplate {
            id: mbmsChargeCurrent
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "A" // ADC Count
            gaugeTitle: "ChargeCurrent"
            value: mbms.ChargeCurrent
            icon: "BoltIcon.png"
            iconWidth: 20
            iconHeight: 25
        }
    } 
}
