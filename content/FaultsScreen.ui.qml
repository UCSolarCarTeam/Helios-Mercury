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
