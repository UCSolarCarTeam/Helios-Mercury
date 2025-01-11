import QtQuick

Rectangle {
    id: frame_1
    width: 700
    height: 702
    color: "transparent"
    property alias element1Text: element1.text
    property alias elementText: element.text
    property alias rpmText: rpm.text
    property alias element5Text: element5.text
    property alias element4Text: element4.text
    property alias element3Text: element3.text
    property alias element2Text: element2.text
    property alias kmhText: kmh.text

    Image {
        id: ellipse_26
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_26.png"
        anchors.leftMargin: 350
        anchors.topMargin: 0
    }

    Image {
        id: ellipse_41
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_41.png"
        anchors.leftMargin: 349
        anchors.topMargin: 585
    }

    Image {
        id: ellipse_27
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_27.png"
        anchors.leftMargin: 200
        anchors.topMargin: 200
    }

    Item {
        id: group_16
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 238
        anchors.leftMargin: 387
        anchors.bottomMargin: 271
        anchors.topMargin: 287
        Text {
            id: element
            width: 146
            height: 185
            visible: false
            color: "#151515"
            text: qsTr("48")
            anchors.left: parent.left
            anchors.top: parent.top
            font.pixelSize: 90
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            anchors.leftMargin: -152
            font.family: "Jost"
            anchors.topMargin: -86
        }

        Text {
            id: element1
            width: 269
            height: 185
            visible: false
            color: "#151515"
            text: qsTr("7000")
            anchors.left: parent.left
            anchors.top: parent.top
            font.pixelSize: 60
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            anchors.leftMargin: -219
            font.family: "Jost"
            anchors.topMargin: 19
        }

        Text {
            id: kmh
            width: 76
            height: 46
            color: "#151515"
            text: qsTr("kmh")
            anchors.left: parent.left
            anchors.top: parent.top
            font.pixelSize: 32
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Jost"
        }

        Text {
            id: rpm
            width: 57
            height: 46
            color: "#151515"
            text: qsTr("rpm")
            anchors.left: parent.left
            anchors.top: parent.top
            font.pixelSize: 32
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            anchors.leftMargin: 10
            font.family: "Jost"
            anchors.topMargin: 98
        }
    }

    Image {
        id: ellipse_28
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_28.png"
        anchors.leftMargin: 350
        anchors.topMargin: 82
    }

    Text {
        id: element2
        width: 39
        height: 29
        color: "#a8a8a8"
        text: qsTr("200")
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        anchors.leftMargin: 335
        font.family: "Jost"
        anchors.topMargin: 96
    }

    Text {
        id: element3
        width: 14
        height: 29
        color: "#a8a8a8"
        text: qsTr("0")
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        anchors.leftMargin: 347
        font.family: "Jost"
        anchors.topMargin: 576
    }

    Image {
        id: ellipse_32
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_32.png"
        anchors.leftMargin: 611
        anchors.topMargin: 300
    }

    Image {
        id: ellipse_36
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_36.png"
        anchors.leftMargin: 610
        anchors.topMargin: 401
    }

    Image {
        id: ellipse_37
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_37.png"
        anchors.leftMargin: 519
        anchors.topMargin: 548
    }

    Image {
        id: ellipse_38
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_38.png"
        anchors.leftMargin: 442
        anchors.topMargin: 593
    }

    Image {
        id: ellipse_39
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_39.png"
        anchors.leftMargin: 442
        anchors.topMargin: 98
    }

    Image {
        id: ellipse_40
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_40.png"
        anchors.leftMargin: 519
        anchors.topMargin: 141
    }

    Image {
        id: ellipse_33
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_33.png"
        anchors.leftMargin: 576
        anchors.topMargin: 481
    }

    Image {
        id: ellipse_34
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_34.png"
        anchors.leftMargin: 576
        anchors.topMargin: 212
    }

    Image {
        id: ellipse_30
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_30.png"
        anchors.leftMargin: 350
        anchors.topMargin: 609
    }

    Rectangle {
        id: line_551
        width: 205
        height: 8
        color: "#a2180f"
        anchors.left: parent.left
        anchors.top: parent.top
        rotation: 44.286
        anchors.leftMargin: 430
        anchors.topMargin: 515
    }

    Text {
        id: element4
        width: 94
        height: 116
        color: "#000000"
        text: qsTr("42")
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 80
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        anchors.leftMargin: 267
        font.family: "Jost"
        anchors.topMargin: 247
    }

    Text {
        id: element5
        width: 141
        height: 87
        color: "#000000"
        text: qsTr("7000")
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 60
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        anchors.leftMargin: 245
        font.family: "Jost"
        anchors.topMargin: 362
    }
}

/*##^##
Designer {
    D{i:0;uuid:"15af348c-9f9e-506d-90b1-9ba145240fa2"}D{i:1;uuid:"353d9f2b-6d30-5727-8085-9cc4fd06f5cf"}
D{i:2;uuid:"8828b624-5d85-57d5-9d8b-ab980d99ac60"}D{i:3;uuid:"2baef5a7-1dd9-5d4e-b6a6-50dc9fc8e11f"}
D{i:5;uuid:"d3302128-8271-5326-8d11-686ea0d02933"}D{i:6;uuid:"4ada2399-ebcb-535f-b8ec-70ab70db848a"}
D{i:7;uuid:"4e453b57-3bf9-50f5-a8a6-010d4f32d8e9"}D{i:8;uuid:"54e5d559-24ff-5baf-ab73-0244d2f7c9dd"}
D{i:4;uuid:"e5d41ed0-d4d2-5fa3-8c14-aaac5378cff4"}D{i:9;uuid:"ea0adb92-e98d-5ac9-a675-ad4fe10de799"}
D{i:10;uuid:"2670a976-8f99-5055-962d-19caf9bec306"}D{i:11;uuid:"8e78650b-0357-51ce-b056-fde7396cc5f6"}
D{i:12;uuid:"45443533-74e6-51aa-91e5-372bb850b607"}D{i:13;uuid:"b367df7e-5301-50d0-a054-e2d1647483a8"}
D{i:14;uuid:"0f4f7426-3dbf-577b-b61c-619035f7e8c4"}D{i:15;uuid:"db6762f2-9a4a-51b2-bc63-47f52b1f7001"}
D{i:16;uuid:"38acf042-056e-5f67-8263-1a563e2b1d80"}D{i:17;uuid:"0a41b69c-d676-5368-a6c7-5e3488ce4d20"}
D{i:18;uuid:"4c6a2d45-0e68-5c3e-be07-b10094f1474c"}D{i:19;uuid:"4db98c34-bc96-5d3c-8de9-d195b1a354e7"}
D{i:20;uuid:"9a261d12-89fb-5c98-91c4-a5fa81f0e23f"}D{i:21;uuid:"5c6ffa73-741d-5e41-87fb-fa305afd8fa9"}
D{i:22;uuid:"8727c103-0645-50c4-8251-ac567461eac1"}D{i:23;uuid:"5cd64396-d51a-5e56-aa36-d607f612f5c8"}
}
##^##*/

