import QtQuick

Rectangle {
    id: parking_brake
    width: 68
    height: 48
    color: "transparent"

    Image {
        id: vector
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/vector.png"
        anchors.rightMargin: 54
        anchors.bottomMargin: 0
        anchors.topMargin: 0
    }

    Image {
        id: vector1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/vector1.png"
        anchors.leftMargin: 54
        anchors.bottomMargin: 0
        anchors.topMargin: 0
    }

    Image {
        id: vector2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/vector2.png"
        anchors.rightMargin: 24
        anchors.leftMargin: 29
        anchors.bottomMargin: 10
        anchors.topMargin: 12
    }

    Image {
        id: vector3
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/vector3.png"
        anchors.rightMargin: 11
        anchors.leftMargin: 13
        anchors.bottomMargin: 2
        anchors.topMargin: 2
    }
}

/*##^##
Designer {
    D{i:0;uuid:"d970b66c-a8a4-586b-904e-1fb871dc74fc"}D{i:1;uuid:"973fd6df-ef58-5c76-baea-acae92de4834"}
D{i:2;uuid:"b00827df-a5f1-5cd0-8d26-026def040b14"}D{i:3;uuid:"25a57dd7-315a-5ef1-9001-b014b3749cc3"}
D{i:4;uuid:"6f13f1cf-b375-5029-8190-5804c404b456"}
}
##^##*/

