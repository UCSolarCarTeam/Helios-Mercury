import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import "../Components"
import Mercury

Item {
    id: mpptMbmsDebugCluster
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
        text: "MPPT & MBMS"
        font.pixelSize: Config.headerFontSize
    }

    RowLayout {
        id: contactorContainer
        width: 400
        height: 35
        anchors {
            right: mpptMbmsDebugCluster.right
            top: mpptMbmsDebugCluster.top
            rightMargin: 250
            topMargin: 40
        }
        spacing: 10
        
        Repeater {
            model: [
                { name: "CMN", isConnected: mbms.CommonContactorState },
                { name: "MOTOR", isConnected: mbms.MotorContactorState },
                { name: "ARRAY", isConnected: mbms.ArrayContactorState },
                { name: "CHARGE", isConnected: mbms.ChargeContactorState }, 
                { name: "LV", isConnected: mbms.LvContactorState }
            ]
            
            delegate: Item {
                id: contactorStatusFrame
                Layout.fillWidth: true
                Layout.fillHeight: true
                
                Text {
                    id: contactorTitle
                    text: modelData.name
                    font.pixelSize: Config.contactorLabelFontSize
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
                    imageSource: modelData.isConnected ? "../Images/ContactorConnected.png" : "../Images/ContactorDisconnected.png"
                    iconMaskColor: modelData.isConnected ? Config.contactorConnectedColor : Config.contactorDisconnectedColor
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 2
                }
            }
        }
    }

    Column {
        id: statusContainer
        width: 305
        height: 120
        anchors {
            horizontalCenter: contactorContainer.horizontalCenter
            top: contactorContainer.bottom
            topMargin: 35
        }
        spacing: 20

        RowLayout {
            id: statusTopRow
            anchors {
                horizontalCenter: statusContainer.horizontalCenter
                top: statusContainer.top
            }
            spacing: 15 

            Repeater {
                model: [
                    { label: "Strobe\nBMS Light", isOn: mbms.StrobeBmsLight },
                    { label: "Allow \nCharge", isOn: mbms.AllowCharge },
                    { label: "Allow \nDischarge", isOn: mbms.AllowDischarge },
                    { label: "Charge \nShould Trip", isOn: mbms.ChargeShouldTrip}
                ]

                delegate: StatusIcon {
                    width: 65
                    height: 50
                    label: modelData.label
                    isOn: modelData.isOn
                }
            }
        }

        RowLayout {
            id: statusBottomRow
            anchors {
                horizontalCenter: statusContainer.horizontalCenter
                bottom: statusContainer.bottom
            }
            spacing: 15 

            Repeater {
                model: [
                    { label: "High Voltage \nEnable State", isOn: mbms.HighVoltageEnableState },
                    { label: "Orion Can \nReceived Recent", isOn: mbms.OrionCanReceivedRecently },
                    { label: "Discharge \nShould Trip", isOn: mbms.DischargeShouldTrip }
                ]

                delegate: StatusIcon {
                    width: 90
                    height: 50
                    label: modelData.label
                    isOn: modelData.isOn
                }
            }
        }
    }

    RowLayout {
        id: gaugeRow
        width: 570
        height: 180
        anchors {
            horizontalCenter: contactorContainer.horizontalCenter
            top: statusContainer.bottom
            topMargin: 35
        }
        
        Repeater {
            model: [
                { title: "MPPT Current", value: 50, minVal: 0, maxVal: 100, gaugeUnits: "V"},
                { title: "MPPT Voltage", value: 50, minVal: 0, maxVal: 100, gaugeUnits: "V"},
                { title: "Battery Voltage", value: 50, minVal: 0, maxVal: 100, gaugeUnits: "V"}
            ]
            delegate: Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
                GaugeTemplate {
                    anchors.centerIn: parent
                    gaugeSize: Config.smallGaugeSize
                    minValue: modelData.minVal
                    maxValue: modelData.maxVal
                    units: modelData.gaugeUnits
                    gaugeTitle: modelData.title
                    value: modelData.value
                    icon: "BoltIcon.png"
                    iconWidth: 20
                    iconHeight: 25
                }
            }
        }
    }

    GridLayout {
        id: gaugeGrid
        width: 960
        height: 375
        columns: 5
        rowSpacing: 15
        columnSpacing: 15
        anchors {
            verticalCenter: mpptMbmsDebugCluster.verticalCenter
            left: mpptMbmsDebugCluster.left 
            leftMargin: 110
        }
        
        Repeater {
            model: [
                { title: "Aux Battery Voltage", value: 50, minVal: 0, maxVal: 100, gaugeUnits: "V"},
                { title: "Motor Voltage", value: 50, minVal: 0, maxVal: 100, gaugeUnits: "V"},
                { title: "Array Voltage", value: 50, minVal: 0, maxVal: 100, gaugeUnits: "V"},
                { title: "LV Voltage", value: 50, minVal: 0, maxVal: 100, gaugeUnits: "V"},
                { title: "Charge Voltage", value: 50, minVal: 0, maxVal: 100, gaugeUnits: "V"},
                { title: "Common Current", value: 50, minVal: 0, maxVal: 100, gaugeUnits: "V"},
                { title: "Motor Current", value: 50, minVal: 0, maxVal: 100, gaugeUnits: "V"},
                { title: "Array Current", value: 50, minVal: 0, maxVal: 100, gaugeUnits: "V"},
                { title: "MPPT Current", value: 50, minVal: 0, maxVal: 100, gaugeUnits: "V"},
                { title: "Charge Current", value: 50, minVal: 0, maxVal: 100, gaugeUnits: "V"}
            ]
            delegate: Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
                GaugeTemplate {
                    anchors.centerIn: parent
                    gaugeSize: Config.smallGaugeSize
                    minValue: modelData.minVal
                    maxValue: modelData.maxVal
                    units: modelData.gaugeUnits
                    gaugeTitle: modelData.title
                    value: modelData.value
                    icon: "BoltIcon.png"
                    iconWidth: 20
                    iconHeight: 25
                }
            }
        }
    } 

    TemperatureGauge {
        id: tempGauge
        temperatureValue: 50
        anchors {
            horizontalCenter: contactorContainer.horizontalCenter
            top: gaugeRow.bottom
            topMargin: -10
        }
    }
}
