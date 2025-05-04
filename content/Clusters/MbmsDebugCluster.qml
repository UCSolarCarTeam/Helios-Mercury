import QtQuick 6.2
import QtQuick.Layouts
import QtQuick.Controls
import "../Components"
import Mercury

Item {
    id: mbmsDebugCluster
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
        id: mbmsLabel
        color: Config.fontColor
        font.family: Config.fontStyle
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 13
        }
        text: "MBMS"
        font.pixelSize: Config.debugHeaderFontSize
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
        font.pixelSize: Config.headerFontSize
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    RowLayout {
        id: contactorContainer
        width: 400
        height: 35
        anchors {
            horizontalCenter: contactorLabel.horizontalCenter
            top: contactorLabel.bottom
            topMargin: 15
        }
        spacing: 10
        
        Repeater {
            model: [
                { name: "CMN", isConnected: mbms.CommonContactorState, hasError: mbms.CommonContactorError },
                { name: "MOTOR", isConnected: mbms.MotorContactorState, hasError: mbms.MotorContactorError },
                { name: "ARRAY", isConnected: mbms.ArrayContactorState, hasError: mbms.ArrayContactorError },
                { name: "CHARGE", isConnected: mbms.ChargeContactorState, hasError: mbms.ChargeContactorError }, 
                { name: "LV", isConnected: mbms.LvContactorState, hasError: mbms.LvContactorError }
            ]
            
            delegate: Item {
                id: contactorStatusFrame
                Layout.fillWidth: true
                Layout.fillHeight: true
                
                Text {
                    id: contactorTitle
                    text: modelData.name
                    font.pixelSize: Config.contactorLabelFontSize
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: Config.fontStyle
                    color: Config.fontColor
                    anchors.bottom: contactorIcon.top
                    anchors.bottomMargin: 2
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                
                DashIcon {
                    id: contactorIcon
                    width: 20
                    height: 20
                    imageSource: modelData.hasError ? "../Images/Exclamation.png" : 
                                (modelData.isConnected ? "../Images/ContactorConnected.png" : "../Images/ContactorDisconnected.png")
                    iconMaskColor: modelData.hasError ? Config.contactorDisconnectedColor : 
                                (modelData.isConnected ? Config.contactorConnectedColor : Config.contactorDisconnectedColor)
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 2
                }
            }
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
        font.pixelSize: Config.headerFontSize
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    ColumnLayout {
        id: statusContainer
        width: 305
        height: 120
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
                    { label: "Allow \nCharge", isOn: mbms.AllowCharge },
                    { label: "Allow \nDischarge", isOn: mbms.AllowDischarge },
                    { label: "Charge \nShould Trip", isOn: mbms.ChargeShouldTrip}
                ]

                delegate: Item {
                    width: 65
                    height: 50
                    
                    Text {
                        id: statusTitle
                        text: modelData.label
                        font.pixelSize: Config.contactorLabelFontSize
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: Config.fontStyle
                        color: Config.fontColor
                        anchors.bottom: statusIcon.top
                        anchors.bottomMargin: 2
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    
                    DashIcon {
                        id: statusIcon
                        width: 24
                        height: 24
                        imageSource: modelData.isOn ? "../Images/MpptMbmsStatusOn.png" : "../Images/MpptMbmsStatusOff.png"
                        iconMaskColor: modelData.isOn ? Config.contactorConnectedColor : Config.contactorDisconnectedColor
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottomMargin: 2
                    }
                }
            }
        }

        RowLayout {
            id: statusBottomRow
            Layout.alignment: Qt.AlignHCenter
            spacing: 15 

            Repeater {
                model: [
                    { label: "High Voltage \nEnable State", isOn: mbms.HighVoltageEnableState },
                    { label: "Orion Can \nReceived Recent", isOn: mbms.OrionCanReceivedRecently },
                    { label: "Discharge \nShould Trip", isOn: mbms.DischargeShouldTrip }
                ]

                delegate: Item {
                    width: 90
                    height: 50
                    
                    Text {
                        id: statusTitle
                        text: modelData.label
                        font.pixelSize: Config.contactorLabelFontSize
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: Config.fontStyle
                        color: Config.fontColor
                        anchors.bottom: statusIcon.top
                        anchors.bottomMargin: 2
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    
                    DashIcon {
                        id: statusIcon
                        width: 24
                        height: 24
                        imageSource: modelData.isOn ? "../Images/MpptMbmsStatusOn.png" : "../Images/MpptMbmsStatusOff.png"
                        iconMaskColor: modelData.isOn ? Config.contactorConnectedColor : Config.contactorDisconnectedColor
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottomMargin: 2
                    }
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
        font.pixelSize: Config.headerFontSize
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
                { label: "High Cell \nVoltage Trip", isTripped: mbms.HighCellVoltageTrip },
                { label: "Low Cell \nVoltage Trip", isTripped: mbms.LowCellVoltageTrip },
                { label: "High Common \nCurrent Trip", isTripped: mbms.HighCommonCurrentTrip },
                { label: "Motor High TC \nTrip", isTripped: mbms.MotorHighTemperatureCurrentTrip},
                { label: "Array High TC \nTrip", isTripped: mbms.ArrayHighTemperatureCurrentTrip},
                { label: "LV High TC \nTrip", isTripped: mbms.LvHighTemperatureCurrentTrip},
                { label: "Charge \nHigh/Temp Trip", isTripped: mbms.ChargeHighTemperatureCurrentTrip},
                { label: "Protection \nTrip", isTripped: mbms.ProtectionTrip},
                { label: "Orion Message \nTimeout Trip", isTripped: mbms.OrionMessageTimeoutTrip},                
                { label: "Contactor \nDisconnect Trip", isTripped: mbms.ContactorDisconnectedUnexpectedlyTrip}
            ]
            delegate: Item {
                id: statusFrame
                width: 90
                height: 50
                
                Text {
                    id: statusTitle
                    text: modelData.label
                    font.pixelSize: Config.contactorLabelFontSize
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: Config.fontStyle
                    color: Config.fontColor
                    anchors.bottom: statusIcon.top
                    anchors.bottomMargin: 2
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                
                DashIcon {
                    id: statusIcon
                    width: 24
                    height: 24
                    imageSource: modelData.isTripped ? "../Images/MpptMbmsStatusOn.png" : "../Images/MpptMbmsStatusOff.png"
                    iconMaskColor: modelData.isTripped ? Config.contactorConnectedColor : Config.contactorDisconnectedColor
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 2
                }
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
