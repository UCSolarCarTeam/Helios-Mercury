import QtQuick 2.15
import QtQuick.Controls 2.15
import Mercury
import QtQuick.Effects

Item {
    id: dashIcon
    width: 32
    height: 32

    property string imageSource: ""
    property bool isOn: false
    property bool isHighContrast: false
    property color iconMaskColor: parent.isOn ? (parent.isHighContrast ? Config.highContrast : Config.primary) : Config.btnDisabled
    
    Image {
        id: staticImage
        anchors.fill: parent
        source: parent.imageSource
        smooth: true
        visible: true 
    }

    Rectangle {
        id: staticFill
        width: parent.width
        height: parent.height
        anchors.bottom: parent.bottom
        color: parent.iconMaskColor 
        visible: false
    }

    ShaderEffectSource {
        id: staticMask
        sourceItem: staticImage
    }

    ShaderEffectSource {
        id: staticFillSource
        sourceItem: staticFill
    }

    MultiEffect {
        anchors.fill: parent
        source: staticFillSource
        maskSource: staticMask
        maskEnabled: true
        maskThresholdMin: 0.0
        maskThresholdMax: 1.0
        maskSpreadAtMin: 0.0
        maskSpreadAtMax: 0.0
        maskInverted: false
    }
}
