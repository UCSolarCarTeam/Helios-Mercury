import QtQuick
import QtQuick.Controls

Item {
    id: connectionStatusFrame
    width: 32
    height: 32

    property string connection: name
    property bool isConnected: false
    property bool isRadioBoard: false

    Image {
        id: connectionIcon
        anchors.fill: parent
        source: isRadioBoard
            ? (isConnected ? "../Images/RadioBoardConnected.png" : "../Images/RadioBoardDisconnected.png")
            : (isConnected ? "../Images/TelemetryConnected.png" : "../Images/TelemetryDisconnected.png")
    }
}
