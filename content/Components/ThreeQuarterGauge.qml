import QtQuick
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import Mercury
import "../Util"

Item {
    id: root
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
        anchors.left: parent.left
        anchors.top: parent.top
        strokeWidth: 0
        strokeStyle: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: Config.outerArcColor
        end: -180
        begin: 90
        arcWidth: 1.78
        antialiasing: true
    }

    ArcItem {
        id: inactiveArc
        width: 202
        height: 202
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 5
        anchors.topMargin: 5
        strokeWidth: 0
        strokeStyle: 0
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
        property real animatedValue: root.minValue

        Behavior on animatedValue { NumberAnimation { duration: root.animationDuration } }

        Connections {
            target: root
            function onValueChanged() { activeArcContainer.animatedValue = gaugeAnimation.clamp(root.value, root.minValue, root.maxValue); }
        }

        Component.onCompleted: { animatedValue = gaugeAnimation.clamp(root.value, root.minValue, root.maxValue); } 

        Canvas {
            id: activeArc
            anchors.fill: parent
            onPaint: { gaugeAnimation.drawGauge(activeArc, root, activeArcContainer.animatedValue); } 
            Connections {
                target: activeArcContainer
                function onAnimatedValueChanged() { activeArc.requestPaint(); }
            }
        }
    }

    Text {
        id: minVal
        width: 16
        height: 24
        color: "#ffffff"
        text: root.minValue
        font.pixelSize: 24
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors {
            right: outerArc.horizontalCenter
            top: outerArc.bottom
        }
        font.weight: Font.Medium
        font.family: Config.fontStye
    }

    Text {
        id: maxVal
        width: 50
        height: 24
        color: "#ffffff"
        text: root.maxValue
        font.pixelSize: 24
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors {
            bottom: outerArc.verticalCenter
            left: outerArc.right
        }

        font.weight: Font.Medium
        font.family: Config.fontStye
    }

    Text {
        id: gaugeValue
        width: 147
        height: 43
        color: "#ffffff"
        text: {
            if (Math.floor(root.value) === root.value) {
                return Math.floor(root.value) + root.units;
            } else {
                    return root.value.toFixed(1) + root.units;
            }
        }
        font.pixelSize: 36
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors {
            bottom: inactiveArc.verticalCenter
            horizontalCenter: inactiveArc.horizontalCenter
        }
        font.weight: Font.Medium
        font.family: Config.fontStye
    }

    Text {
        id: gaugeLabel
        width: 147
        height: 17
        color: "#ffffff"
        text: root.gaugeTitle
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors {
            top: gaugeValue.bottom
            horizontalCenter: inactiveArc.horizontalCenter
        }
        font.weight: Font.Medium
        font.family: Config.fontStye
    }
}