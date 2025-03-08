import QtQuick
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import Mercury
import "../Util"

Item  {
    id: rpmGauge
    width: 188
    height: 499

    // gauge properties
    property real minValue
    property real maxValue
    property real value

    // animation properties
    property int animationDuration: 300

    // canvas arc properties
    property real arcBegin: 135
    property real arcEnd: 235
    property real arcWidth: 20

    GaugeAnimation { id: gaugeAnimation }

    ArcItem {
        id: outerArc
        x: 51
        y: -38
        width: 589
        height: 589
        strokeWidth: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: Config.outerArcColor
        end: -30
        begin: -140
        arcWidth: 2
        antialiasing: true
    }

    ArcItem {
        id: inactiveArc
        width: 580
        height: 580
        anchors {
            left: parent.left
            top: parent.top
            leftMargin: 56
            topMargin: -33
        }
        strokeWidth: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: Config.btnDisabled
        end: -30
        begin: -140
        arcWidth: 20
        antialiasing: true
    }


    Item {
        id: activeArcContainer
        anchors.fill: inactiveArc
        property real animatedValue: rpmGauge.minValue

        Behavior on animatedValue { NumberAnimation { duration: rpmGauge.animationDuration } }

        Connections {
            target: rpmGauge
            function onValueChanged() { activeArcContainer.animatedValue = gaugeAnimation.clamp(rpmGauge.value, rpmGauge.minValue, rpmGauge.maxValue); }
        }

        Component.onCompleted: { animatedValue = gaugeAnimation.clamp(rpmGauge.value, rpmGauge.minValue, rpmGauge.maxValue); }

        Canvas {
            id: activeArc
            anchors.fill: parent
            onPaint: { gaugeAnimation.drawGauge(activeArc, rpmGauge, activeArcContainer.animatedValue); }
            Connections {
                target: activeArcContainer
                function onAnimatedValueChanged() { activeArc.requestPaint(); }
            }
        }
    }

    Text {
        id: element
        color: "#ffffff"
        text: qsTr("6")
        font.pixelSize: 40
        anchors.horizontalCenterOffset: 35
        anchors.centerIn: parent
        font.family: "SF Pro"
        anchors.verticalCenterOffset: -235
        font.weight: Font.Medium
    }

    Text {
        id: element1
        color: "#ffffff"
        text: qsTr("5")
        font.pixelSize: 40
        anchors.horizontalCenterOffset: -22
        anchors.centerIn: parent
        font.family: "SF Pro"
        anchors.verticalCenterOffset: -173
        font.weight: Font.Medium
    }

    Text {
        id: element2
        color: "#ffffff"
        text: qsTr("4")
        font.pixelSize: 40
        anchors.horizontalCenterOffset: -57
        anchors.centerIn: parent
        font.family: "SF Pro"
        anchors.verticalCenterOffset: -96
        font.weight: Font.Medium
    }

    Text {
        id: element3
        color: "#ffffff"
        text: qsTr("3")
        font.pixelSize: 40
        anchors.horizontalCenterOffset: -73
        anchors.centerIn: parent
        font.family: "SF Pro"
        anchors.verticalCenterOffset: -14
        font.weight: Font.Medium
    }

    Text {
        id: element4
        color: "#ffffff"
        text: qsTr("2")
        font.pixelSize: 40
        anchors.horizontalCenterOffset: -70
        anchors.centerIn: parent
        font.family: "SF Pro"
        anchors.verticalCenterOffset: 68
        font.weight: Font.Medium
    }

    Text {
        id: element5
        color: "#ffffff"
        text: qsTr("1")
        font.pixelSize: 40
        anchors.horizontalCenterOffset: -39
        anchors.centerIn: parent
        font.family: "SF Pro"
        anchors.verticalCenterOffset: 155
        font.weight: Font.Medium
    }

    Text {
        id: element6
        color: "#ffffff"
        text: qsTr("0")
        font.pixelSize: 40
        anchors.horizontalCenterOffset: 13
        anchors.centerIn: parent
        font.family: "SF Pro"
        anchors.verticalCenterOffset: 224
        font.weight: Font.Medium
    }
}



