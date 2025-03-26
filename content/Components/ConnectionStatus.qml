import QtQuick
import QtQuick.Controls
import Mercury

Item {
    id: connectionStatusFrame
    width: 32
    height: 32

    property bool isRadioBoard: false

    DashIcon {
        id: connectionIcon
        imageSource: isRadioBoard
            ? ("../Images/RadioBoardConnected")
            : ("../Images/TelemetryConnected.png")
        isOn: isRadioBoard ? pi.EmbeddedState : pi.AWSState
    }
}
