import QtQuick
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import Mercury

Item {
    id: root
    width: 269
    height: 235

    property int minValue
    property int maxValue
    property string units
    property int value
    property string gaugeTitle

    function degreesToRadians(degrees) {
        return degrees * (Math.PI / 180);
    }

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
        fillColor: "#242627"
        end: -179.28547
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
        end: -179.28547
        begin: 90
        arcWidth: 20
        antialiasing: true
    }

    Item {
        id: activeArcContainer
        anchors.fill: inactiveArc
        property real animatedValue: root.value
        property real clampedValue: Math.max(root.minValue, Math.min(root.maxValue, animatedValue))

        Behavior on animatedValue { NumberAnimation { duration: 300 } }

        Canvas {
            id: activeArc
            anchors.fill: parent

            onPaint: {
                var ctx = getContext("2d");
                ctx.reset();

                var arcEnd = 360;
                var arcBegin = 90;
                var arcWidth = 20;
                var arcRadius = width / 2;
                var valueRange = root.maxValue - root.minValue;

                var valueAngle = arcBegin - ((activeArcContainer.clampedValue - root.minValue) / valueRange) * (arcBegin - arcEnd);

                ctx.beginPath();
                ctx.lineWidth = arcWidth;
                ctx.strokeStyle = Config.primary;
                ctx.arc(
                    arcRadius,
                    arcRadius,
                    arcRadius - arcWidth/2,
                    degreesToRadians(arcBegin),
                    degreesToRadians(valueAngle),
                    false
                );

                ctx.stroke();
            }

            Connections {
                target: activeArcContainer
                function onClampedValueChanged() {
                    activeArc.requestPaint();
                }
            }
        }
    }

    Rectangle {
        id: needle
        width: 5
        height: 20
        color: "#ff0000"

        property real arcAngle: inactiveArc.begin - inactiveArc.end
        property real angle: getAngleForValue(root.value)
        property real needleRadius: (inactiveArc.width - inactiveArc.arcWidth) / 2
        property real animatedValue: activeArcContainer.animatedValue

        function getAngleForValue(val) {
            if (val < root.minValue) {
                return inactiveArc.begin;
            } else if (val > root.maxValue) {
                return inactiveArc.begin + arcAngle;
            } else {
                return inactiveArc.begin + (val / root.maxValue) * arcAngle;
            }
        }

        Connections {
            target: activeArcContainer
            function onAnimatedValueChanged() {
                needle.angle = needle.getAngleForValue(activeArcContainer.animatedValue);
            }
        }

        x: (outerArc.width / 2) + Math.cos(degreesToRadians(angle)) * needleRadius - width / 2
        y: (outerArc.height / 2) + Math.sin(degreesToRadians(angle)) * needleRadius - height / 2

        transformOrigin: Item.Center

        rotation: {
            var val = activeArcContainer.animatedValue;
            if (val < root.minValue) {
                return 0;
            } else if (val > root.maxValue) {
                return arcAngle;
            } else {
                return (val / root.maxValue) * arcAngle;
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
        font.family: "SF Pro"
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
        font.family: "SF Pro"
    }

    Text {
        id: gaugeValue
        width: 147
        height: 43
        color: "#ffffff"
        text: root.value.toString() + root.units
        font.pixelSize: 36
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors {
            bottom: inactiveArc.verticalCenter
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
}
