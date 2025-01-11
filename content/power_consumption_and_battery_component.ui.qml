import QtQuick

Rectangle {
    id: frame_1
    width: 384
    height: 384
    color: "transparent"
    property alias element1Text: element1.text
    property alias bATTERYText: bATTERY.text
    property alias elementText: element.text
    property alias nET_POWER_CONSUMPTIONText: nET_POWER_CONSUMPTION.text
    property alias element2Text: element2.text
    property alias vText: v.text

    Image {
        id: ellipse_41
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_41.png"
        anchors.leftMargin: 164
        anchors.topMargin: 376
    }

    Image {
        id: ellipse_44
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_44.png"
        anchors.leftMargin: 59
        anchors.topMargin: 327
    }

    Image {
        id: ellipse_48
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_48.png"
        anchors.leftMargin: 0
        anchors.topMargin: 199
    }

    Image {
        id: ellipse_49
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_49.png"
        anchors.leftMargin: 0
        anchors.topMargin: 169
    }

    Image {
        id: ellipse_50
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_50.png"
        anchors.leftMargin: 4
        anchors.topMargin: 228
    }

    Image {
        id: ellipse_55
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_55.png"
        anchors.leftMargin: 3
        anchors.topMargin: 138
    }

    Image {
        id: ellipse_51
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_51.png"
        anchors.leftMargin: 39
        anchors.topMargin: 305
    }

    Image {
        id: ellipse_56
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_56.png"
        anchors.leftMargin: 38
        anchors.topMargin: 65
    }

    Image {
        id: ellipse_53
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_53.png"
        anchors.leftMargin: 24
        anchors.topMargin: 282
    }

    Image {
        id: ellipse_57
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_57.png"
        anchors.leftMargin: 22
        anchors.topMargin: 85
    }

    Image {
        id: ellipse_52
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_52.png"
        anchors.leftMargin: 12
        anchors.topMargin: 256
    }

    Image {
        id: ellipse_58
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_58.png"
        anchors.leftMargin: 10
        anchors.topMargin: 111
    }

    Image {
        id: ellipse_45
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_45.png"
        anchors.leftMargin: 106
        anchors.topMargin: 359
    }

    Image {
        id: ellipse_46
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_46.png"
        anchors.leftMargin: 81
        anchors.topMargin: 345
    }

    Image {
        id: ellipse_47
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_47.png"
        anchors.leftMargin: 134
        anchors.topMargin: 370
    }

    Image {
        id: vector
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/vector.png"
        anchors.leftMargin: 200
        anchors.topMargin: 4
    }

    Image {
        id: ellipse_27
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_27.png"
        anchors.leftMargin: 109
        anchors.topMargin: 113
    }

    Item {
        id: group_16
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 155
        anchors.leftMargin: 152
        anchors.bottomMargin: 187
        anchors.topMargin: 129
        Text {
            id: v
            width: 78
            height: 43
            color: "#151515"
            text: qsTr("122 V")
            anchors.left: parent.left
            anchors.top: parent.top
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Jost"
        }

        Text {
            id: nET_POWER_CONSUMPTION
            width: 72
            height: 28
            color: "#151515"
            text: qsTr("NET POWER
CONSUMPTION")
            anchors.left: parent.left
            anchors.top: parent.top
            font.pixelSize: 10
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.WordWrap
            font.weight: Font.Normal
            anchors.leftMargin: 1
            font.family: "Jost"
            anchors.topMargin: 40
        }
    }

    Image {
        id: ellipse_28
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_28.png"
        anchors.leftMargin: 185
        anchors.topMargin: 49
    }

    Text {
        id: element
        width: 35
        height: 29
        color: "#000000"
        text: qsTr("130")
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Medium
        anchors.leftMargin: 196
        font.family: "Jost"
        anchors.topMargin: 36
    }

    Text {
        id: element1
        width: 36
        height: 29
        color: "#000000"
        text: qsTr("100")
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Medium
        anchors.leftMargin: 196
        font.family: "Jost"
        anchors.topMargin: 323
    }

    Image {
        id: ellipse_32
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_32.png"
        anchors.leftMargin: 43
        anchors.topMargin: 166
    }

    Image {
        id: ellipse_36
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_36.png"
        anchors.leftMargin: 43
        anchors.topMargin: 221
    }

    Image {
        id: ellipse_37
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_37.png"
        anchors.leftMargin: 93
        anchors.topMargin: 301
    }

    Image {
        id: ellipse_38
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_38.png"
        anchors.leftMargin: 135
        anchors.topMargin: 325
    }

    Image {
        id: ellipse_39
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_39.png"
        anchors.leftMargin: 135
        anchors.topMargin: 57
    }

    Image {
        id: ellipse_40
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_40.png"
        anchors.leftMargin: 93
        anchors.topMargin: 81
    }

    Image {
        id: ellipse_33
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_33.png"
        anchors.leftMargin: 62
        anchors.topMargin: 265
    }

    Image {
        id: ellipse_34
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_34.png"
        anchors.leftMargin: 62
        anchors.topMargin: 119
    }

    Image {
        id: ellipse_30
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_30.png"
        anchors.leftMargin: 185
        anchors.topMargin: 334
    }

    Image {
        id: ellipse_26
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/ellipse_26.png"
        anchors.leftMargin: 52
        anchors.topMargin: 0
    }

    Image {
        id: frame_1_merged
        x: 47
        y: 63
        source: "assets/frame_1_merged.png"
    }

    Item {
        id: group_17
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 143
        anchors.leftMargin: 133
        anchors.bottomMargin: 121
        anchors.topMargin: 180
        Text {
            id: element2
            color: "#151515"
            text: qsTr("68%")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            anchors.rightMargin: 5
            font.weight: Font.Normal
            anchors.leftMargin: 4
            font.family: "Jost"
            anchors.bottomMargin: 8
        }

        Text {
            id: bATTERY
            color: "#151515"
            text: qsTr("BATTERY")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            anchors.rightMargin: -1
            font.weight: Font.Normal
            font.family: "Jost"
            anchors.bottomMargin: 0
            anchors.topMargin: 52
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"cb420775-989a-54b4-8a35-bb2d8c51ad5f"}D{i:1;uuid:"88be3595-c14f-5b3b-86f1-125b693c8fbf"}
D{i:2;uuid:"d7638aae-7713-5093-ac61-75e001af166d"}D{i:3;uuid:"dde087c9-94f9-5e07-bd1b-2bbf35eb728f"}
D{i:4;uuid:"5a2d58f3-afea-52bd-95ed-cadc4d89a795"}D{i:5;uuid:"a1aee9f7-1673-5680-b841-61c4357da25c"}
D{i:6;uuid:"1045b719-082d-549c-be87-debd7f0b8fa4"}D{i:7;uuid:"73362142-5659-5c36-9092-5e5c66b9a20e"}
D{i:8;uuid:"622cb2c4-8f58-5251-b2e3-bdd8f0c230b6"}D{i:9;uuid:"afb5f511-e9b3-59b2-8ff3-b082b629dafc"}
D{i:10;uuid:"9db05805-6597-5f9c-9bc2-af8f2be7ffd7"}D{i:11;uuid:"98dad4d5-99fc-5ace-a0b2-0dea6d9a1b35"}
D{i:12;uuid:"2943b3b0-71e0-5492-8ef3-a2285040d193"}D{i:13;uuid:"51dcbcbc-48d9-590e-9029-d0fe44ebbc6e"}
D{i:14;uuid:"eb7232e9-07a8-5a1a-bf62-ea4c212f94bc"}D{i:15;uuid:"1e8ce557-0a6e-5b66-a461-8376535b7249"}
D{i:16;uuid:"456b58cd-ed42-5ab0-ab0b-7e43ff638adb"}D{i:17;uuid:"09a2fed0-3b16-59a9-bd83-8dc6d35bf062"}
D{i:19;uuid:"2ea33401-4e36-50cd-b1a7-0bfd19ac3b79"}D{i:20;uuid:"a627700f-ff74-5e64-89fc-24a531f76ff4"}
D{i:18;uuid:"d406f33b-4ae2-5a1a-9b4a-6a05694ceda5"}D{i:21;uuid:"64aff6db-a0f2-5f38-b914-3e714d113116"}
D{i:22;uuid:"4ff22554-5378-5888-93c6-950e415557f2"}D{i:23;uuid:"77952a16-722c-531f-8354-59fceb69f3be"}
D{i:24;uuid:"2890b8fb-1a76-51c0-8e2a-e6ca67951439"}D{i:25;uuid:"fd265aec-51b7-58d1-8840-ffb96a30db79"}
D{i:26;uuid:"586371c6-5198-521d-9904-b8f3a2d95023"}D{i:27;uuid:"e22040d0-f869-5bb7-9b6c-1d769e8dd311"}
D{i:28;uuid:"5eb4b908-e5c1-5277-b826-5bf7eb07a82f"}D{i:29;uuid:"a2002a75-1552-55f5-98b0-ee928684c4d5"}
D{i:30;uuid:"b3b19c7b-f104-571f-910a-409cdec2f402"}D{i:31;uuid:"5e17c01d-9901-580c-b0b7-6864b9695ebc"}
D{i:32;uuid:"fa9d8cf8-aeb5-52c2-8336-6ecdf2e9e6a8"}D{i:33;uuid:"a4fa3e5b-7c0f-583c-aa04-9e60602ebc75"}
D{i:34;uuid:"ba0b8c11-7f33-534e-9a79-db47f81299f0"}D{i:36;uuid:"b4edd721-b7ff-50ce-9632-59d2de247cfa"}
D{i:37;uuid:"4d98a342-038b-594a-88c6-cf04d0989460"}D{i:35;uuid:"9eb4a15a-b6bb-5619-b783-c9fff4dd7319"}
}
##^##*/

