import QtQuick 2.15
import QtQuick.Controls 2.15
import Mercury
import QtQuick.Effects

Item {
    id: dashIcon
    width: 32
    height: 32
    smooth: true

    property string imageSource: "" //IMPORTANT: Image must be solid white
    property bool isOn: false
    property bool isHighContrast: false
    property color iconMaskColor: dashIcon.isOn ? (dashIcon.isHighContrast ? Config.highContrast : Config.primary) : Config.btnDisabled

    Image {
        id: staticImage
        anchors.fill: parent
        source: parent.imageSource
        sourceSize: Qt.size(64, 64)
        smooth: true
        visible: false
    }

    MultiEffect {
        anchors.fill: parent
        source: staticImage
        colorization: 1.0 
        colorizationColor: iconMaskColor 
        antialiasing: true
        layer.enabled: true
        layer.smooth: true
    }
}
