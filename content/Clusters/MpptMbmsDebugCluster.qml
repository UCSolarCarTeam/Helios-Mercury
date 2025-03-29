import QtQuick 2.15
import "../Components"

Item {
    id: mpptMbmsDebugClusterCluster
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
        x: 1380
        y: 120
        width: 310
        height: 130

        Column {
            anchors.fill: parent
            spacing: 20

            // First Row (4 items)
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 15 // Rounded from 16 for consistency

                StatusIcon {
                    width: 65
                    height: 50
                    label: "Strobe\nBMS Light"
                    isOn: mbms.StrobeBmsLight
                }

                StatusIcon {
                    width: 65
                    height: 50
                    label: "Allow Charge"
                    isOn: mbms.AllowCharge
                }

                StatusIcon {
                    width: 65
                    height: 50
                    label: "Allow Discharge"
                    isOn: mbms.AllowDischarge
                }

                StatusIcon {
                    width: 75
                    height: 50
                    label: "Charge Should Trip"
                    isOn: mbms.ChargeShouldTrip
                }
            }

            // Second Row (3 items)
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 30

                StatusIcon {
                    width: 75
                    height: 50
                    label: "High Voltage Enable State"
                    isOn: mbms.HighVoltageEnableState
                }

                StatusIcon {
                    width: 100
                    height: 50
                    label: "Orion Can Received Recent"
                    isOn: mbms.OrionCanReceivedRecently
                }

                StatusIcon {
                    width: 70
                    height: 50
                    label: "Discharge Should Trip"
                    isOn: mbms.DischargeShouldTrip
                }
            }
        }
    }

}