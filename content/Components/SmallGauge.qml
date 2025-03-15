import QtQuick
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import Mercury
import "../Util"

Item {
    id: smallGauge
    width: 178
    height: 178

    // gauge properties
    property real minValue
    property real maxValue
    property string units
    property real value
    property string gaugeTitle

    // animation properties
    property int animationDuration: 300

    // canvas arc properties
    property real arcEnd: 405
    property real arcBegin: 135
    property real arcWidth: 17

    GaugeAnimation { id: gaugeAnimation }

    ArcItem {
        id: outerArc
        width: 178
        height: 178
        strokeWidth: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: Config.outerArcColor
        end: -135
        begin: 135
        arcWidth: 2
        antialiasing: true
    }

    ArcItem {
        id: inactiveArc
        width: 169
        height: 169
        anchors {
            left: parent.left
            top: parent.top
            leftMargin: 5
            topMargin: 5
        }
        strokeWidth: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: Config.btnDisabled
        end: -135
        begin: 135
        arcWidth: 17
        antialiasing: true
    }

    Item {
        id: activeArcContainer
        anchors.fill: inactiveArc
        property real animatedValue: smallGauge.minValue

        Behavior on animatedValue { NumberAnimation { duration: smallGauge.animationDuration } }

        Connections {
            target: smallGauge
            function onValueChanged() { activeArcContainer.animatedValue = gaugeAnimation.clamp(smallGauge.value, smallGauge.minValue, smallGauge.maxValue); }
        }

        Component.onCompleted: { animatedValue = gaugeAnimation.clamp(smallGauge.value, smallGauge.minValue, smallGauge.maxValue); }

        Canvas {
            id: activeArc
            anchors.fill: parent
            onPaint: { gaugeAnimation.drawGauge(activeArc, smallGauge, activeArcContainer.animatedValue); }
            Connections {
                target: activeArcContainer
                function onAnimatedValueChanged() { activeArc.requestPaint(); }
            }
        }
    }

    Text {
        id: minVal
        width: 12
        height: 24
        color: Config.fontColor
        text: smallGauge.minValue
        font.pixelSize: Config.gaugeFontSizeS
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            right: inactiveArc.horizontalCenter
            rightMargin: 35
            bottom: inactiveArc.bottom
            bottomMargin: 10
        }
        font.weight: Font.Medium
        font.family: Config.fontStyle
    }

    Text {
        id: maxVal
        width: 35
        height: 24
        color: Config.fontColor
        text: smallGauge.maxValue
        font.pixelSize: Config.gaugeFontSizeS
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            left: inactiveArc.horizontalCenter
            leftMargin: 10
            bottom: inactiveArc.bottom
            bottomMargin: 10
        }
        font.weight: Font.Medium
        font.family: Config.fontStyle
    }

    Text {
        id: gaugeValue
        width: 150
        height: 36
        color: Config.fontColor
        text: {
            if (Math.floor(smallGauge.value) === smallGauge.value) {
                return Math.floor(smallGauge.value) + smallGauge.units;
            } else {
                    return smallGauge.value.toFixed(1) + smallGauge.units;
            }
        }
        font.pixelSize: Config.gaugeFontSizeM
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            bottom: inactiveArc.verticalCenter
            horizontalCenter: inactiveArc.horizontalCenter
            bottomMargin: -5
        }
        font.weight: Font.Medium
        font.family: Config.fontStyle
    }

    Text {
        id: gaugeLabel
        width: 150
        height: 18
        color: Config.fontColor
        text: smallGauge.gaugeTitle
        font.pixelSize: Config.gaugeFontSizeXS
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            top: gaugeValue.bottom
            horizontalCenter: inactiveArc.horizontalCenter
        }
        font.weight: Font.Medium
        font.family: Config.fontStyle
    }

    Image {
        id: boltIcon
        width: 14
        height: 20
        anchors {
            bottom: gaugeValue.top
            horizontalCenter: inactiveArc.horizontalCenter
            bottomMargin: 5
        }
        source: "../Images/BoltIcon.png"
    }
}
