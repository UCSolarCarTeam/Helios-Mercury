import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia

Item {
    id: raceDashboardIcons
    width: 425
    height: 35

    AudioDevice {
        id: audioDevice
        mode: AudioDevice.Output
    }

    // Timer to periodically check mute status
    Timer {
        id: muteCheckTimer
        interval: 500 // Check every 500ms
        running: true
        repeat: true
        onTriggered: {
            // Check if system is muted or volume is 0
            if (audioDevice.volume <= 0 || audioDevice.muted) {
                dashMuteIcon.isOn = true
            } else {
                dashMuteIcon.isOn = false
            }
        }
    }
    RowLayout {
        id: iconRow
        anchors.fill: parent
        spacing: 20

        Item { Layout.fillWidth: true }

        DashIcon {
            id: dashMuteIcon
            imageSource: "../Images/DashMutedIcon.png"
        }

        Item { Layout.fillWidth: true }

        DashIcon {
            id: parkingBrakeIcon
            height: 25
            width: 35
            isOn: b3.BrakeSwitch
            isHighContrast: true
            imageSource: "../Images/ParkingBrake.png"
        }

        Item { Layout.fillWidth: true }

        DashIcon {
            id: drlIcon
            isOn: b3.DaytimeRunningLightSignalOut
            imageSource: "../Images/DaytimeRunningLights.png"
        }

        Item { Layout.fillWidth: true }

        DashIcon {
            id: headlightsIcon
            isOn: b3.HeadlightsSwitchIn
            imageSource: "../Images/Headlights.png"
        }

        Item { Layout.fillWidth: true }
    }
}
