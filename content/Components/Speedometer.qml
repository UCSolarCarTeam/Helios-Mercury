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

    Item {
        id: activeArcContainer
        z: 2
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

    property var numberPositions: [
        {x: 95, y: 341, value: "0"},
        {x: 47, y: 249, value: "20"},
        {x: 56, y: 147, value: "40"},
        {x: 122, y: 69, value: "60"},
        {x: 216, y: 39, value: "80"},
        {x: 302, y: 69, value: "100"},
        {x: 363, y: 147, value: "120"},
        {x: 372, y: 249, value: "140"},
        {x: 322, y: 341, value: "160"}
    ]

    Component.onCompleted: {
        for (var i = 0; i < numberPositions.length; i++) {
            var label = numberLabel.createObject(speedometer);
            label.text = qsTr(numberPositions[i].value);
            label.anchors.left = speedometer.left;
            label.anchors.top = speedometer.top;
            label.anchors.leftMargin = numberPositions[i].x;
            label.anchors.topMargin = numberPositions[i].y;
            label.z = 1;
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
        
        property var tickPositions: [
            [62, 370, 45, true], // 1, 0
            [26, 321, 61.875, false], // 2, 10
            [4, 261, 78.75, true], // 3, 20
            [1, 197, 95.625, false], // 4, 30
            [17, 135, 112.5, true], // 5, 40
            [50, 80, 129.375, false], // 6, 50
            [97, 37, 146.25, true], // 7, 60
            [155, 9, 163.125, false], // 8, 70
            [218, 0, 0, true], // 9, 80
            [282, 9, 16.875, false], // 10, 90
            [340, 37, 33.75, true], // 11, 100
            [388, 80, 50.625, false], // 12, 110
            [420, 135, 67.5, true], // 13, 120
            [437, 197, 84.375, false], // 14, 130
            [433, 261, 101.25, true], // 15, 140
            [412, 321, 118.125, false], // 16, 150
            [375, 370, 135, true] // 17, 160
        ]
        
        Component.onCompleted: {
            for (var i = 0; i < tickPositions.length; i++) {
                var data = tickPositions[i];
                var tick = tickMark.createObject(incrementDashes, {
                    posX: data[0],
                    posY: data[1],
                    tickRotation: data[2],
                    isWhite: data[3]
                });
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
