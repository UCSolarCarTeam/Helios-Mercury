import QtQuick
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import Mercury
import "../Util"

Item {
    id: mediumGauge
    width: 242
    height: 242

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
    property real arcWidth: 23

    GaugeAnimation { id: gaugeAnimation }

    ArcItem {
        id: outerArc
        width: 242
        height: 242
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
        width: 229
        height: 229
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
        arcWidth: 23
        antialiasing: true
    }

    Item {
        id: activeArcContainer
        anchors.fill: inactiveArc
        property real animatedValue: mediumGauge.minValue

        Behavior on animatedValue { NumberAnimation { duration: mediumGauge.animationDuration } }

        Connections {
            target: mediumGauge
            function onValueChanged() { activeArcContainer.animatedValue = gaugeAnimation.clamp(mediumGauge.value, mediumGauge.minValue, mediumGauge.maxValue); }
        }

        Component.onCompleted: { animatedValue = gaugeAnimation.clamp(mediumGauge.value, mediumGauge.minValue, mediumGauge.maxValue); }

        Canvas {
            id: activeArc
            anchors.fill: parent
            onPaint: { gaugeAnimation.drawGauge(activeArc, mediumGauge, activeArcContainer.animatedValue); }
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
        text: mediumGauge.minValue
        font.pixelSize: Config.gaugeFontSizeM
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            right: inactiveArc.horizontalCenter
            rightMargin: 55
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
        text: mediumGauge.maxValue
        font.pixelSize: Config.gaugeFontSizeM
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            left: inactiveArc.horizontalCenter
            leftMargin: 30
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
            if (Math.floor(mediumGauge.value) === mediumGauge.value) {
                return Math.floor(mediumGauge.value) + mediumGauge.units;
            } else {
                    return mediumGauge.value.toFixed(1) + mediumGauge.units;
            }
        }
        font.pixelSize: Config.gaugeFontSizeL
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
        text: mediumGauge.gaugeTitle
        font.pixelSize: Config.gaugeFontSizeS
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            top: gaugeValue.bottom
            horizontalCenter: inactiveArc.horizontalCenter
            topMargin: 10
        }
        font.weight: Font.Medium
        font.family: Config.fontStyle
    }

    Image {
        id: boltIcon
        width: 20
        height: 35
        anchors {
            bottom: gaugeValue.top
            horizontalCenter: inactiveArc.horizontalCenter
            bottomMargin: 10
        }
        source: "../Images/BoltIcon.png"
    }
}
