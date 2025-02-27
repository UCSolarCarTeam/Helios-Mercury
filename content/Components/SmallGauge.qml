import QtQuick
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import Mercury
import "../Util" 

Item {
    id: root
    width: 178
    height: 178

    property int minValue
    property int maxValue
    property string units
    property int value
    property string gaugeTitle

    property int animationDuration: 300

    property real arcEnd: 405
    property real arcBegin: 135
    property real arcWidth: 17

    property color needleColor: "#ff0000"
    property color outerArcColor: "#242627"

    Util { id: util }

    ArcItem {
        id: outerArc
        width: 178
        height: 178
        anchors {
            left: parent.left
            top: parent.top
        }
        strokeWidth: 0
        strokeStyle: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: outerArcColor
        end: -135
        begin: 135
        arcWidth: 1.78
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
        strokeStyle: 0
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
        property real animatedValue: root.minValue

        Behavior on animatedValue { NumberAnimation { duration: root.animationDuration } }

        Connections {
            target: root
            function onValueChanged() { activeArcContainer.animatedValue = util.clamp(root.value, root.minValue, root.maxValue); }
        }

        Component.onCompleted: { animatedValue = util.clamp(root.value, root.minValue, root.maxValue); }

        Canvas {
            id: activeArc
            anchors.fill: parent
            onPaint: { util.drawGauge(activeArc, root, activeArcContainer.animatedValue); }
            Connections {
                target: activeArcContainer
                function onAnimatedValueChanged() { activeArc.requestPaint(); }
            }
        }
    }

    Text {
        id: minVal
        width: 12
        height: 20
        color: "#ffffff"
        text: root.minValue
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        anchors {
            right: inactiveArc.horizontalCenter
            rightMargin: 35
            bottom: inactiveArc.bottom
            bottomMargin: 10
        }
        font.weight: Font.Medium
        font.family: "SF Pro"
    }

    Text {
        id: maxVal
        width: 37
        height: 20
        color: "#ffffff"
        text: root.maxValue
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        anchors {
            left: inactiveArc.horizontalCenter
            leftMargin: 15
            bottom: inactiveArc.bottom
            bottomMargin: 10
        }
        font.weight: Font.Medium
        font.family: "SF Pro"
    }

    Text {
        id: gaugeValue
        width: 149
        height: 24
        color: "#ffffff"
        text: root.value.toString() + " " + root.units
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            verticalCenter: inactiveArc.verticalCenter
            horizontalCenter: inactiveArc.horizontalCenter
        }
        font.pixelSize: 24
        wrapMode: Text.NoWrap
        font.weight: Font.Medium
        font.family: "SF Pro"
    }

    Text {
        id: gaugeLabel
        width: 147
        height: 14
        color: "#ffffff"
        text: root.gaugeTitle
        font.pixelSize: 14
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors {
            top: gaugeValue.bottom
            horizontalCenter: inactiveArc.horizontalCenter
            topMargin: 10
        }
        font.weight: Font.Medium
        font.family: "SF Pro"
    }

    Image {
        id: boltIcon
        width: 13.5
        height: 20
        anchors {
            bottom: gaugeValue.top
            horizontalCenter: inactiveArc.horizontalCenter
            bottomMargin: 20
        }
        source: "../Images/BoltIcon.png"
        visible: true
    }
}
