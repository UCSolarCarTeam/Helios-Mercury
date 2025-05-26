import QtQuick
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import Mercury
import "../Util"

Item {
    id: rpmGauge
    width: 200
    width: Config.windowHeight

    // gauge properties 
    property real minValue 
    property real maxValue
    property real value 
    property bool flipped: true

    // animation properties 
    property int animationDuration: 300

    // canvas arc properties 
    property real arcBegin: flipped ? 405 : 135
    property real arcEnd: flipped ? 315 : 225 
    property real arcWidth: 20

    GaugeAnimation { id: gaugeAnimation }

    ArcItem {
        id: outerArc
        width: 590
        height: 590
        anchors {
            verticalCenter: rpmGauge.verticalCenter
            left: flipped ? undefined : rpmGauge.left
            leftMargin: flipped ? undefined : 45
            right: flipped ? rpmGauge.right : undefined
            rightMargin: flipped ? 45 : undefined
        }
        strokeWidth: 0 
        strokeColor: "transparent"
        outlineArc: true
        fillColor: Config.outerArcColor
        end: flipped ? 45 : -45
        begin: flipped ? 135 : -135
        arcWidth: 2
        antialiasing: true
    }

    ArcItem {
        id: inactiveArc
        width: 580
        height: 580
        anchors {
            verticalCenter: rpmGauge.verticalCenter
            left: flipped ? undefined : outerArc.left
            leftMargin: flipped ? undefined : 5
            right: flipped ? outerArc.right : undefined
            rightMargin: flipped ? 5 : undefined
        }
        strokeWidth: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: Config.btnDisabled
        end: flipped ? 45 : -45
        begin: flipped ? 135 : -135
        arcWidth: 20
        antialiasing: true
    }

    Item {
        id: activeArcContainer
        anchors.fill: inactiveArc
        property real animatedValue: rpmGauge.minValue

        Behavior on animatedValue { NumberAnimation { duration: rpmGauge.animationDuration } }

        Connections {
            target: rpmGauge
            function onValueChanged() { activeArcContainer.animatedValue = gaugeAnimation.clamp(rpmGauge.value, rpmGauge.minValue, rpmGauge.maxValue); }
        }

        Component.onCompleted: { animatedValue = gaugeAnimation.clamp(rpmGauge.value, rpmGauge.minValue, rpmGauge.maxValue); }

        Canvas {
            id: activeArc
            anchors.fill: parent
            onPaint: { gaugeAnimation.drawGauge(activeArc, rpmGauge, activeArcContainer.animatedValue, 50, undefined, flipped); }
            Connections {
                target: activeArcContainer
                function onAnimatedValueChanged() { activeArc.requestPaint(); }
            }
        }
    }
    
    Text {
        id: label6
        height: Config.fontSize9
        width: 50
        color: Config.fontColor
        text: "1500"
        font.pixelSize: Config.fontSize9
        anchors {
            bottom: rpmGauge.verticalCenter
            bottomMargin: 175
            left: flipped ? undefined : rpmGauge.left
            leftMargin: flipped ? undefined : -5
            right: flipped ? rpmGauge.right : undefined
            rightMargin: flipped ? 30 : undefined
        }
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: Config.fontStyle
        font.weight: Font.Medium
    }

    Text {
        id: label5
        height: Config.fontSize9
        width: 50
        color: Config.fontColor
        text: "1250"
        font.pixelSize: Config.fontSize9
        anchors {
            bottom: rpmGauge.verticalCenter
            bottomMargin: 115
            left: flipped ? undefined : rpmGauge.left
            leftMargin: flipped ? undefined : -40
            right: flipped ? rpmGauge.right : undefined
            rightMargin: flipped ? -5 : undefined
        }
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: Config.fontStyle
        font.weight: Font.Medium
    }

    Text {
        id: label4
        height: Config.fontSize9
        width: 50
        color: Config.fontColor
        text: "1000"
        font.pixelSize: Config.fontSize9
        anchors {
            bottom: rpmGauge.verticalCenter
            bottomMargin: 50
            left: flipped ? undefined : rpmGauge.left
            leftMargin: flipped ? undefined : -60
            right: flipped ? rpmGauge.right : undefined
            rightMargin: flipped ? -30 : undefined
        }
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: Config.fontStyle
        font.weight: Font.Medium
    }

    Text {
        id: label3
        height: Config.fontSize9
        width: 30
        color: Config.fontColor
        text: "750"
        font.pixelSize: Config.fontSize9
        anchors {
            verticalCenter: rpmGauge.verticalCenter
            left: flipped ? undefined : rpmGauge.left
            leftMargin: flipped ? undefined : -45
            right: flipped ? rpmGauge.right : undefined
            rightMargin: flipped ? -20 : undefined
        }
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: Config.fontStyle
        font.weight: Font.Medium
    }

    Text {
        id: label2
        height: Config.fontSize9
        width: 30
        color: Config.fontColor
        text: "500"
        font.pixelSize: Config.fontSize9
        anchors {
            top: rpmGauge.verticalCenter
            topMargin: 50
            left: flipped ? undefined : rpmGauge.left
            leftMargin: flipped ? undefined : -35
            right: flipped ? rpmGauge.right : undefined
            rightMargin: flipped ? -10 : undefined
        }
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: Config.fontStyle
        font.weight: Font.Medium
    }

    Text {
        id: label1
        height: Config.fontSize9
        width: 30
        color: Config.fontColor
        text: "250"
        font.pixelSize: Config.fontSize9
        anchors {
            top: rpmGauge.verticalCenter
            topMargin: 115
            left: flipped ? undefined : rpmGauge.left
            leftMargin: flipped ? undefined : -10
            right: flipped ? rpmGauge.right : undefined
            rightMargin: flipped ? 15 : undefined
        }
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: Config.fontStyle
        font.weight: Font.Medium
    }

    Text {
        id: label0
        height: Config.fontSize9
        width: 0
        color: Config.fontColor
        text: "0"
        font.pixelSize: Config.fontSize9
        anchors {
            top: rpmGauge.verticalCenter
            topMargin: 170
            left: flipped ? undefined : rpmGauge.left
            leftMargin: flipped ? undefined : 55
            right: flipped ? rpmGauge.right : undefined
            rightMargin: flipped ? 85 : undefined
        }
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: Config.fontStyle
        font.weight: Font.Medium
    }

    property var rpmLabelsData: [
        { targetLabel: label6 },
        { targetLabel: label5 },
        { targetLabel: label4 },
        { targetLabel: label3 },
        { targetLabel: label2 },
        { targetLabel: label1 },
        { targetLabel: label0 }
    ]

    Repeater {
        id: rpmLabelRepeater
        model: rpmLabelsData
        
        Text {
            id: rpmLabel
            height: Config.fontSize1
            width: 15
            color: Config.speedometerGrayTicks
            text: "RPM"
            font.pixelSize: Config.fontSize1
            anchors {
                bottom: modelData.targetLabel.bottom
                bottomMargin: 5
                left: modelData.targetLabel.right 
                leftMargin: 32
            }
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: Config.fontStyle
            font.weight: Font.Medium
        }
    }
}
