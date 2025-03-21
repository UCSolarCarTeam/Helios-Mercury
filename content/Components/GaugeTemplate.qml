import QtQuick
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import Mercury
import "../Util"

Item {
    id: gaugeTemplate

    // gauge properties
    property int gaugeSize
    property real minValue
    property real maxValue
    property string units
    property real value
    property string gaugeTitle
    property real arcWidth: Math.round(gaugeSize / 10.5)
    property int gaugeInnerDiameter: Math.round(gaugeSize / 1.05) - ( 2 * arcWidth )

    // icon properties
    property string icon
    property int iconWidth
    property int iconHeight

    // animation properties
    property int animationDuration: 300

    // canvas arc properties
    property real arcEnd: 405
    property real arcBegin: 135

    width: gaugeSize
    height: gaugeSize

    GaugeAnimation { id: gaugeAnimation }

    ArcItem {
        id: outerArc
        width: gaugeSize
        height: gaugeSize
        strokeWidth: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: Config.outerArcColor
        end: -135
        begin: 135
        arcWidth: 2
        antialiasing: true
    }

    ArcItem {
        id: inactiveArc
        width: Math.round(gaugeTemplate.gaugeSize / 1.05)
        height: Math.round(gaugeTemplate.gaugeSize / 1.05)
        anchors.centerIn: parent
        strokeWidth: 0
        strokeColor: "transparent"
        outlineArc: true
        fillColor: Config.btnDisabled
        end: -135
        begin: 135
        arcWidth: gaugeTemplate.arcWidth
        antialiasing: true
    }

    Item {
        id: activeArcContainer
        anchors.fill: inactiveArc
        property real animatedValue: gaugeTemplate.minValue

        Behavior on animatedValue { NumberAnimation { duration: gaugeTemplate.animationDuration } }

        Connections {
            target: gaugeTemplate
            function onValueChanged() { activeArcContainer.animatedValue = gaugeAnimation.clamp(gaugeTemplate.value, gaugeTemplate.minValue, gaugeTemplate.maxValue); }
        }

        Component.onCompleted: { animatedValue = gaugeAnimation.clamp(gaugeTemplate.value, gaugeTemplate.minValue, gaugeTemplate.maxValue); }

        Canvas {
            id: activeArc
            anchors.fill: parent
            onPaint: { gaugeAnimation.drawGauge(activeArc, gaugeTemplate, activeArcContainer.animatedValue); }
            Connections {
                target: activeArcContainer
                function onAnimatedValueChanged() { activeArc.requestPaint(); }
            }
        }
    }

    Text {
        id: minVal
        width: 15
        color: Config.fontColor
        text: gaugeTemplate.minValue
        font.pixelSize: Config[gaugeAnimation.getFontSizes(gaugeSize).m]
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            right: inactiveArc.horizontalCenter
            rightMargin: gaugeTemplate.gaugeSize / 4 - minVal.width
            bottom: inactiveArc.bottom
            bottomMargin: gaugeTemplate.arcWidth * 0.9
        }
        font.weight: Font.Medium
        font.family: Config.fontStyle
    }

    Text {
        id: maxVal
        width: 35
        color: Config.fontColor
        text: gaugeTemplate.maxValue
        font.pixelSize: Config[gaugeAnimation.getFontSizes(gaugeSize).m]
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors {
            left: inactiveArc.horizontalCenter
            leftMargin: gaugeTemplate.gaugeSize / 4 - maxVal.width
            bottom: inactiveArc.bottom
            bottomMargin: gaugeTemplate.arcWidth * 0.9
        }
        font.weight: Font.Medium
        font.family: Config.fontStyle
    }

    Item {
        id: contentContainer
        width: gaugeTemplate.gaugeInnerDiameter
        height: gaugeTemplate.gaugeInnerDiameter 
        anchors.centerIn: gaugeTemplate
        
        property bool hasIcon: gaugeTemplate.icon !== ""

        property real contentHeight: iconHeight + Config[gaugeAnimation.getFontSizes(gaugeSize).l] + Config[gaugeAnimation.getFontSizes(gaugeSize).s]
        property int numberOfSpaces: hasIcon ? 4 : 3
        property real verticalSpacing: ( contentContainer.height - contentContainer.contentHeight - gaugeTemplate.arcWidth ) / contentContainer.numberOfSpaces
        
        Loader {
            id: iconLoader
            width: gaugeTemplate.iconWidth
            height: gaugeTemplate.iconHeight
            anchors {
                horizontalCenter: contentContainer.horizontalCenter
                top: contentContainer.top
                topMargin: contentContainer.verticalSpacing * 1.5
            }
            visible: contentContainer.hasIcon
            sourceComponent: contentContainer.hasIcon ? iconComponent : null
        }
                
        Text {
            id: gaugeValue
            width: parent.width
            color: Config.fontColor
            text: {
                if (Math.floor(gaugeTemplate.value) === gaugeTemplate.value) {
                    return Math.floor(gaugeTemplate.value) + gaugeTemplate.units;
                } else {
                    return gaugeTemplate.value.toFixed(1) + gaugeTemplate.units;
                }
            }
            font.pixelSize: Config[gaugeAnimation.getFontSizes(gaugeSize).l]
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors {
                horizontalCenter: contentContainer.horizontalCenter
                top: contentContainer.hasIcon ? iconLoader.bottom : contentContainer.top
                topMargin: contentContainer.hasIcon 
                    ? (contentContainer.verticalSpacing - Config[gaugeAnimation.getFontSizes(gaugeSize).l] / 2) 
                    : (contentContainer.height - Config[gaugeAnimation.getFontSizes(gaugeSize).l] - Config[gaugeAnimation.getFontSizes(gaugeSize).s] - contentContainer.verticalSpacing / 2) / 2
            }
            font.weight: Font.Medium
            font.family: Config.fontStyle
        }

        Text {
            id: gaugeLabel
            width: parent.width
            color: Config.fontColor
            text: gaugeTemplate.gaugeTitle
            font.pixelSize: Config[gaugeAnimation.getFontSizes(gaugeSize).s]
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors {
                horizontalCenter: contentContainer.horizontalCenter
                bottom: contentContainer.hasIcon ? contentContainer.bottom : undefined
                bottomMargin: contentContainer.hasIcon ? (contentContainer.verticalSpacing + Config[gaugeAnimation.getFontSizes(gaugeSize).l]) : 0
                top: contentContainer.hasIcon ? undefined : gaugeValue.bottom
                topMargin: contentContainer.hasIcon ? 0 : contentContainer.verticalSpacing / 2.3
            }
            font.weight: Font.Medium
            font.family: Config.fontStyle
        }
    }

    Component {
        id: iconComponent
        Image {
            width: gaugeTemplate.iconWidth
            height: gaugeTemplate.iconHeight
            source: "../Images/" + gaugeTemplate.icon
        }
    }
}
