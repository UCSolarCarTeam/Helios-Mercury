import QtQuick

Rectangle {
    id: frame_1
    width: 380
    height: 380
    color: "transparent"
    property alias element1Text: element1.text
    property alias elementText: element.text
    property alias motor_temperature_valueText: motor_temperature_value.text
    property alias motor_temperature_labelText: motor_temperature_label.text

    Item {
        id: motor_temperature_border
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        Image {
            id: ellipse_26
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_26.png"
            anchors.rightMargin: 190
            anchors.leftMargin: 48
            anchors.bottomMargin: 312
            anchors.topMargin: 0
        }

        Image {
            id: ellipse_41
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_41.png"
            anchors.rightMargin: 190
            anchors.leftMargin: 164
            anchors.bottomMargin: 0
            anchors.topMargin: 372
        }

        Image {
            id: ellipse_44
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_44.png"
            anchors.rightMargin: 300
            anchors.leftMargin: 59
            anchors.bottomMargin: 38
            anchors.topMargin: 323
        }

        Image {
            id: ellipse_48
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_48.png"
            anchors.rightMargin: 371
            anchors.leftMargin: 0
            anchors.bottomMargin: 159
            anchors.topMargin: 195
        }

        Image {
            id: ellipse_49
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_49.png"
            anchors.rightMargin: 372
            anchors.leftMargin: 0
            anchors.bottomMargin: 189
            anchors.topMargin: 165
        }

        Image {
            id: ellipse_50
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_50.png"
            anchors.rightMargin: 365
            anchors.leftMargin: 4
            anchors.bottomMargin: 130
            anchors.topMargin: 224
        }

        Image {
            id: ellipse_55
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_55.png"
            anchors.rightMargin: 366
            anchors.leftMargin: 3
            anchors.bottomMargin: 220
            anchors.topMargin: 134
        }

        Image {
            id: ellipse_51
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_51.png"
            anchors.rightMargin: 321
            anchors.leftMargin: 39
            anchors.bottomMargin: 57
            anchors.topMargin: 301
        }

        Image {
            id: ellipse_56
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_56.png"
            anchors.rightMargin: 325
            anchors.leftMargin: 38
            anchors.bottomMargin: 299
            anchors.topMargin: 61
        }

        Image {
            id: ellipse_53
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_53.png"
            anchors.rightMargin: 339
            anchors.leftMargin: 24
            anchors.bottomMargin: 78
            anchors.topMargin: 278
        }

        Image {
            id: ellipse_57
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_57.png"
            anchors.rightMargin: 341
            anchors.leftMargin: 22
            anchors.bottomMargin: 275
            anchors.topMargin: 81
        }

        Image {
            id: ellipse_52
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_52.png"
            anchors.rightMargin: 354
            anchors.leftMargin: 12
            anchors.bottomMargin: 103
            anchors.topMargin: 252
        }

        Image {
            id: ellipse_58
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_58.png"
            anchors.rightMargin: 356
            anchors.leftMargin: 10
            anchors.bottomMargin: 249
            anchors.topMargin: 107
        }

        Image {
            id: ellipse_45
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_45.png"
            anchors.rightMargin: 249
            anchors.leftMargin: 106
            anchors.bottomMargin: 11
            anchors.topMargin: 355
        }

        Image {
            id: ellipse_46
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_46.png"
            anchors.rightMargin: 276
            anchors.leftMargin: 81
            anchors.bottomMargin: 22
            anchors.topMargin: 341
        }

        Image {
            id: ellipse_47
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_47.png"
            anchors.rightMargin: 220
            anchors.leftMargin: 134
            anchors.bottomMargin: 3
            anchors.topMargin: 366
        }

        Image {
            id: ellipse_32
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_32.png"
            anchors.rightMargin: 332
            anchors.leftMargin: 43
            anchors.bottomMargin: 212
            anchors.topMargin: 162
        }

        Image {
            id: ellipse_36
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_36.png"
            anchors.rightMargin: 331
            anchors.leftMargin: 43
            anchors.bottomMargin: 157
            anchors.topMargin: 217
        }

        Image {
            id: ellipse_37
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_37.png"
            anchors.rightMargin: 282
            anchors.leftMargin: 93
            anchors.bottomMargin: 78
            anchors.topMargin: 297
        }

        Image {
            id: ellipse_38
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_38.png"
            anchors.rightMargin: 240
            anchors.leftMargin: 135
            anchors.bottomMargin: 53
            anchors.topMargin: 321
        }

        Image {
            id: ellipse_39
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_39.png"
            anchors.rightMargin: 240
            anchors.leftMargin: 135
            anchors.bottomMargin: 321
            anchors.topMargin: 53
        }

        Image {
            id: ellipse_40
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_40.png"
            anchors.rightMargin: 282
            anchors.leftMargin: 93
            anchors.bottomMargin: 298
            anchors.topMargin: 77
        }

        Image {
            id: ellipse_33
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_33.png"
            anchors.rightMargin: 313
            anchors.leftMargin: 62
            anchors.bottomMargin: 114
            anchors.topMargin: 261
        }

        Image {
            id: ellipse_34
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_34.png"
            anchors.rightMargin: 313
            anchors.leftMargin: 62
            anchors.bottomMargin: 260
            anchors.topMargin: 115
        }

        Image {
            id: ellipse_30
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "assets/ellipse_30.png"
            anchors.rightMargin: 190
            anchors.leftMargin: 185
            anchors.bottomMargin: 45
            anchors.topMargin: 330
        }
    }

    Image {
        id: vector
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/vector.png"
        anchors.rightMargin: 145
        anchors.leftMargin: 200
        anchors.bottomMargin: 339
    }

    Image {
        id: ellipse_27
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/ellipse_27.png"
        anchors.rightMargin: 109
        anchors.leftMargin: 109
        anchors.bottomMargin: 109
        anchors.topMargin: 109
    }

    Image {
        id: ellipse_28
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "assets/ellipse_28.png"
        anchors.rightMargin: 190
        anchors.leftMargin: 185
        anchors.bottomMargin: 330
        anchors.topMargin: 45
    }

    Text {
        id: element
        color: "#000000"
        text: qsTr("100")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        anchors.rightMargin: 133
        font.weight: Font.Medium
        anchors.leftMargin: 180
        font.family: "Jost"
        anchors.bottomMargin: 332
        anchors.topMargin: 32
    }

    Text {
        id: element1
        color: "#000000"
        text: qsTr("0")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        anchors.rightMargin: 172
        font.weight: Font.Medium
        anchors.leftMargin: 200
        font.family: "Jost"
        anchors.bottomMargin: 45
        anchors.topMargin: 319
    }

    Image {
        id: frame_1_merged
        x: 47
        y: 59
        source: "assets/frame_1_merged.png"
    }

    Text {
        id: motor_temperature_value
        color: "#151515"
        text: qsTr("68 C")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.rightMargin: 139
        font.weight: Font.Normal
        anchors.leftMargin: 142
        font.family: "Jost"
        anchors.bottomMargin: 175
        anchors.topMargin: 130
    }

    Text {
        id: motor_temperature_label
        width: 102
        height: 46
        color: "#151515"
        text: qsTr("MOTOR
TEMPERATURE")
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.WordWrap
        font.weight: Font.Normal
        anchors.leftMargin: 140
        font.family: "Jost"
        anchors.topMargin: 190
    }
}

/*##^##
Designer {
    D{i:0;uuid:"67fe4b92-cf91-5ce7-bf4d-4a611b881c98"}D{i:2;uuid:"9e23995c-b3dd-502e-a4ae-3180d0dfce09"}
D{i:3;uuid:"920cccbf-8aba-5077-b961-c7f40fc6f54d"}D{i:4;uuid:"4d61796b-b73f-5ee5-ab45-eefc5fff40b0"}
D{i:5;uuid:"e7fedb1e-9ead-5237-a9e7-d520ccf1989b"}D{i:6;uuid:"f2fbfb8d-e816-59d8-9829-63f56ff79022"}
D{i:7;uuid:"2672b6c6-c6ba-55c1-be3f-3048fcf595aa"}D{i:8;uuid:"fd262140-3fc5-5930-8407-db52fc225ad3"}
D{i:9;uuid:"ccd2ecad-a854-5e14-9ff6-ef6b37008904"}D{i:10;uuid:"13d20e2c-1b05-51b0-b436-e0243fb3a72a"}
D{i:11;uuid:"af7c31fe-819c-5ea6-ad0a-4ae5c62b913e"}D{i:12;uuid:"548102ae-3abd-55b8-94f0-81821e7edd69"}
D{i:13;uuid:"5d0d3196-f400-5548-be00-3cc8e2b01604"}D{i:14;uuid:"44e68c63-d2fc-5748-8a02-6221b0e29ead"}
D{i:15;uuid:"4c5eeabb-864c-5d3a-a39d-932343362ce3"}D{i:16;uuid:"9b0aab54-93c5-594c-858e-84f9ca7096d3"}
D{i:17;uuid:"7e0870d5-aa75-54df-8762-9d2f6e1ad19a"}D{i:18;uuid:"8446d050-59ab-59ff-955b-d83bbbfb47e9"}
D{i:19;uuid:"cd61a553-3047-5262-a26d-8660d9122843"}D{i:20;uuid:"9a2fa40c-f9ae-50f0-85c0-6636736c6689"}
D{i:21;uuid:"fbb07d66-14dd-5110-8796-7ecad673096c"}D{i:22;uuid:"db8e8bd8-cd44-5570-9f41-2923a6555540"}
D{i:23;uuid:"81f8ba6b-e9e5-5901-818e-aba1eef60313"}D{i:24;uuid:"0f354ab9-8d49-5621-817c-0dc5e1d58c70"}
D{i:25;uuid:"6e82e7d1-1e1f-5d94-819b-13c7eb0103a0"}D{i:26;uuid:"4ddc75a2-06b6-5073-b55b-88351b1592b1"}
D{i:1;uuid:"0c190166-1c3f-5a6a-87f9-7a026832623a"}D{i:27;uuid:"9b615991-d49f-5153-b03f-45f0963dcb0b"}
D{i:28;uuid:"80f4517c-9c82-521a-a206-32dad8ed5241"}D{i:29;uuid:"a72317e9-a912-5f36-87f7-b930ed7066c6"}
D{i:30;uuid:"b7efc8ee-2f16-54c5-82ba-4271eea9154c"}D{i:31;uuid:"fe11f589-a33c-5a88-af22-af6a1d0a5cf6"}
D{i:32;uuid:"f3fc0cf2-f9af-596a-9132-8a4697f61f9f"}D{i:33;uuid:"0b568288-5e08-5e9e-b4e8-b8f5820432b1"}
D{i:34;uuid:"69ea93c6-58c8-5038-95bb-1148d3ac5512"}
}
##^##*/

