import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import "../Util"
import Mercury

Item {
    id: speedometer
    width: 460
    height: 460

    // gauge properties
    property int minValue: 0
    property int maxValue: 160
    property string units: "KM/H"
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

    property var numberPositions: [ //TODO: automate this so we do not need to manually place
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
        
        Component {
            id: tickMark
            Rectangle {
                width: 5
                height: 10
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

        // property var tickPositions: [ //TODO: automate this so we do not need to manually place
        //     [71,377,45, true], // 1, 0
        //     [34,328,61.875, false], // 2, 10
        //     [12,268,78.75, true], // 3, 20
        //     [10,204,95.625, false], // 4, 30
        //     [25,142,112.5, true], // 5, 40
        //     [58,87,129.375, false], // 6, 50
        //     [105,44,146.25, true], // 7, 60
        //     [163,16,163.125, false], // 8, 70
        //     [230,6,180, true], // 9, 80
        //     [292,16,196.875, false], // 10, 90
        //     [350,44,213.75, true], // 11, 100
        //     [398,87,230.625, false], // 12, 110
        //     [430,142,247.5, true], // 13, 120
        //     [445,204,264.375, false], // 14, 130
        //     [443,268,281.25, true], // 15, 140
        //     [422,328,298.125, false], // 16, 150
        //     [384,377,315, true] // 17, 160
        // ]

        property var tickPositions: {
            let positions = [];
            const arcAngle = outerArc.begin - outerArc.end;
            const needleRadius = (outerArc.width - outerArc.arcWidth) / 2;
            
            // const centerY = ; // Approximate center Y
            const radius = ( inactiveArc.width - (2 * inactiveArc.arcWidth)) / 2; 
            
            // Create 17 ticks distributed around 270 degrees
            const totalTicks = 17;
            
            for (let i = 0; i < totalTicks; i++) {
                const angle = (outerArc.begin + (i / (totalTicks - 1)) * arcAngle);
                const x = (outerArc.width / 2) + Math.cos(gaugeAnimation.degreesToRadians(angle)) * needleRadius - width / 2;
                const y = (outerArc.height / 2) + Math.sin(gaugeAnimation.degreesToRadians(angle)) * needleRadius - height / 2;
                const tickRotation = i / (totalTicks - 1) * arcAngle + 45;
                const isWhite = i % 2 === 0;
                
                positions.push([x, y, tickRotation, isWhite]);
            }
            
            return positions;
        }
        
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
