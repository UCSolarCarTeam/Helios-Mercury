import QtQuick 2.15
import QtQuick.Controls 2.15
import Mercury
import QtQuick.Effects

Item {
    id: dashIcon
    width: implicitWidth
    height: implicitWidth
    smooth: true

    property string imageSource: ""
    property bool isOn: false
    property bool isHighContrast: false
    property color iconMaskColor: dashIcon.isOn ? (dashIcon.isHighContrast ? Config.highContrast : Config.primary) : Config.btnDisabled

    Image {
        id: staticImage
        anchors.fill: parent
        source: parent.imageSource
        sourceSize: Qt.size(128, 128)
        smooth: true
        visible: true
    }

    MultiEffect {
        anchors.fill: parent
        source: staticImage
        colorization: 1.0 
        colorizationColor: iconMaskColor 
        antialiasing: true
        layer.enabled: true
        layer.smooth: true
        // blur: 0.2 
        // blurMax: 10
    }
}
