import QtQuick

Rectangle {
    id: faultsScreen
    width: 715
    height: 521
    color: "transparent"
    property alias severeFaultTextText: severeFaultText.text
    property alias mildFaultTextText: mildFaultText.text
    property alias severeFaultText1Text: severeFaultText1.text
    property alias moderateFaultText1Text: moderateFaultText1.text
    property alias moderateFaultTextText: moderateFaultText.text
    property alias mildFaultText1Text: mildFaultText1.text

    Item {
        id: severeFault
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 434
        Image {
            id: severeFaultBox
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/severeFaultBox.png"
        }

        Text {
            id: severeFaultText
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
        id: severeFault1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 434
        Image {
            id: severeFaultBox1
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/severeFaultBox1.png"
        }

        Text {
            id: severeFaultText1
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
        id: moderateFault
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 347
        anchors.topMargin: 87
        Image {
            id: moderateFaultBox
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/moderateFaultBox.png"
        }

        Text {
            id: moderateFaultText
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
        id: moderateFault1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 173
        anchors.topMargin: 261
        Image {
            id: moderateFaultBox1
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/moderateFaultBox1.png"
        }

        Text {
            id: moderateFaultText1
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
        id: mildFault
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 260
        anchors.topMargin: 174
        Image {
            id: mildFaultBox
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/mildFaultBox.png"
        }

        Text {
            id: mildFaultText
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

    Item {
        id: mildFault1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 87
        anchors.topMargin: 347
        Image {
            id: mildFaultBox1
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/mildFaultBox1.png"
        }

        Text {
            id: mildFaultText1
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
    D{i:0;uuid:"61a90ed5-4107-5fe6-863f-c1dbf2ceb667"}D{i:2;uuid:"138b0be7-b2d9-5954-8c79-1d5a3bcb727d"}
D{i:3;uuid:"e693f4cf-e0e7-581f-a9b5-5a850c3a626b"}D{i:1;uuid:"c35390fc-e653-516e-8f19-ce8e32ec8bb5"}
D{i:5;uuid:"afd39bc1-e6af-529e-86ce-b996484b5761"}D{i:6;uuid:"6d14e078-f5f5-594f-bf11-608241c9a2e2"}
D{i:4;uuid:"dc1481ff-2fde-5850-ab39-3dffa0df912f"}D{i:8;uuid:"cf7ad76f-00b2-5d3e-a93a-ee20a01c6e1d"}
D{i:9;uuid:"29cad101-7096-5baf-a8bb-37a9c373fdba"}D{i:7;uuid:"91fbd119-25db-5148-aa10-532c0c0ef75a"}
D{i:11;uuid:"ad4183de-ee76-57e6-a484-39f57d99bcd6"}D{i:12;uuid:"2c9cd065-3241-59d8-bbc4-08110ed4dcfe"}
D{i:10;uuid:"fb1eabe7-3bb7-5bc4-9ad1-7f44b84ae82e"}D{i:14;uuid:"d344256d-39ef-5878-bb66-7e1156e364e4"}
D{i:15;uuid:"d96e04f6-4e42-5d35-b4bb-bf3bffbf273b"}D{i:13;uuid:"90e7f287-3c86-5fc9-8c9c-aad4057871b4"}
D{i:17;uuid:"cb2e4e6a-b8d0-5fec-acfb-c0a5488c08ba"}D{i:18;uuid:"dbd86988-0dc9-5eb5-b6b2-4da3f86b9d68"}
D{i:16;uuid:"5e60aafe-bd82-50ec-8a54-3f2d135cea58"}
}
##^##*/

