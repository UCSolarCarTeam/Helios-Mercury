import QtQuick

Rectangle {
    id: pRNDL
    width: 246
    height: 69
    color: "transparent"

    Item {
        id: gear_shift_line
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 8
        anchors.leftMargin: 84
        anchors.bottomMargin: 69
        anchors.topMargin: 0
        Rectangle {
            id: line_13
            color: "#ff0303"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            rotation: 0.064
            anchors.rightMargin: -84
            anchors.leftMargin: 197
            anchors.bottomMargin: -10
            anchors.topMargin: 5
        }

        Rectangle {
            id: line_14
            color: "#000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            rotation: 0.064
            anchors.rightMargin: -43
            anchors.leftMargin: 84
            anchors.bottomMargin: -4
            anchors.topMargin: 2
        }
    }

    Image {
        id: r_N_D
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/r_N_D.png"
        anchors.rightMargin: 23
        anchors.leftMargin: 104
        anchors.bottomMargin: 16
        anchors.topMargin: 16
    }

    Parking_brake {
        id: parking_brake
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 178
        anchors.bottomMargin: 10
        anchors.topMargin: 11
    }
}

/*##^##
Designer {
    D{i:0;uuid:"f8f20b76-7440-59e8-bbd0-bfdb48d6cd22"}D{i:2;uuid:"2fd70655-caba-545d-8cc6-6e39018595ac"}
D{i:3;uuid:"49f397a8-b5d9-59fb-aa33-ce99e1550aad"}D{i:1;uuid:"bbca5f63-c73b-5711-bc04-2299b86380b8"}
D{i:4;uuid:"b70d2e99-b23c-5604-9fe6-bbe23f535f29"}D{i:5;uuid:"b523a4e3-52ac-55dd-aefe-fdac53ca1250"}
}
##^##*/

