import QtQuick 2.15
import Mercury

Item {
    width: 32
    height: 32

    Column {
        spacing: 2

        DashIcon {
            id: statusImage
            width: 20
            height: 20
            anchors.horizontalCenter: parent.horizontalCenter
            imageSource: "../Images/ConnectionIcon.png"
            iconMaskColor: pi.IsTelemetryConnected ? Config.valueLow : Config.valueHigh
            sourceSize: Qt.size(24, 24)
        }

        Text {
            text: pi.Latency + " ms"
            font.pixelSize: Config.fontSize1
            font.family: Config.fontStyle
            color: pi.Latency < 0 || pi.Latency > 200 ? Config.valueHigh :
                    pi.Latency > 100 ? Config.valueModerate : Config.valueLow
        }
    }
}
