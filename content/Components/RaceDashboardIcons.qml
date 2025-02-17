import QtQuick
import QtQuick.Controls

Item {
    id: raceDashboardIcons
    width: 425
    height: 35

    DashIcon {
        id: hornMuteIcon
        imageSource: "../Images/HornMutedIcon.png"
    }

    DashIcon {
        id: parkingBrakeIcon
        x: 162
        y: 3
        height: 27
        width: 37
        imageSource: "../Images/ParkingBrake.png"
    }

    DashIcon {
        id: headlightsIcon
        x: 385
        y: 0
        isOn: b3.HeadlightsSwitchIn
        imageSource: "../Images/Headlights.png"
    }

    DashIcon {
        id: drlIcon
        x: 260
        y: 0
        isOn: b3.DaytimeRunningLightSignalOut
        imageSource: "../Images/DaytimeRunningLights.png"
    }

}
