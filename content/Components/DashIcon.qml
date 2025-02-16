import QtQuick 2.15
import QtQuick.Controls 2.15
import Mercury

Item {
    id: dashIcon
    width: 32
    height: 32

    property string imageSource: ""
    property bool isOn: false

    Image {
        id: iconImg
        source: parent.imageSource
        anchors.fill: parent
    }

    ShaderEffect {
        id: movingColorEffect
        anchors.fill: parent
        property variant source: iconImg
        fragmentShader: "qrc:/content/Shaders/ColorOverlay.frag.qsb"
        property color overlayColor: parent.isOn ? Config.primary : Config.btnDisabled
    }
}
