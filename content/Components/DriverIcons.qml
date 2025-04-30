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

    // // Horn Icon
    // Image {
    //     id: hornIcon
    //     source: "../Images/Horn.png"
    //     x: 65
    //     y: 0
    //     width: 70
    //     height: 70
    //     visible: hornActive // Change based on logic
    // }

    // // Hazard Icon
    // Image {
    //     id: hazardIcon
    //     source: "../Images/Hazard.png"
    //     x: 65
    //     y: 0
    //     width: 70
    //     height: 70
    //     visible: hazardActive // Change based on logic
    // }

    // Left Headlight Icon (reflected if needed)
    Image {
        id: headlightLeftIcon
        source: "../Images/Headlights.png"
        x: 116
        y: 156
        width: 75
        height: 49
        transform: Scale { xScale: -1; origin.x: width / 2 } // reflect if needed
        visible: headlightsActive // Change based on logic
    }

    // Right Headlight Icon
    Image {
        id: headlightRightIcon
        source: "../Images/Headlights.png"
        x: 116
        y: 156
        width: 75
        height: 49
        visible: headlightsActive // Change based on logic
    }

    // Left Arrow Icon
    Image {
        id: arrowLeftIcon
        source: "../Images/Arrow.png"
        x: 0
        y: 106
        width: 75
        height: 50
        transform: Scale { xScale: -1; origin.x: width / 2 } // mirror horizontally
        visible: leftSignalActive // Change based on logic
    }

    // Right Arrow Icon
    Image {
        id: arrowRightIcon
        source: "../Images/Arrow.png"
        x: width - 75
        y: 106
        width: 75
        height: 50
        visible: rightSignalActive // Change based on logic
    }

    // Parking Brake Icon
    Image {
        id: parkingBrakeIcon
        source: "../Images/ParkingBrake.png"
        x: 119
        y: 241
        width: 49
        height: 68
        visible: parkingBrakeActive // Change based on logic
    }
}
