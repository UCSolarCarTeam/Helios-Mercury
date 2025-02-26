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

        DashIcon {
            id: parkingBrakeIcon
            isOn: b3.HandbrakeSwitch
            isHighContrast: true
            imageSource: "../Images/ParkingBrake.png"
            Layout.alignment: Qt.AlignCenter
        }

        DashIcon {
            id: drlIcon
            isOn: b3.DaytimeRunningLightSignalOut
            imageSource: "../Images/DaytimeRunningLights.png"
            Layout.alignment: Qt.AlignCenter
        }

        DashIcon {
            id: headlightsIcon
            isOn: b3.HeadlightsSwitchIn
            imageSource: "../Images/Headlights.png"
            Layout.alignment: Qt.AlignCenter
        }
    }
}
