import QtQuick 2.0
import QtQuick.Studio.Effects
import Mercury

Item {
    id: arrowIndicator
    width: 32
    height: 32
    rotation: isRight ? 0 : 180

    property bool isOn: true
    property bool isRight: true

    //Reset animation position whenever toggled
    onIsOnChanged: {
        movingColorEffect.u_time = 0.0;
    }

    Image {
        anchors.fill: parent
        id: arrowImg
        source: "../Images/Arrow.png"
    }

    //Moving color effect on indicator arrow image
    ShaderEffect {
        id: movingColorEffect
        anchors.fill: parent
        property variant source: arrowImg
        fragmentShader: "qrc:/content/Shaders/MovingColor.frag.qsb"
        property real u_time: 0.0
        property color baseColor: Config.btnDisabled
        property color movingColor: Config.primary

        Timer {
            interval: 16
            running: arrowIndicator.isOn
            repeat: true
            onTriggered: {
                parent.u_time += interval / 1000.0;
            }
        }
    }
}
