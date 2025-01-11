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

/*##^##
Designer {
    D{i:0;uuid:"46a37ea9-8259-5b85-9070-fb8dae0b98b5"}D{i:2;uuid:"a7aa72b4-1efa-53c5-afd2-70c8175054c7"}
D{i:3;uuid:"2c41423c-1ba6-5108-bae6-3c9dff12cbfb"}D{i:1;uuid:"f256f06b-431f-5dde-bf9b-ff0d42915cef"}
D{i:4;uuid:"25488741-c2b0-5ef4-a2c3-35d4c41df436"}D{i:6;uuid:"20aeb1c6-cdf3-5230-a2cd-93fd43b89880"}
D{i:7;uuid:"acfc995a-7a08-5052-9752-3cf8d32bbe63"}D{i:8;uuid:"22b403ff-4e92-5b0a-b879-44cfa9919c7e"}
D{i:9;uuid:"2bc5da37-6a33-5c84-a63e-079bf31f361c"}D{i:5;uuid:"a3918465-5f57-5fd8-97e4-cdecdd6c3eba"}
}
##^##*/

