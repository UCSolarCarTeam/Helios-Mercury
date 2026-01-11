// FaultsMessage.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import Mercury

Rectangle {
    id: faultMessage

    implicitWidth: 426
    implicitHeight: 30

    radius: 8
    color: "black"
    border.width: 1

    property string msg: ""
    property string severity: "info"
    property string label: ""

    property color accentColor: severity === "error" ? Config.valueHigh
                           : severity === "warn"  ? Config.valueModerate
                           : severity === "info"  ? Config.valueLow
                           : severity === "bps"   ? Config.valueHigh
                           : "white"

    border.color: accentColor

    Text {
        anchors.fill: parent
        anchors.leftMargin: 18
        anchors.rightMargin: 12
        verticalAlignment: Text.AlignVCenter
        text: (label.length > 0 ? label + ": " : "") + msg
        font.pixelSize: 19
        color: accentColor
        elide: Text.ElideRight
    }
}
