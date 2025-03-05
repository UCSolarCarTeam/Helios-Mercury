import QtQuick 2.15
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

    Item {
        id: statusContainer
        x: 1382
        y: 119
        width: 307
        height: 130

        Column {
            anchors.fill: parent
            spacing: 32

            // First Row (4 items)
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 16 

                MBMSStatusIcon {
                    width: 64
                    height: 49
                    topText: "Strobe"
                    bottomText: "BMS Light"
                    isOn: mbms.StrobeBmsLight
                }

                MBMSStatusIcon {
                    width: 63
                    height: 49
                    topText: "Allow"
                    bottomText: "Charge"
                    isOn: mbms.AllowCharge
                }

                MBMSStatusIcon {
                    width: 62
                    height: 49
                    topText: "Allow"
                    bottomText: "Discharge"
                    isOn: mbms.AllowDischarge
                }

                MBMSStatusIcon {
                    width: 73
                    height: 49
                    topText: "Charge"
                    bottomText: "Should Trip"
                    isOn: mbms.ChargeShouldTrip
                }
            }

            // Second Row (3 items)
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 28

                MBMSStatusIcon {
                    width: 77
                    height: 49
                    topText: "High Voltage"
                    bottomText: "Enable State"
                    isOn: mbms.HighVoltageEnableState
                }

                MBMSStatusIcon {
                    width: 102
                    height: 49
                    topText: "Orion Can"
                    bottomText: "Received Recent"
                    isOn: mbms.OrionCanReceivedRecently
                }

                MBMSStatusIcon {
                    width: 68
                    height: 49
                    topText: "Discharge"
                    bottomText: "Should Trip"
                    isOn: mbms.DischargeShouldTrip
                }
            }
        }
    }
}