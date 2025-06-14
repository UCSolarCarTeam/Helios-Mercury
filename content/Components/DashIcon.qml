import QtQuick 6.2
import QtQuick.Controls 2.15
import QtQuick.Effects
import Mercury

Item {
    id: dashIcon
    width: 32
    height: 32
    smooth: true

    property real visibleFraction: 1.0 // fraction of image visible (0..1)
    property string imageSource: ""
    property color iconMaskColor
    property int aspectRatioWidth: 32
    property int aspectRatioHeight: 32

    Item {
        id: clipper
        width: dashIcon.width
        height: dashIcon.height * visibleFraction
        anchors.top: parent.top
        clip: true

        MultiEffect {
            anchors.top: parent.top
            width: dashIcon.width
            height: dashIcon.height
            source: ShaderEffectSource {
                sourceItem: Image {
                    id: iconImage
                    width: dashIcon.width
                    height: dashIcon.height
                    source: imageSource
                    sourceSize: Qt.size(aspectRatioWidth, aspectRatioHeight)
                    smooth: true
                }
                hideSource: true
                live: true
                width: dashIcon.width
                height: dashIcon.height
            }

            colorization: 1.0
            colorizationColor: iconMaskColor
            antialiasing: true
            layer.enabled: true
            layer.smooth: true
        }
    }
}