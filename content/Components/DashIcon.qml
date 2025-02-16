import QtQuick 2.15
import QtQuick.Controls 2.15
import Mercury

Item {
    id: root
    width: 64
    height: 64

    // property bool isOn: true

    Image {
        id: iconImg
        source: "../Images/Headlights.png"
    }

    ShaderEffect {
        id: movingColorEffect
        anchors.fill: parent
        property variant source: iconImg
        fragmentShader: "qrc:/content/Shaders/ColorOverlay.frag.qsb"
        property color overlayColor: b3.HeadlightSignalIn ? Config.primary : Config.btnDisabled
    }
}
