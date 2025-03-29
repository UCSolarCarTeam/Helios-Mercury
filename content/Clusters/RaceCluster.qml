import QtQuick 2.15
import QtQuick.Layouts
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
        font.pixelSize: 14
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

    RaceClusterIcons{
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

    Rectangle {
        id: contactorStatusComponent
        y: 505
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.horizontalCenterOffset: 0
        anchors.bottomMargin: 10
        width: 480
        height: 35
        color: "transparent"

        RowLayout {
            id: layout
            anchors.fill: parent
            spacing: 10

            Text {
                id: contactorSectionTitle
                text: qsTr("Contactor\n Status")
                color: "white"
                font.pixelSize: 14
                Layout.fillHeight: true
                Layout.bottomMargin: 4
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            ContactorStatus {
                id: cmnContactor
                contactor: "CMN"
                isConnected: mbms.CommonContactorState
                height: parent.height
                Layout.fillWidth: true
            }

            ContactorStatus {
                id: hvContactor
                contactor: "MOTOR"
                isConnected: mbms.MotorContactorState
                height: parent.height
                Layout.fillWidth: true
            }

            ContactorStatus {
                id: lvnContactor
                contactor: "LV"
                isConnected: mbms.LvContactorState
                height: parent.height
                Layout.fillWidth: true
            }

            ContactorStatus {
                id: arrayContactor
                contactor: "ARRAY"
                isConnected: mbms.ArrayContactorState
                height: parent.height
                Layout.fillWidth: true
            }

            ContactorStatus {
                id: chargeContactor
                contactor: "CHARGE"
                isConnected: mbms.ChargeContactorState
                height: parent.height
                Layout.fillWidth: true
            }
        }
    }
}
