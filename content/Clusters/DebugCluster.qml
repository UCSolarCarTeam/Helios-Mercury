import QtQuick 2.15
import "../Components"

Item {
    Text {
        id: _text
        x: 197
        y: 214
        width: 247
        height: 53
        text: qsTr("TODO: DEBUG CLUSTER")
        font.pixelSize: 24
    }
    Prndl {
        id: prndl
        x: 900  // Adjust X position as needed
        y: 50   // Adjust Y position as needed
        width: 200
        height: 100
    }
}
