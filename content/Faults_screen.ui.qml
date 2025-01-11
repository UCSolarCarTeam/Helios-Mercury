import QtQuick

Rectangle {
    id: faults_screen
    width: 715
    height: 521
    color: "transparent"
    property alias moderate_fault_textText: moderate_fault_text.text
    property alias severe_fault_text1Text: severe_fault_text1.text
    property alias severe_fault_textText: severe_fault_text.text
    property alias moderate_fault_text1Text: moderate_fault_text1.text
    property alias mild_fault_textText: mild_fault_text.text
    property alias mild_fault_text1Text: mild_fault_text1.text

    Item {
        id: severe_fault
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 434
        Image {
            id: severe_fault_rectangle
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/severe_fault_rectangle.png"
        }

        Text {
            id: severe_fault_text
            color: "#000000"
            text: qsTr("Motor Fault: Left Motor is non-functional")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            anchors.rightMargin: 25
            font.weight: Font.Normal
            anchors.leftMargin: 18
            font.family: "Jost"
            anchors.bottomMargin: 15
            anchors.topMargin: 14
        }
    }

    Item {
        id: severe_fault1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 434
        Image {
            id: severe_fault_rectangle1
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/severe_fault_rectangle1.png"
        }

        Text {
            id: severe_fault_text1
            color: "#000000"
            text: qsTr("Motor Fault: Left Motor is non-functional")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            anchors.rightMargin: 13
            font.weight: Font.Normal
            anchors.leftMargin: 30
            font.family: "Jost"
            anchors.bottomMargin: 15
            anchors.topMargin: 14
        }
    }

    Item {
        id: moderate_fault
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 347
        anchors.topMargin: 87
        Image {
            id: moderate_fault_rectangle
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/moderate_fault_rectangle.png"
        }

        Text {
            id: moderate_fault_text
            color: "#000000"
            text: qsTr("Sensor Fault: Side Sensor malfunction")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            anchors.rightMargin: 28
            font.weight: Font.Normal
            anchors.leftMargin: 46
            font.family: "Jost"
            anchors.bottomMargin: 15
            anchors.topMargin: 14
        }
    }

    Item {
        id: moderate_fault1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 173
        anchors.topMargin: 261
        Image {
            id: moderate_fault_rectangle1
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/moderate_fault_rectangle1.png"
        }

        Text {
            id: moderate_fault_text1
            color: "#000000"
            text: qsTr("Sensor Fault: Side Sensor malfunction")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            anchors.rightMargin: 36
            font.weight: Font.Normal
            anchors.leftMargin: 38
            font.family: "Jost"
            anchors.bottomMargin: 17
            anchors.topMargin: 12
        }
    }

    Item {
        id: mild_fault
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 260
        anchors.topMargin: 174
        Image {
            id: mild_fault_rectangle
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/mild_fault_rectangle.png"
        }

        Text {
            id: mild_fault_text
            color: "#000000"
            text: qsTr("Oil Fault: Change oil ")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            anchors.rightMargin: 185
            font.weight: Font.Normal
            anchors.leftMargin: 178
            font.family: "Jost"
            anchors.bottomMargin: 17
            anchors.topMargin: 12
        }
    }

    Item {
        id: mild_fault1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 87
        anchors.topMargin: 347
        Image {
            id: mild_fault_rectangle1
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/mild_fault_rectangle1.png"
        }

        Text {
            id: mild_fault_text1
            color: "#000000"
            text: qsTr("Oil Fault: Change oil ")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            anchors.rightMargin: 185
            font.weight: Font.Normal
            anchors.leftMargin: 178
            font.family: "Jost"
            anchors.bottomMargin: 16
            anchors.topMargin: 13
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"119ac701-7c0a-5b67-a0aa-b4e8f459c5b6"}D{i:2;uuid:"6f046140-835e-5a00-98df-0d3452928121"}
D{i:3;uuid:"04f106a9-366c-5115-aeeb-ed0b6cd92f97"}D{i:1;uuid:"fb867ee5-9e47-5e4b-acca-f53d38524d3f"}
D{i:5;uuid:"c5911e48-49c4-5fc2-94bf-af3498631766"}D{i:6;uuid:"810a9287-ef7b-52c0-a1b5-f0fe235e2f8c"}
D{i:4;uuid:"6fda74f9-b0a0-52b1-9327-5f43fed3fa2a"}D{i:8;uuid:"68067935-1cae-5f6d-b3d0-5361ed1ccf84"}
D{i:9;uuid:"6815a65a-7af6-5d7d-a28e-59ad28fe1bb7"}D{i:7;uuid:"85c80d85-b90e-5b64-81e2-87e917c6129a"}
D{i:11;uuid:"83b89f58-69b0-5c31-8b8e-fcbd0d445a62"}D{i:12;uuid:"d6bb9a71-377d-5320-a42b-b7f2bc352302"}
D{i:10;uuid:"b903f902-8199-503c-bd2c-c2ff8b4c186c"}D{i:14;uuid:"571fedb7-a07b-5d9b-b49d-56fb01df8539"}
D{i:15;uuid:"f40ca7e0-8efe-5c21-a981-8e9a95ae7e3f"}D{i:13;uuid:"46649c4b-94b0-5e77-8b23-32f49f0c42de"}
D{i:17;uuid:"c6d08b77-0c8f-5d3a-8e72-57cfc2b0ca5c"}D{i:18;uuid:"94964223-e343-5c9a-83ae-9d08c3971877"}
D{i:16;uuid:"5857006d-53d8-5401-9f66-237b905391ce"}
}
##^##*/

