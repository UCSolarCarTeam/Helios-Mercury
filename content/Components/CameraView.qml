import QtQuick
import QtMultimedia

Item {
    id: cameraView
    width: 426
    height: 213

    property bool isRecording: false

    Camera{
        id: camera
    }

    Rectangle{
        id: cameraFrame
        x: 0
        y: 0
        anchors.fill: parent
        radius: 16
        color: "#d9d9d9"

        MediaDevices {
            id: mediaDevices
            onVideoInputsChanged: {
                if (mediaDevices.videoInputs.length > 0) {
                    console.log("Webcam is available");
                } else {
                    console.log("No webcam found");
                    currentCamera.cameraDevice = mediaDevices.defaultVideoInput
                }
            }
        }

        CaptureSession {
            id: captureSession
            recorder: recorder
            camera: Camera {
                id: currentCamera
                active: true
            }
            videoOutput: videoOutput
        }
        VideoOutput {
            id: videoOutput
            anchors.fill: parent
        }
    }
}
