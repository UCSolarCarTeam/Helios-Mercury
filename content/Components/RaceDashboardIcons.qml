import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: raceDashboardIcons
    width: 425
    height: 35

    RowLayout {
        id: iconRow
        anchors.fill: parent
        spacing: 20  // Adjust this value as needed

        Item { Layout.fillWidth: true } // Left spacer

        // Find the required packet
        DashIcon {
            id: hornMuteIcon
            isOn: true
            imageSource: "../Images/HornMutedIcon.png"
        }

        Item { Layout.fillWidth: true } // Middle spacer

        //find the required packet
        DashIcon {
            id: parkingBrakeIcon
            height: 27
            width: 37
            isOn: true
            imageSource: "../Images/ParkingBrake.png"
        }

        Item { Layout.fillWidth: true } // Middle spacer

        DashIcon {
            id: drlIcon
            isOn: b3.DaytimeRunningLightSignalOut
            imageSource: "../Images/DaytimeRunningLights.png"
        }

        Item { Layout.fillWidth: true } // Middle spacer

        DashIcon {
            id: headlightsIcon
            isOn: b3.HeadlightsSwitchIn
            imageSource: "../Images/Headlights.png"
        }

        Item { Layout.fillWidth: true } // Right spacer
    }
}
