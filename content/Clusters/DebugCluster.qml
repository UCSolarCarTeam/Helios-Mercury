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

    XSGaugeCluster {
        id: speedGauge
        x: 50
        y: 50
        minValue: 0
        maxValue: 200
        value: 75
        units: "km/h"
        gaugeTitle: "Speed"
    }
}
