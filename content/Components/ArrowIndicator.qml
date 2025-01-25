import QtQuick 2.0
import QtQuick.Studio.Effects

Item {
    id: _item
    width: 128
    height: 64

    // Rectangle {
    //     id: effectItem
    //     layer.enabled: true
    //     // visible: false
    //     anchors.fill: parent
    //     color: "lightgrey"
    //     radius: 16
    //     Text {
    //         text: "Hello world"
    //         font.pointSize: 16
    //         anchors.centerIn: parent
    //     }
    // }

    Image {
        anchors.fill: parent
        id: effectItem
        source: "../Images/Arrow.png"
    }



    // Image {
    //     width: 128
    //     height: 128
    //     id: sourceItem
    //     source: "../Images/Arrow.png"
    //     visible: false
    //     rotation: 90
    // }

    // Rectangle{
    //     id: rect12
    //     width: 128
    //     height: 128
    //     visible: false
    //     //color: "red"
    // }

    // OpacityMaskEffect {
    //     anchors.fill: rect12
    //     id: opacityMas
    //     source: rect12
    //     maskSource: sourceItem
    //     //invert: true
    // }

    ShaderEffect {
        anchors.fill: parent
        property variant source: effectItem
        fragmentShader: "qrc:/content/shader.frag.qsb"
        property real u_time: 0.0
        property color baseColor: "blue"
        property color underlyingColor: "red"

        Timer {
            interval: 16 // roughly 60 FPS
            running: true
            repeat: true
            onTriggered: {
                parent.u_time += interval / 1000.0; // increment time in seconds
            }
        }
    }
}
