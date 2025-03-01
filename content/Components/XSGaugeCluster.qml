import QtQuick
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import Mercury

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

    // canvas arc properties
    property real arcEnd: 90   // Adjusted for bottom quarter
    property real arcBegin: -90
    property real arcWidth: 20

    // colors
    property color outerArcColor: "#242627"

    ArcItem {
        id: outerArc
        width: 213
        height: 213
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom  // Positioning the arc at the bottom
        strokeWidth: 0
        strokeStyle: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: outerArcColor
        end: -90
        begin: 90
        arcWidth: 1.78
        antialiasing: true
    }

    ArcItem {
        id: inactiveArc
        width: 202
        height: 202
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        strokeWidth: 0
        strokeStyle: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: "#8A8D8F"  // Disabled arc color
        end: -90
        begin: 90
        arcWidth: 20
        antialiasing: true
    }

    Canvas {
        id: activeArc
        anchors.fill: inactiveArc
        onPaint: {
            var ctx = activeArc.getContext("2d");
            ctx.clearRect(0, 0, activeArc.width, activeArc.height);
            ctx.beginPath();
            var startAngle = Math.PI; // -90 degrees
            var endAngle = Math.PI * 2; // 90 degrees
            ctx.arc(outerArc.width / 2, outerArc.height, outerArc.width / 2, startAngle, endAngle);
            ctx.lineWidth = arcWidth;
            ctx.strokeStyle = "#FF0000";  // Needle color
            ctx.stroke();
        }
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
            top: inactiveArc.bottom
            horizontalCenter: inactiveArc.horizontalCenter
        }
        font.weight: Font.Medium
        font.family: "SF Pro"
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
        font.family: "SF Pro"
    }

    NumberAnimation on value {
        id: valueAnimation
        duration: 500
        easing.type: Easing.OutQuad
    }
}
