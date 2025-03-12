import QtQuick
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import Mercury
import "../Util"

Item {
    id: xsGaugeCluster
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
    property real arcEnd: 135
    property real arcBegin: -135
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
        end: 135 // Changed end to 180
        begin: -135 // Changed begin to -90
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
        end: 135 // Changed end to 180
        begin: -135 // Changed begin to -90
        arcWidth: 20
        antialiasing: true
    }

    Item {
        id: activeArcContainer
        anchors.fill: inactiveArc
        property real animatedValue: xsGaugeCluster.minValue

        Behavior on animatedValue { NumberAnimation { duration: xsGaugeCluster.animationDuration } }

        Connections {
            target: xsGaugeCluster
            function onValueChanged() { activeArcContainer.animatedValue = gaugeAnimation.clamp(xsGaugeCluster.value, xsGaugeCluster.minValue, xsGaugeCluster.maxValue); }
        }

        Component.onCompleted: { animatedValue = gaugeAnimation.clamp(xsGaugeCluster.value, xsGaugeCluster.minValue, xsGaugeCluster.maxValue); }

        Canvas {
            id: activeArc
            anchors.fill: parent
            onPaint: { gaugeAnimation.drawGauge(activeArc, xsGaugeCluster, activeArcContainer.animatedValue, -90, 180); } // Pass new begin and end
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
        color: "#ffffff"
        text: xsGaugeCluster.minValue
        font.pixelSize: 24
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            left: outerArc.left
            bottom: outerArc.top // Changed anchor
        }
        font.weight: Font.Medium
        font.family: Config.fontStye
    }

    Text {
        id: maxVal
        width: 50
        height: 24
        color: "#ffffff"
        text: xsGaugeCluster.maxValue
        font.pixelSize: 24
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            top: outerArc.verticalCenter // Changed anchor
            right: outerArc.right // Changed anchor
        }
        font.weight: Font.Medium
        font.family: Config.fontStye
    }

    Text {
        id: gaugeValue
        width: 150
        height: 36
        color: "#ffffff"
        text: {
            if (Math.floor(xsGaugeCluster.value) === xsGaugeCluster.value) {
                return Math.floor(xsGaugeCluster.value) + xsGaugeCluster.units;
            } else {
                return xsGaugeCluster.value.toFixed(1) + xsGaugeCluster.units;
            }
        }
        font.pixelSize: 36
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            top: inactiveArc.verticalCenter // Changed anchor
            horizontalCenter: inactiveArc.horizontalCenter
            topMargin: 10 // Changed margin
        }
        font.weight: Font.Medium
        font.family: Config.fontStye
    }

    Text {
        id: gaugeLabel
        width: 150
        height: 18
        color: "#ffffff"
        text: xsGaugeCluster.gaugeTitle
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            bottom: gaugeValue.top // Changed anchor
            horizontalCenter: inactiveArc.horizontalCenter
        }
        font.weight: Font.Medium
        font.family: Config.fontStye
    }
}
