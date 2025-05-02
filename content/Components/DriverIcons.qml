import QtQuick 2.15
import QtQuick.Controls 2.15
import Mercury
import QtQuick.Effects

Item {
    id: driverIcons
    width: 307
    height: 288

    // Input properties
    property bool hornActive: false
    property bool hazardActive: false
    property bool headlightsActive: false
    property bool leftSignalActive: false
    property bool rightSignalActive: false
    property bool parkingBrakeActive: false

    // Horn Icon
    DashIcon {
        imageSource: "../Images/CarHorn.png"
        isOn: true
        iconMaskColor: hornActive ? "orange" : "white"
        x: parent.width * (3/4) - 45
        y: 0
        width: 70
        height: 70
    }

    // Hazard Icon
    DashIcon {
        imageSource: "../Images/HazardIcon.png"
        isOn: true
        iconMaskColor: hazardActive ? "red" : "white"
        x: parent.width / 4
        y: 15
        width: 40
        height: 40
    }

    // Left Headlight Icon
    DashIcon {
        imageSource: "../Images/Headlights.png"
        isOn: true
        iconMaskColor: headlightsActive ? "green" : "white"
        x: parent.width/2
        y: 156
        width: 65
        height: 40
        transform: Scale { xScale: -1 }
    }

    // Mirrored Headlight Icon
    DashIcon {
        imageSource: "../Images/Headlights.png"
        isOn: true
        iconMaskColor: headlightsActive ? "green" : "white"
        x: parent.width/2
        y: 156
        width: 65
        height: 40
    }

    // Left Arrow Icon
    DashIcon {
        imageSource: "../Images/Arrow.png"
        isOn: true
        iconMaskColor: leftSignalActive ? "green" : "white"
        x: 75
        y: 85
        width: 75
        height: 50
        transform: Scale { xScale: -1 }
    }

    // Right Arrow Icon
    DashIcon {
        imageSource: "../Images/Arrow.png"
        isOn: true
        iconMaskColor: rightSignalActive ? "green" : "white"
        x: parent.width - 75
        y: 85
        width: 75
        height: 50
    }

    // Parking Brake Icon
    DashIcon {
        imageSource: "../Images/ParkingBrake.png"
        isOn: true
        iconMaskColor: parkingBrakeActive ? "red" : "white"
        x: parent.width/2 - 25
        y: parent.height - 60
        width: 50
        height: 50
    }
}
