import QtQuick
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import Mercury

Item {
    id: root
    width: 269
    height: 235

    // gauge properties
    property int minValue
    property int maxValue
    property string units
    property int value
    property string gaugeTitle

    // animation properties
    property int animationDuration: 300

    // canvas arc properties
    property real arcEnd: 360
    property real arcBegin: 90
    property real arcWidth: 20

    // colors
    property color needleColor: "#ff0000"
    property color outerArcColor: "#242627"

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
        fillColor: outerArcColor
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
        property real animatedValue: root.value
        property real clampedValue: Math.max(root.minValue, Math.min(root.maxValue, animatedValue))

        Behavior on animatedValue { NumberAnimation { duration: animationDuration } }

        Canvas {
            id: activeArc
            anchors.fill: parent

            onPaint: {
                var ctx = getContext("2d");
                ctx.reset();

                var arcRadius = width / 2;
                var valueRange = root.maxValue - root.minValue;

                var valueAngle = arcBegin - ((activeArcContainer.clampedValue - root.minValue) / valueRange) * (arcBegin - arcEnd);

                ctx.beginPath();
                ctx.lineWidth = arcWidth;
                ctx.strokeStyle = Config.primary;
                ctx.arc(
                    arcRadius,
                    arcRadius,
                    arcRadius - arcWidth / 2,
                    degreesToRadians(arcBegin),
                    degreesToRadians(valueAngle),
                    false
                );

                ctx.stroke();

                ctx.beginPath();
                ctx.lineWidth = arcWidth;
                ctx.strokeStyle = needleColor;
                ctx.arc(
                    arcRadius,
                    arcRadius,
                    arcRadius - arcWidth / 2,
                    degreesToRadians(valueAngle - 3),
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
