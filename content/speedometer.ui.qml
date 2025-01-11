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
