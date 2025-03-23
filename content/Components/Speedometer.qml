import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import "../Util"
import Mercury

Item {
    id: speedometer
    width: 480
    height: 460

    // gauge properties
    property int minValue: 0
    property int maxValue: 160
    property string units: "KMH"
    property int value: Math.round(Config.rpmValue * (Math.PI * Config.wheelDiameter) * 60 / 1000)

    // animation properties 
    property int animationDuration: 300

    // canvas properties
    property int arcEnd: 405
    property int arcBegin: 135
    property real arcWidth: 16 

    GaugeAnimation { id: gaugeAnimation }

    ArcItem { 
        id: outerArc
        width: 460
        height: 460
        strokeWidth: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: Config.outerArcColor
        end: -135
        begin: 135
        arcWidth: 16
        antialiasing: true
    }

    ArcItem {
        id: inactiveArc
        width: 428
        height: 428
        anchors.centerIn: outerArc
        strokeWidth: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: Config.btnDisabled
        end: -135
        begin: 135
        arcWidth: 16
        antialiasing: true
    }

    Component {
        id: numberLabel
        Text {
            width: 50
            height: Config.gaugeFontSizeM
            color: Config.fontColor
            font.pixelSize: Config.gaugeFontSizeM
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Medium
            font.family: Config.fontStyle
        }
    }

    property var markerPositions: [
        {x: 91, y: 340, value: "0"},
        {x: 43, y: 246, value: "20"},
        {x: 52, y: 150, value: "40"},
        {x: 121, y: 69, value: "60"},
        {x: 217, y: 37, value: "80"},
        {x: 298, y: 74, value: "100"},
        {x: 361, y: 150, value: "120"},
        {x: 370, y: 252, value: "140"},
        {x: 318, y: 340, value: "160"}
    ]

    Component.onCompleted: {
        for (var i = 0; i < markerPositions.length; i++) {
            var label = numberLabel.createObject(speedometer);
            label.text = qsTr(markerPositions[i].value);
            label.anchors.left = speedometer.left;
            label.anchors.top = speedometer.top;
            label.anchors.leftMargin = markerPositions[i].x;
            label.anchors.topMargin = markerPositions[i].y;
        }
    }

    Item {
        id: incrementDashes
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: parent.bottom
            leftMargin: 9
            rightMargin: 8
            topMargin: 7
            bottomMargin: 74
        }
        
        Component {
            id: tickMark
            Rectangle {
                width: isWhite ? 5 : 4
                height: 9
                color: isWhite ? Config.speedometerWhiteTicks : Config.speedometerGrayTicks
                
                property bool isWhite: false
                property int posX: 0
                property int posY: 0
                property real tickRotation: 0
                
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: posX
                anchors.topMargin: posY
                rotation: tickRotation
            }
        }
        
        property var tickData: [
            [62, 370, 45, true], // 0
            [24, 317, 61.875, false], // 1
            [3, 256, 78.75, true], // 2
            [2, 192, 95.625, false], // 3
            [19, 129, 112.5, true], // 4
            [54, 75, 129.375, false], // 5
            [101, 34, 146.25, true], // 6
            [159, 9, 163.125, false], // 7
            [222, 0, 0, true], // 8
            [287, 11, 16.875, false], // 9
            [343, 39, 33.75, true], // 10
            [389, 83, 50.625, false], // 11
            [420, 137, 67.5, true], // 12
            [436, 200, 84.375, false], // 13
            [431, 264, 101.25, true], // 14
            [410, 322, 118.125, false], // 15
            [375, 370, 135, true] // 16
        ]
        
        Component.onCompleted: {
            for (var i = 0; i < tickData.length; i++) {
                var data = tickData[i];
                var tick = tickMark.createObject(incrementDashes, {
                    posX: data[0],
                    posY: data[1],
                    tickRotation: data[2],
                    isWhite: data[3]
                });
            }
        }
    }

    Item {
        id: activeArcContainer
        anchors.fill: inactiveArc
        property real animatedValue: speedometer.minValue

        Behavior on animatedValue { NumberAnimation { duration: speedometer.animationDuration } }

        Connections {
            target: speedometer
            function onValueChanged() { activeArcContainer.animatedValue = gaugeAnimation.clamp(speedometer.value, speedometer.minValue, speedometer.maxValue); }
        }

        Component.onCompleted: { animatedValue = gaugeAnimation.clamp(speedometer.value, speedometer.minValue, speedometer.maxValue); }

        Canvas {
            id: activeArc
            anchors.fill: parent
            onPaint: { gaugeAnimation.drawGauge(activeArc, speedometer, activeArcContainer.animatedValue, 92, undefined); }
            Connections {
                target: activeArcContainer
                function onAnimatedValueChanged() { activeArc.requestPaint(); }
            }
        }
    }

    ArcItem {
        id: innerArc
        width: 245
        height: 245
        anchors.centerIn: inactiveArc
        strokeWidth: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: Config.btnDisabled
        end: -135
        begin: 135
        arcWidth: 9
        antialiasing: true
    }

    Text {
        id: speedometerValue
        width: 70
        height: Config.gaugeFontSizeXXL
        color: Config.fontColor
        text: speedometer.value
        font.pixelSize: Config.gaugeFontSizeXXL
        font.family: Config.fontStyle
        font.weight: Font.Medium
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            bottom: innerArc.verticalCenter
            bottomMargin: -20
            horizontalCenter: innerArc.horizontalCenter
        }
    }

    Text {
        id: speedometerUnits
        width: 70
        height: Config.gaugeFontSizeM
        text: speedometer.units
        color: Config.fontColor
        font.pixelSize: Config.gaugeFontSizeM
        font.family: Config.fontStyle
        font.weight: Font.Medium
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            top: speedometerValue.bottom
            horizontalCenter: innerArc.horizontalCenter
        }
    }
}
