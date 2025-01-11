import QtQuick

Rectangle {
    id: speedometer
    width: 700
    height: 702
    color: "transparent"
    property alias rpmText: rpm.text
    property alias speedometerLowerLimitText: speedometerLowerLimit.text
    property alias kmhValueText: kmhValue.text
    property alias kmhText: kmh.text
    property alias speedometerUpperLimitText: speedometerUpperLimit.text
    property alias rpmValueText: rpmValue.text

    Image {
        id: speedometerEllipse13
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/speedometerEllipse13.png"
        anchors.leftMargin: 350
        anchors.topMargin: 0
    }

    Image {
        id: speedometerEllipse12
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/speedometerEllipse12.png"
        anchors.leftMargin: 349
        anchors.topMargin: 585
    }

    Image {
        id: speedometerEllipse11
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/speedometerEllipse11.png"
        anchors.leftMargin: 200
        anchors.topMargin: 200
    }

    Text {
        id: kmhValue
        width: 146
        height: 185
        color: "#151515"
        text: qsTr("48")
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 90
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        anchors.leftMargin: 235
        font.family: "Jost"
        anchors.topMargin: 201
    }

    Text {
        id: rpmValue
        width: 269
        height: 185
        color: "#151515"
        text: qsTr("7000")
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 60
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        font.weight: Font.Normal
        anchors.leftMargin: 168
        font.family: "Jost"
        anchors.topMargin: 306
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
        anchors.leftMargin: 387
        font.family: "Jost"
        anchors.topMargin: 287
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
        anchors.leftMargin: 397
        font.family: "Jost"
        anchors.topMargin: 385
    }

    Image {
        id: speedometerEllipse10
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/speedometerEllipse10.png"
        anchors.leftMargin: 350
        anchors.topMargin: 82
    }

    Text {
        id: speedometerUpperLimit
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
        id: speedometerLowerLimit
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
        id: speedometerEllipse9
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/speedometerEllipse9.png"
        anchors.leftMargin: 611
        anchors.topMargin: 300
    }

    Image {
        id: speedometerEllipse8
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/speedometerEllipse8.png"
        anchors.leftMargin: 610
        anchors.topMargin: 401
    }

    Image {
        id: speedometerEllipse7
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/speedometerEllipse7.png"
        anchors.leftMargin: 519
        anchors.topMargin: 548
    }

    Image {
        id: speedometerEllipse6
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/speedometerEllipse6.png"
        anchors.leftMargin: 442
        anchors.topMargin: 593
    }

    Image {
        id: speedometerEllipse5
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/speedometerEllipse5.png"
        anchors.leftMargin: 442
        anchors.topMargin: 98
    }

    Image {
        id: speedometerEllipse4
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/speedometerEllipse4.png"
        anchors.leftMargin: 519
        anchors.topMargin: 141
    }

    Image {
        id: speedometerEllipse3
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/speedometerEllipse3.png"
        anchors.leftMargin: 576
        anchors.topMargin: 481
    }

    Image {
        id: speedometerEllipse2
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/speedometerEllipse2.png"
        anchors.leftMargin: 576
        anchors.topMargin: 212
    }

    Image {
        id: speedometerEllipse1
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/speedometerEllipse1.png"
        anchors.leftMargin: 350
        anchors.topMargin: 609
    }

    Rectangle {
        id: speedometerNeedle
        width: 205
        height: 8
        color: "#a2180f"
        anchors.left: parent.left
        anchors.top: parent.top
        rotation: 44.286
        anchors.leftMargin: 430
        anchors.topMargin: 515
    }
}

/*##^##
Designer {
    D{i:0;uuid:"bc7b0c70-7356-5722-bcbc-a9e32975173d"}D{i:1;uuid:"a164412a-ffef-5b3a-a1b4-0f4e53046362"}
D{i:2;uuid:"e9fd9dcc-aaa2-5084-9699-a816f04df439"}D{i:3;uuid:"ed0bfe73-4154-51de-a4ba-df60bcf60b59"}
D{i:4;uuid:"5c397327-a83b-5d96-95da-6b23ac9aafad"}D{i:5;uuid:"069b976e-953a-5bd8-94f0-c8457df85573"}
D{i:6;uuid:"61296e88-d414-53c8-9526-d5547be19bda"}D{i:7;uuid:"03a11cd5-af16-5612-9e67-187d8e9a7ee6"}
D{i:8;uuid:"53b93181-3273-5f5e-8cfa-33475cf5abac"}D{i:9;uuid:"9e724508-9afe-5920-93f6-8b20479c50b0"}
D{i:10;uuid:"36be5267-7276-5f13-985d-68d63eaca3bf"}D{i:11;uuid:"110f5d8c-5d30-531b-b778-2aca5c38a693"}
D{i:12;uuid:"dac85b4b-8afe-559c-8ea0-f989f2c9cc1b"}D{i:13;uuid:"fc54a9e4-b187-5b29-8b15-06bb5b4b8f2c"}
D{i:14;uuid:"66fae9aa-5827-5d47-889e-06982c06ad56"}D{i:15;uuid:"bb3702d0-bbab-58ab-9295-29bc2d33f657"}
D{i:16;uuid:"ae110756-63e9-54d7-a322-cac811537b77"}D{i:17;uuid:"c42fded0-93af-5754-b61a-ec790764bee6"}
D{i:18;uuid:"3437b632-4aea-5623-a304-917873871095"}D{i:19;uuid:"722dac2b-78cf-50f1-85a5-466832c7419b"}
D{i:20;uuid:"4a44478e-12a2-5eac-bf19-9707dc8ffe89"}
}
##^##*/

