import QtQuick
import QtMultimedia

Item {
    id: root
    width: 426
    height: 213

    property bool isRecording: false

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


        MediaDevices {
                id: mediaDevices
                onVideoInputsChanged: {
                            if (mediaDevices.videoInputs.length > 0) {
                                // Optionally handle changes to the available video inputs here
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
                    //cameraDevice: mediaDevices.defaultVideoInput
                }
                videoOutput: videoOutput
            }
            VideoOutput {
                id: videoOutput
                anchors.fill: parent
                visible: true
            }
        }
}
