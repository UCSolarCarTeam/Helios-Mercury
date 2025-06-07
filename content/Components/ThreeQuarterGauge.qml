import QtQuick
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import Mercury
import "../Util"

Item {
    id: threeQuarterGauge
    width: 269
    height: 235

    // gauge properties
    property real minValue
    property real maxValue
    property string units
    property real value
    property string gaugeTitle

    // animation properties
    property int animationDuration: 300

    // canvas arc properties
    property real arcEnd: 360
    property real arcBegin: 90
    property real arcWidth: 20

    GaugeAnimation { id: gaugeAnimation } 

    ArcItem {
        id: outerArc
        width: 213
        height: 213
        strokeWidth: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: Config.outerArcColor
        end: -180
        begin: 90
        arcWidth: 2
        antialiasing: true
    }

    ArcItem {
        id: inactiveArc
        width: 202
        height: 202
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
        end: -180
        begin: 90
        arcWidth: 20
        antialiasing: true
    }

    Item {
        id: activeArcContainer
        anchors.fill: inactiveArc
        property real animatedValue: threeQuarterGauge.minValue

        Behavior on animatedValue { NumberAnimation { duration: threeQuarterGauge.animationDuration } }

        Connections {
            target: threeQuarterGauge
            function onValueChanged() { activeArcContainer.animatedValue = gaugeAnimation.clamp(threeQuarterGauge.value, threeQuarterGauge.minValue, threeQuarterGauge.maxValue); }
        }

        Component.onCompleted: { animatedValue = gaugeAnimation.clamp(threeQuarterGauge.value, threeQuarterGauge.minValue, threeQuarterGauge.maxValue); }

        Canvas {
            id: activeArc
            anchors.fill: parent
            onPaint: { gaugeAnimation.drawGauge(activeArc, threeQuarterGauge, activeArcContainer.animatedValue); }
            Connections {
                target: activeArcContainer
                function onAnimatedValueChanged() { activeArc.requestPaint(); }
            }
        }
    }

    Text {
        id: minVal
        width: 15
        height: 24
        color: Config.fontColor
        text: threeQuarterGauge.minValue
        font.pixelSize: Config.fontSize6
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            right: outerArc.horizontalCenter
            top: outerArc.bottom
        }
        font.weight: Font.Medium
        font.family: Config.fontStyle
    }

    Text {
        id: maxVal
        width: 50
        height: 24
        color: Config.fontColor
        text: threeQuarterGauge.maxValue
        font.pixelSize: Config.fontSize6
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            bottom: outerArc.verticalCenter
            left: outerArc.right
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
            if (Math.floor(threeQuarterGauge.value) === threeQuarterGauge.value) {
                return Math.floor(threeQuarterGauge.value) + threeQuarterGauge.units;
            } else {
                    return threeQuarterGauge.value.toFixed(1) + threeQuarterGauge.units;
            }
        }
        font.pixelSize: Config.fontSize7
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            bottom: inactiveArc.verticalCenter
            horizontalCenter: inactiveArc.horizontalCenter
            bottomMargin: 10
        }
        font.weight: Font.Medium
        font.family: Config.fontStyle
    }

    Text {
        id: gaugeLabel
        width: 150
        height: 18
        color: Config.fontColor
        text: threeQuarterGauge.gaugeTitle
        font.pixelSize: Config.fontSize4
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            top: gaugeValue.bottom
            horizontalCenter: inactiveArc.horizontalCenter
        }
        font.weight: Font.Medium
        font.family: Config.fontStyle
    }
}
