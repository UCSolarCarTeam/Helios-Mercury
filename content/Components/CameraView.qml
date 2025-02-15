import QtQuick
import QtMultimedia

Item {
    id: root
    width: 426
    height: 213

    Camera{
        id: camera
    }

    Rectangle{
        id: cameraView
        x: 0
        y: 0
        width: 426
        height: 213
        radius: 16
        color: "#d9d9d9"

        VideoOutput {
            id: videoOutput
            anchors.fill: parent
            source: camera
            autoOrientation: true
            fillMode: VideoOutput.PreserveAspectCrop
        }
    }

    Component.onCompleted: {
        camera.start()
    }


}
