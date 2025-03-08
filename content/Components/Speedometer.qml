import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import "../Util"
import Mercury
import "../Config"

Rectangle {
    id: root
    width: 458
    height: 458
    color: "transparent"

    property int minValue: 0
    property int maxValue: 160
    property string units: "Km/h"
    property int value: 100

    property int animationDuration: 300

    property real arcEnd: -135
    property real arcBegin: 135
    property real arcWidth: 16

    GaugeAnimation {
        id: gaugeAnimation
    }

    ArcItem {
        id: outerArc
        width: 458
        height: 458
        anchors.left: parent.left
        anchors.top: parent.top
        strokeWidth: 0
        strokeStyle: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: "#1b1a1d"
        end: -135
        begin: 135
        arcWidth: 16
        antialiasing: true
    }

    ArcItem {
        id: inactiveArc
        width: 423
        height: 423
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 18
        anchors.topMargin: 17
        strokeWidth: 0
        strokeStyle: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: "#242627"
        end: -135
        begin: 135
        arcWidth: 16
        antialiasing: true
    }

    Item {
        id: activeArcContainer
        anchors.fill: inactiveArc
        property real animatedValue: root.minValue

        Behavior on animatedValue {
            NumberAnimation {
                duration: root.animationDuration
            }
        }

        Connections {
            target: root
            function onValueChanged() {
                activeArcContainer.animatedValue = gaugeAnimation.clamp(root.value, root.minValue, root.maxValue);
            }
        }

        Component.onCompleted: {
            animatedValue = gaugeAnimation.clamp(root.value, root.minValue, root.maxValue);
        }

        Canvas {
            id: activeArc
            anchors.fill: parent
            onPaint: {
                gaugeAnimation.drawGauge(activeArc, root, activeArcContainer.animatedValue);
            }
            Connections {
                target: activeArcContainer
                function onAnimatedValueChanged() {
                    activeArc.requestPaint();
                }
            }
        }
    }

    Item {
        id: increments_dashes
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 9
        anchors.rightMargin: 8
        anchors.topMargin: 7
        anchors.bottomMargin: 74
        Rectangle {
            id: rectangle_38
            width: 5
            height: 9
            color: "#ffffff"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 211
            anchors.topMargin: 1
        }

        Rectangle {
            id: rectangle_39
            width: 5
            height: 9
            color: "#ffffff"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 330
            anchors.topMargin: 32
            rotation: 33.432
        }

        Rectangle {
            id: rectangle_43
            width: 5
            height: 9
            color: "#ffffff"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 101
            anchors.topMargin: 35
            rotation: -36.386
        }

        Rectangle {
            id: rectangle_47
            width: 4
            height: 9
            color: "#aa3333"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 152
            anchors.topMargin: 11
            rotation: -17.668
        }

        Rectangle {
            id: rectangle_48
            width: 4
            height: 9
            color: "#515253"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 55
            anchors.topMargin: 75
            rotation: 307.827
        }

        Rectangle {
            id: rectangle_49
            width: 4
            height: 9
            color: "#aa3333"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 3
            anchors.topMargin: 191
            rotation: 96.204
        }

        Rectangle {
            id: rectangle_50
            width: 4
            height: 9
            color: "#515253"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 17
            anchors.topMargin: 299
            rotation: 66.598
        }

        Rectangle {
            id: rectangle_40
            width: 5
            height: 9
            color: "#ffffff"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 416
            anchors.topMargin: 130
            rotation: 66.687
        }

        Rectangle {
            id: rectangle_44
            width: 5
            height: 9
            color: "#ffffff"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 19
            anchors.topMargin: 130
            rotation: 118.443
        }

        Rectangle {
            id: rectangle_41
            width: 5
            height: 9
            color: "#ffffff"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 434
            anchors.topMargin: 234
            rotation: 93.892
        }

        Rectangle {
            id: rectangle_45
            width: 5
            height: 9
            color: "#ffffff"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 2
            anchors.topMargin: 235
            rotation: 87.445
        }

        Rectangle {
            id: rectangle_42
            width: 5
            height: 9
            color: "#ffffff"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 373
            anchors.topMargin: 368
            rotation: 134.103
        }

        Rectangle {
            id: rectangle_46
            width: 5
            height: 9
            color: "#ffffff"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 63
            anchors.topMargin: 368
            rotation: 227.358
        }

        Rectangle {
            id: rectangle_51
            width: 4
            height: 9
            color: "#515253"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 281
            anchors.topMargin: 10
            rotation: 200.581
        }

        Rectangle {
            id: rectangle_52
            width: 4
            height: 9
            color: "#515253"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 383
            anchors.topMargin: 77
            rotation: 43.593
        }

        Rectangle {
            id: rectangle_53
            width: 4
            height: 9
            color: "#515253"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 433
            anchors.topMargin: 184
            rotation: 84.018
        }

        Rectangle {
            id: rectangle_54
            width: 4
            height: 9
            color: "#515253"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 424
            anchors.topMargin: 287
            rotation: -254.263
        }
    }

    ArcItem {
        id: outerRing1
        width: 247
        height: 247
        anchors.verticalCenter: parent.verticalCenter
        strokeWidth: 0
        strokeStyle: 0
        strokeColor: "transparent"
        rotation: -90
        outlineArc: true
        fillColor: "#1b1a1d"
        end: 584.28325
        begin: 314.28326
        arcWidth: 9.42797
        antialiasing: true
        anchors.verticalCenterOffset: 1
        anchors.horizontalCenterOffset: -1
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: element
        width: 23
        height: 30
        color: "#ffffff"
        text: qsTr("0")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 91
        anchors.topMargin: 340
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: "SF Pro"
    }

    Text {
        id: element1
        width: 41
        height: 30
        color: "#ffffff"
        text: qsTr("20")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 40
        anchors.topMargin: 231
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: "SF Pro"
    }

    Text {
        id: element2
        width: 42
        height: 30
        color: "#ffffff"
        text: qsTr("40")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 52
        anchors.topMargin: 141
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: "SF Pro"
    }

    Text {
        id: element3
        width: 43
        height: 30
        color: "#ffffff"
        text: qsTr("60")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 118
        anchors.topMargin: 68
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: "SF Pro"
    }

    Text {
        id: element4
        width: 43
        height: 30
        color: "#ffffff"
        text: qsTr("80")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 208
        anchors.topMargin: 38
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: "SF Pro"
    }

    Text {
        id: element5
        width: 56
        height: 30
        color: "#ffffff"
        text: qsTr("100")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 287
        anchors.topMargin: 62
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: "SF Pro"
    }

    Text {
        id: element6
        width: 55
        height: 30
        color: "#ffffff"
        text: qsTr("120")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 356
        anchors.topMargin: 138
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: "SF Pro"
    }

    Text {
        id: element7
        width: 56
        height: 30
        color: "#ffffff"
        text: qsTr("140")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 372
        anchors.topMargin: 230
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: "SF Pro"
    }

    Text {
        id: element8
        width: 55
        height: 30
        color: "#ffffff"
        text: qsTr("160")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 318
        anchors.topMargin: 340
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: "SF Pro"
    }

    Rectangle {
        id: speedometerValueContainer
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        height: 115
        width: 70
        color: "transparent"

        Text {
            id: speedometerValue
            color: "#ffffff"
            text: root.value
            font.pixelSize: 86
            font.weight: Font.Medium
            font.family: "SF Pro"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.NoWrap
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
        }

        Text {
            id: kMH
            color: "#ffffff"
            text: qsTr("KMH")
            font.pixelSize: 24
            font.weight: Font.Medium
            font.family: "SF Pro"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            lineHeight: 18
            lineHeightMode: Text.FixedHeight
            wrapMode: Text.NoWrap
            anchors.horizontalCenterOffset: 1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
        }
    }
}
