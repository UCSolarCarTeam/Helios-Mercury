import QtQuick 2.15
import QtQuick.Controls 2.15
import Mercury
import QtQuick.Effects

Item {
    id: dashIcon
    width: 32
    height: 32
    smooth: true

    property string imageSource: ""
    property bool isOn: false
    property bool isHighContrast: false
    property color iconMaskColor: dashIcon.isOn ? (dashIcon.isHighContrast ? Config.highContrast : Config.primary) : Config.btnDisabled

    Image {
        id: staticImage
        anchors.fill: parent
        source: parent.imageSource
        smooth: true
        visible: true
        antialiasing: true
        layer.smooth: true
    }

    MultiEffect {
        anchors.fill: parent
        source: staticImage
        colorization: 1.0 
        colorizationColor: iconMaskColor 
        layer.smooth: true
    }
}
