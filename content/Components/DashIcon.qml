import QtQuick 6.2
import QtQuick.Controls 2.15
import QtQuick.Effects

Item {
    id: dashIcon
    width: 32
    height: 32
    smooth: true

    property string imageSource: "" //IMPORTANT: Image must be solid white
    property color iconMaskColor

    Image {
        id: staticImage
        anchors.fill: parent
        source: parent.imageSource
        sourceSize: Qt.size(64, 64)
        smooth: true
        visible: false
    }

    MultiEffect {
        id: fillEffect
        anchors.fill: parent
        source: staticImage
        colorization: 1.0 
        colorizationColor: dashIcon.iconMaskColor 
        antialiasing: true
        layer.enabled: true
        layer.smooth: true
    }
}
