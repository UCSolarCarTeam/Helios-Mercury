import QtQuick

Rectangle {
    id: pRNDL
    width: 246
    height: 69
    color: "transparent"

    Item {
        id: gearShiftLine
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 8
        anchors.leftMargin: 84
        anchors.bottomMargin: 69
        anchors.topMargin: 0
        Rectangle {
            id: gearShiftLine2
            color: "#ff0303"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            rotation: 0.064
            anchors.rightMargin: 8
            anchors.leftMargin: 105
            anchors.bottomMargin: -5
            anchors.topMargin: 0
        }

        Rectangle {
            id: gearShiftLine1
            color: "#000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            rotation: 0.064
            anchors.rightMargin: 49
            anchors.leftMargin: -8
            anchors.bottomMargin: -2
            anchors.topMargin: 0
        }
    }

    Image {
        id: rND
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/rND.png"
        anchors.rightMargin: 23
        anchors.leftMargin: 104
        anchors.bottomMargin: 16
        anchors.topMargin: 16
    }

    Rectangle {
        id: parkingBrake
        color: "transparent"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 178
        anchors.bottomMargin: 10
        anchors.topMargin: 11
        Image {
            id: parkingBrakeVector4
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/parkingBrakeVector4.png"
            anchors.rightMargin: 54
            anchors.bottomMargin: 0
            anchors.topMargin: 0
        }

        Image {
            id: parkingBrakeVector3
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/parkingBrakeVector3.png"
            anchors.leftMargin: 54
            anchors.bottomMargin: 0
            anchors.topMargin: 0
        }

        Image {
            id: parkingBrakeVector2
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/parkingBrakeVector2.png"
            anchors.rightMargin: 24
            anchors.leftMargin: 29
            anchors.bottomMargin: 10
            anchors.topMargin: 12
        }

        Image {
            id: parkingBrakeVector1
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/parkingBrakeVector1.png"
            anchors.rightMargin: 11
            anchors.leftMargin: 13
            anchors.bottomMargin: 2
            anchors.topMargin: 2
        }
    }
}
