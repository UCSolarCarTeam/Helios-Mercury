import QtQuick
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import Mercury
import "../Util"

Item {
    id: rpmGauge
    width: 200
    height: 550

    // gauge properties 
    property real minValue 
    property real maxValue
    property real value 
    property bool flipped: false

    // animation properties 
    property int animationDuration: 300

    // canvas arc properties 
    property real arcBegin: flipped ? 405 : 135
    property real arcEnd: flipped ? 315 : 225 
    property real arcWidth: 20

    GaugeAnimation { id: gaugeAnimation }

    ArcItem {
        id: outerArc
        width: 590
        height: 590
        anchors {
            verticalCenter: rpmGauge.verticalCenter
            // left: rpmGauge.left
            // leftMargin: 45
            horizontalCenter: rpmGauge.horizontalCenter
        }
        strokeWidth: 0 
        strokeColor: "transparent"
        outlineArc: true
        fillColor: Config.outerArcColor
        end: -45
        begin: -135
        arcWidth: 2
        antialiasing: true
    }

    ArcItem {
        id: inactiveArc
        width: 580
        height: 580
        anchors {
            verticalCenter: rpmGauge.verticalCenter
            left: outerArc.left
            leftMargin: 5
        }
        strokeWidth: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: Config.btnDisabled
        end: -45
        begin: -135
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
            onPaint: { gaugeAnimation.drawGauge(activeArc, rpmGauge, activeArcContainer.animatedValue, 50, undefined); }
            Connections {
                target: activeArcContainer
                function onAnimatedValueChanged() { activeArc.requestPaint(); }
            }
        }
    }
    
    Text {
        id: label6
        height: Config.rpmGaugeFontSize
        width: 15
        color: Config.fontColor
        text: qsTr("6")
        font.pixelSize: Config.rpmGaugeFontSize
        anchors {
            bottom: rpmGauge.verticalCenter
            bottomMargin: 210
            left: rpmGauge.left
            leftMargin: 105
        }
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: Config.fontStyle
        font.weight: Font.Medium
    }

    Text {
        id: label5
        height: Config.rpmGaugeFontSize
        width: 15
        color: Config.fontColor
        text: qsTr("5")
        font.pixelSize: Config.rpmGaugeFontSize
        anchors {
            bottom: rpmGauge.verticalCenter
            bottomMargin: 145
            left: rpmGauge.left
            leftMargin: 55

        }
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: Config.fontStyle
        font.weight: Font.Medium
    }

    Text {
        id: label4
        height: Config.rpmGaugeFontSize
        width: 15
        color: Config.fontColor
        text: qsTr("4")
        font.pixelSize: Config.rpmGaugeFontSize
        anchors {
            bottom: rpmGauge.verticalCenter
            bottomMargin: 65
            left: rpmGauge.left
            leftMargin: 20
        }
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: Config.fontStyle
        font.weight: Font.Medium
    }

    Text {
        id: label3
        height: Config.rpmGaugeFontSize
        width: 15
        color: Config.fontColor
        text: qsTr("3")
        font.pixelSize: Config.rpmGaugeFontSize
        anchors {
            verticalCenter: rpmGauge.verticalCenter
            left: rpmGauge.left
            leftMargin: 10
        }
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: Config.fontStyle
        font.weight: Font.Medium
    }

    Text {
        id: label2
        height: Config.rpmGaugeFontSize
        width: 15
        color: Config.fontColor
        text: qsTr("2")
        font.pixelSize: Config.rpmGaugeFontSize
        anchors {
            top: rpmGauge.verticalCenter
            topMargin: 65
            left: rpmGauge.left
            leftMargin: 25

        }
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: Config.fontStyle
        font.weight: Font.Medium
    }

    Text {
        id: label1
        height: Config.rpmGaugeFontSize
        width: 15
        color: Config.fontColor
        text: qsTr("1")
        font.pixelSize: Config.rpmGaugeFontSize
        anchors {
            top: rpmGauge.verticalCenter
            topMargin: 145
            left: rpmGauge.left
            leftMargin: 65

        }
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: Config.fontStyle
        font.weight: Font.Medium
    }

    Text {
        id: label0
        height: Config.rpmGaugeFontSize
        width: 15
        color: Config.fontColor
        text: qsTr("0")
        font.pixelSize: Config.rpmGaugeFontSize
        anchors {
            top: rpmGauge.verticalCenter
            topMargin: 210
            left: rpmGauge.left
            leftMargin: 110
        }
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: Config.fontStyle
        font.weight: Font.Medium
    }
}
