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
    D{i:0;uuid:"d211db1b-a61b-5aff-b690-11dd207b7577"}D{i:2;uuid:"37f10086-261c-5601-9cca-54f06b8650fd"}
D{i:3;uuid:"a9a66a29-b881-5cdc-bd4a-49b514763640"}D{i:1;uuid:"264888f8-8a3c-5859-8660-1618272ed042"}
D{i:5;uuid:"62cdc833-bb91-5f83-8bd9-b9f94b1a3e80"}D{i:6;uuid:"2341e727-d5b9-552b-885d-5956ac8d319d"}
D{i:4;uuid:"7b0f8d1f-38fe-549a-a075-1fc54af7808d"}D{i:8;uuid:"94891ad8-ad48-5220-a8d6-e941be525157"}
D{i:9;uuid:"f00738b0-9ab0-5f99-afe1-d003bee75db6"}D{i:7;uuid:"fe657930-06d1-5756-9d92-55650241c4cb"}
D{i:11;uuid:"42d0c1e0-880e-5a95-9d30-b6696e213ad5"}D{i:12;uuid:"e848f447-44e1-531d-b6dd-b9c4e9ac5004"}
D{i:10;uuid:"c3af256f-02c9-5577-a119-c555a63fe1a8"}D{i:14;uuid:"04fc9a41-756a-5bfa-9cd2-bfe397749b9c"}
D{i:15;uuid:"af5f56ab-4043-5785-b383-38160312b201"}D{i:13;uuid:"e7887cec-0355-5902-8158-21befcd140a9"}
D{i:17;uuid:"6e6b0838-0254-5b0d-af21-4c458bdd8170"}D{i:18;uuid:"b04929d4-f620-50f1-87ed-31fe7758dfed"}
D{i:16;uuid:"9bfd88c2-14ed-52fb-b502-541a95b1be77"}
}
##^##*/

