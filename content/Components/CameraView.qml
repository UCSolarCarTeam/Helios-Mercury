import QtQuick
import QtMultimedia
import Mercury

Item {
    id: cameraView
    width: 425
    height: 215

    Rectangle{
        id: cameraFrame
        anchors.fill: parent
        radius: 16
        color: Config.btnDisabled

        transform:  Rotation { // TEMP FIX - find more elegant solution
            origin.x: width / 2
            axis { x: 0; y: 1; z: 0 }
            angle: 180
        }

        MediaDevices {
            id: mediaDevices
            onVideoInputsChanged: {
                if (mediaDevices.videoInputs.length > 0) {
                    console.log("Webcam is available");
                } else {
                    console.log("No webcam found");
                }
            }
        }

        Camera{
            id: camera
            active: true
        }

        CaptureSession {
            id: captureSession
            camera: camera
            videoOutput: videoOutput
        }

        VideoOutput {
            id: videoOutput
            anchors.fill: parent
            fillMode: VideoOutput.PreserveAspectCrop
        }
    }
}
