import QtQuick 6.2
import QtQuick.Layouts 
import Mercury

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
            iconMaskColor: b3.HandbrakeSwitchDigital ? Config.valueHigh : Config.btnDisabled
            imageSource: "../Images/ParkingBrake.png"
            Layout.alignment: Qt.AlignCenter
        }

        DashIcon {
            id: drlIcon
            iconMaskColor: b3.DaytimeRunningLightSignalStatus ? Config.primary : Config.btnDisabled
            imageSource: "../Images/DaytimeRunningLights.png"
            Layout.alignment: Qt.AlignCenter
        }

        DashIcon {
            id: headlightsIcon
            iconMaskColor: b3.HeadlightsSwitchInput ? Config.primary : Config.btnDisabled
            imageSource: "../Images/Headlights.png"
            Layout.alignment: Qt.AlignCenter
        }
    }
}
