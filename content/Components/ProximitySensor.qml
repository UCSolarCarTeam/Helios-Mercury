import Mercury
import QtQuick 2.15
import QtQuick.Effects

Item {
    id: proximityIcon
    width: 450
    height: 850

    property real distRearLeft:  Proximity.Sensor1
    property real distRearRight: Proximity.Sensor2
    property real distLeft:   Proximity.Sensor3
    property real distRight:  Proximity.Sensor4

    property real threshold1: 3
    property real threshold2: 2
    property real threshold3: 1


    Image {
        id: proximityImage
        source:  "../Images/SensorCar.png"
        anchors.centerIn: parent
        visible: (distRearLeft < threshold1 ||
                  distRearRight < threshold1 ||
                  distLeft < threshold1 ||
                  distRight < threshold1)
    }

    Image {
        id: rearTopLeft
        source: "../Images/SensorRearTop.png"
        anchors.top: proximityImage.bottom
        anchors.right: proximityImage.horizontalCenter
        visible: distRearLeft < threshold1
    }

    Image {
        id: rearMiddleLeft
        source: "../Images/SensorRearMiddle.png"
        anchors.top: rearTopLeft.bottom
        anchors.right: proximityImage.horizontalCenter
        visible: distRearLeft < threshold2
    }

    Image {
        id: rearBottomLeft
        source: "../Images/SensorRearBottom.png"
        anchors.top: rearMiddleLeft.bottom
        anchors.right: proximityImage.horizontalCenter
        visible: distRearLeft < threshold3
    }


    Image {
        id: rearTopRight
        source: "../Images/SensorRearTop.png"
        anchors.top: proximityImage.bottom
        anchors.left: proximityImage.horizontalCenter
        visible: distRearRight < threshold1
    }

    Image {
        id: rearMiddleRight
        source: "../Images/SensorRearMiddle.png"
        anchors.top: rearTopRight.bottom
        anchors.left: proximityImage.horizontalCenter
        visible: distRearRight < threshold2
    }

    Image {
        id: rearBottomRight
        source: "../Images/SensorRearBottom.png"
        anchors.top: rearMiddleRight.bottom
        anchors.left: proximityImage.horizontalCenter
        visible: distRearRight < threshold3
    }

    Image {
        id: rightTop
        source: "../Images/SensorRightTop.png"
        anchors.verticalCenter: rearTopRight.verticalCenter
        anchors.left: proximityImage.right
        anchors.verticalCenterOffset: -8
        anchors.leftMargin: -17
        visible: distRight < threshold1
    }

    Image {
        id: rightMiddle
        source: "../Images/SensorRightMiddle.png"
        anchors.top: rightTop.bottom
        anchors.topMargin: -34
        anchors.left: proximityImage.right
        anchors.leftMargin: -5
        visible: distRight < threshold2
    }

    Image {
        id: rightBottom
        source: "../Images/SensorRightBottom.png"
        anchors.top: rightMiddle.bottom
        anchors.topMargin: -34
        anchors.left: proximityImage.right
        anchors.leftMargin: 1
        visible: distRight < threshold3
    }

    Image {
        id: leftTop
        source: "../Images/SensorLeftTop.png"
        anchors.verticalCenter: rearTopLeft.verticalCenter
        anchors.right: proximityImage.left
        anchors.verticalCenterOffset: -10
        anchors.rightMargin: -16
        visible: distLeft < threshold1
    }

    Image {
        id: leftMiddle
        source: "../Images/SensorLeftMiddle.png"
        anchors.top: leftTop.bottom
        anchors.topMargin: -33
        anchors.right: proximityImage.left
        anchors.rightMargin: -4
        visible: distLeft < threshold2
    }

    Image {
        id: leftBottom
        source: "../Images/SensorLeftBottom.png"
        anchors.top: leftMiddle.bottom
        anchors.topMargin: -33
        anchors.right: proximityImage.left
        anchors.rightMargin: 2
        visible: distLeft < threshold3
    }
}
