import QtQuick
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0

Item {
    id: root
    width: 269
    height: 219

    property int minValue
    property int maxValue
    property string units
    property int value
    property string gaugeTitle

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
        id: innerArc
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
        fillColor: "#00a8ff"
        end: -179.28547
        begin: 90
        arcWidth: 20.21227
        antialiasing: true
    }

    Rectangle {
        id: needle
        width: 5
        height: 19
        color: "#ffffff"

        property real arcAngle: innerArc.begin - innerArc.end
        property real angle: (innerArc.begin + (root.value / maxValue) * arcAngle)
        property real needleRadius: (innerArc.width - innerArc.arcWidth) / 2

        x: (outerArc.width / 2) + Math.cos(degreesToRadians(angle)) * needleRadius - width / 2
        y: (outerArc.height / 2) + Math.sin(degreesToRadians(angle)) * needleRadius - height / 2

        Behavior on angle { NumberAnimation { duration: 300 } }
        Behavior on rotation { NumberAnimation { duration: 300 } }

        function degreesToRadians(degrees) {
            return degrees * (Math.PI / 180);
        }

        transformOrigin: Item.Center
        rotation: root.value / maxValue * arcAngle
    }

    Text {
        id: minVal
        width: 16
        height: 19
        color: "#ffffff"
        text: root.minValue
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        anchors.leftMargin: 86
        anchors.topMargin: 214
        font.weight: Font.Medium
        font.family: "SF Pro"
    }

    Text {
        id: maxVal
        width: 57
        height: 31
        color: "#ffffff"
        text: root.maxValue
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        anchors.leftMargin: 213
        anchors.topMargin: 69
        font.weight: Font.Medium
        font.family: "SF Pro"
    }

    Text {
        id: dataValue
        width: 147
        height: 43
        color: "#ffffff"
        text: root.value.toString() + root.units
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 36
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        anchors.leftMargin: 33
        anchors.topMargin: 63
        font.weight: Font.Medium
        font.family: "SF Pro"
    }

    Text {
        id: textLabel
        width: 147
        height: 17
        color: "#ffffff"
        text: root.gaugeTitle
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 14
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        anchors.leftMargin: 33
        anchors.topMargin: 108
        font.weight: Font.Medium
        font.family: "SF Pro"
    }
}
