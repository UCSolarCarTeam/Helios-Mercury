import QtQuick
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import Mercury
import "../Util"

Item {
    id: largeGauge
    width: 291
    height: 291

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
    property real arcWidth: 28

    GaugeAnimation { id: gaugeAnimation }

    ArcItem {
        id: outerArc
        width: 291
        height: 291
        strokeWidth: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: Config.outerArcColor
        end: -135
        begin: 135
        arcWidth: 3
        antialiasing: true
    }

    ArcItem {
        id: inactiveArc
        width: 276
        height: 276
        anchors {
            left: parent.left
            top: parent.top
            leftMargin: 8
            topMargin: 8
        }
        strokeWidth: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: Config.btnDisabled
        end: -135
        begin: 135
        arcWidth: 28
        antialiasing: true
    }

    Item {
        id: activeArcContainer
        anchors.fill: inactiveArc
        property real animatedValue: largeGauge.minValue

        Behavior on animatedValue { NumberAnimation { duration: largeGauge.animationDuration } }

        Connections {
            target: largeGauge
            function onValueChanged() { activeArcContainer.animatedValue = gaugeAnimation.clamp(largeGauge.value, largeGauge.minValue, largeGauge.maxValue); }
        }

        Component.onCompleted: { animatedValue = gaugeAnimation.clamp(largeGauge.value, largeGauge.minValue, largeGauge.maxValue); }

        Canvas {
            id: activeArc
            anchors.fill: parent
            onPaint: { gaugeAnimation.drawGauge(activeArc, largeGauge, activeArcContainer.animatedValue); }
            Connections {
                target: activeArcContainer
                function onAnimatedValueChanged() { activeArc.requestPaint(); }
            }
        }
    }

    Text {
        id: minVal
        width: 15
        height: Config.gaugeFontSizeL
        color: Config.fontColor
        text: largeGauge.minValue
        font.pixelSize: Config.gaugeFontSizeL
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            right: inactiveArc.horizontalCenter
            rightMargin: 55
            bottom: inactiveArc.bottom
            bottomMargin: 25
        }
        font.weight: Font.Medium
        font.family: Config.fontStyle
    }

    Text {
        id: maxVal
        width: 35
        height: Config.gaugeFontSizeL
        color: Config.fontColor
        text: largeGauge.maxValue
        font.pixelSize: Config.gaugeFontSizeL
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            left: inactiveArc.horizontalCenter
            leftMargin: 35
            bottom: inactiveArc.bottom
            bottomMargin: 25
        }
        font.weight: Font.Medium
        font.family: Config.fontStyle
    }

    Text {
        id: gaugeValue
        width: 210
        height: Config.gaugeFontSizeXL
        color: Config.fontColor
        text: {
            if (Math.floor(largeGauge.value) === largeGauge.value) {
                return Math.floor(largeGauge.value) + largeGauge.units;
            } else {
                    return largeGauge.value.toFixed(1) + largeGauge.units;
            }
        }
        font.pixelSize: Config.gaugeFontSizeXL
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            bottom: inactiveArc.verticalCenter
            horizontalCenter: inactiveArc.horizontalCenter
            bottomMargin: -10
        }
        font.weight: Font.Medium
        font.family: Config.fontStyle
    }

    Text {
        id: gaugeLabel
        width: 210
        height: Config.gaugeFontSizeS
        color: Config.fontColor
        text: largeGauge.gaugeTitle
        font.pixelSize: Config.gaugeFontSizeS
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            top: gaugeValue.bottom
            horizontalCenter: inactiveArc.horizontalCenter
            topMargin: 15
        }
        font.weight: Font.Medium
        font.family: Config.fontStyle
    }

    Image {
        id: accelerationIcon
        width: 50
        height: 45
        anchors {
            bottom: gaugeValue.top
            horizontalCenter: inactiveArc.horizontalCenter
            bottomMargin: 20
        }
        source: "../Images/AccelerationIcon.png"
    }
}
