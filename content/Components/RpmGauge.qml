import QtQuick
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0

Rectangle {
    id: rpmGauge
    width: 188
    height: 499
    color: "transparent"
    property alias element4Text: element4.text
    property alias element2Text: element2.text
    property alias element1Text: element1.text
    property alias element6Text: element6.text
    property alias element3Text: element3.text
    property alias elementText: element.text
    property alias element5Text: element5.text
    rotation: -1.294

    Rectangle {
        id: rectangle
        x: -34
        y: -34
        width: 283
        height: 599
        color: "#000000"
    }

    Text {
        id: element
        width: 34
        height: 48
        color: "#ffffff"
        text: qsTr("6")
        font.pixelSize: 40
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        rotation: 0.987
        anchors.horizontalCenterOffset: 27
        anchors.centerIn: parent
        font.family: "SF Pro"
        anchors.verticalCenterOffset: -234
        font.weight: Font.Medium
    }

    Text {
        id: element1
        width: 32
        height: 48
        color: "#ffffff"
        text: qsTr("5")
        font.pixelSize: 40
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        rotation: 0.987
        anchors.horizontalCenterOffset: -28
        anchors.centerIn: parent
        font.family: "SF Pro"
        anchors.verticalCenterOffset: -172
        font.weight: Font.Medium
    }

    Text {
        id: element2
        width: 33
        height: 48
        color: "#ffffff"
        text: qsTr("4")
        font.pixelSize: 40
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        rotation: 0.987
        anchors.horizontalCenterOffset: -66
        anchors.centerIn: parent
        font.family: "SF Pro"
        anchors.verticalCenterOffset: -95
        font.weight: Font.Medium
    }

    Text {
        id: element3
        width: 33
        height: 48
        color: "#ffffff"
        text: qsTr("3")
        font.pixelSize: 40
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        rotation: 0.987
        anchors.horizontalCenterOffset: -79
        anchors.centerIn: parent
        font.family: "SF Pro"
        anchors.verticalCenterOffset: -14
        font.weight: Font.Medium
    }

    Text {
        id: element4
        width: 32
        height: 48
        color: "#ffffff"
        text: qsTr("2")
        font.pixelSize: 40
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        rotation: 0.987
        anchors.horizontalCenterOffset: -73
        anchors.centerIn: parent
        font.family: "SF Pro"
        anchors.verticalCenterOffset: 69
        font.weight: Font.Medium
    }

    Text {
        id: element5
        width: 22
        height: 48
        color: "#ffffff"
        text: qsTr("1")
        font.pixelSize: 40
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        rotation: 0.987
        anchors.horizontalCenterOffset: -51
        anchors.centerIn: parent
        font.family: "SF Pro"
        anchors.verticalCenterOffset: 154
        font.weight: Font.Medium
    }

    Text {
        id: element6
        width: 35
        height: 48
        color: "#ffffff"
        text: qsTr("0")
        font.pixelSize: 40
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        rotation: 0.987
        anchors.horizontalCenterOffset: -6
        anchors.centerIn: parent
        font.family: "SF Pro"
        anchors.verticalCenterOffset: 225
        font.weight: Font.Medium
    }

    ArcItem {
        id: arc
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        begin: 328.24295
        anchors.rightMargin: -364
        fillColor: "#00a8ff"
        rotation: 1.294
        outlineArc: true
        strokeStyle: 0
        strokeColor: "transparent"
        arcWidth: 16.19966
        antialiasing: true
        anchors.leftMargin: 49
        anchors.topMargin: -26
        anchors.bottomMargin: -61
        strokeWidth: 0
        end: 223.80682
    }

    SvgPathItem {
        id: needle_Stroke_
        width: 51
        height: 8
        anchors.left: parent.left
        anchors.top: parent.top
        fillColor: "#ffffff"
        rotation: 140.429
        strokeStyle: 1
        strokeColor: "transparent"
        path: "M 50.772056579589844 8 L 0 8 L 0 0 L 50.772056579589844 0 L 50.772056579589844 8 Z"
        joinStyle: 0
        antialiasing: true
        anchors.leftMargin: 112
        anchors.topMargin: 454
        strokeWidth: 8
    }
}



