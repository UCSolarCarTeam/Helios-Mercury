import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia

Item {
    id: raceDashboardIcons
    width: 425
    height: 35

    RowLayout {
        id: iconRow
        anchors.fill: parent
        spacing: 20

        Item {
            Layout.fillWidth: true
        }

        DashIcon {
            id: parkingBrakeIcon
            isOn: b3.HandbrakeSwitch
            isHighContrast: true
            imageSource: "../Images/ParkingBrake.png"
        }

        Item {
            Layout.fillWidth: true
        }

        DashIcon {
            id: drlIcon
            isOn: b3.DaytimeRunningLightSignalOut
            imageSource: "../Images/DaytimeRunningLights.png"
        }

        Item {
            Layout.fillWidth: true
        }

        DashIcon {
            id: headlightsIcon
            isOn: b3.HeadlightsSwitchIn
            imageSource: "../Images/Headlights.png"
        }
    }
}
