import QtQuick 2.15
import QtQuick.Layouts
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

    Rectangle {
        id: contactorStatusComponent
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin:12
        width: 475
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
                verticalAlignment: Text.AlignVCenter
                Layout.alignment: Qt.AlignVCenter
            }

            ContactorStatus {
                id: cmnContactor
                contactor: "cmn"
                isConnected: mbms.CommonContactorState
                Layout.fillWidth: true
            }

            ContactorStatus {
                id: hvContactor
                contactor: "Motor"
                isConnected: mbms.MotorContactorState
                Layout.fillWidth: true
            }

            ContactorStatus {
                id: lvnContactor
                contactor: "LV"
                isConnected: mbms.LvContactorState
                Layout.fillWidth: true
            }

            ContactorStatus {
                id: arrayContactor
                contactor: "Array"
                isConnected: mbms.ArrayContactorState
                Layout.fillWidth: true
            }

            ContactorStatus {
                id: chargeContactor
                contactor: "Charge"
                isConnected: mbms.ChargeContactorState
                Layout.fillWidth: true
            }

            ConnectionStatus {
                id: telemetryStatus
            }
            ConnectionStatus {
                id: radioBoardStatus
                isRadioBoard: true
            }
        }
    }
}
