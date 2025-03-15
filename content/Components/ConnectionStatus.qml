import QtQuick
import QtQuick.Controls
import Mercury

Item {
    id: connectionStatusFrame
    width: 32
    height: 32

    property string connection: name
    property bool isConnected: false
    property bool isRadioBoard: false

    Image {
        id: connectionIcon
        source: isRadioBoard
            ? (pi.EmbeddedState ? "../Images/RadioBoardConnected" : "../Images/RadioBoardDisconnected.png")
            : (pi.AWSState ? "../Images/TelemetryConnected.png" : "../Images/TelemetryDisconnected.png")
    }
}
