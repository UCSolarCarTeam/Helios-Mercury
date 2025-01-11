import QtQuick

Rectangle {
    id: powerConsumptionBattery
    width: 384
    height: 384
    color: "transparent"
    property alias powerConsumptionBatteryEllipseLowerLimitText: powerConsumptionBatteryEllipseLowerLimit.text
    property alias batteryValueText: batteryValue.text
    property alias netPowerConsumptionTextText: netPowerConsumptionText.text
    property alias powerConsumptionBatteryEllipseUpperLimitText: powerConsumptionBatteryEllipseUpperLimit.text
    property alias batteryTextText: batteryText.text
    property alias netPowerConsumptionValueText: netPowerConsumptionValue.text

    Image {
        id: powerConsumptionBatteryEllipse26
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse26.png"
        anchors.leftMargin: 164
        anchors.topMargin: 376
    }

    Image {
        id: powerConsumptionBatteryEllipse25
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse25.png"
        anchors.leftMargin: 59
        anchors.topMargin: 327
    }

    Image {
        id: powerConsumptionBatteryEllipse24
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse24.png"
        anchors.leftMargin: 0
        anchors.topMargin: 199
    }

    Image {
        id: powerConsumptionBatteryEllipse23
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse23.png"
        anchors.leftMargin: 0
        anchors.topMargin: 169
    }

    Image {
        id: powerConsumptionBatteryEllipse22
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse22.png"
        anchors.leftMargin: 4
        anchors.topMargin: 228
    }

    Image {
        id: powerConsumptionBatteryEllipse21
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse21.png"
        anchors.leftMargin: 3
        anchors.topMargin: 138
    }

    Image {
        id: powerConsumptionBatteryEllipse20
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse20.png"
        anchors.leftMargin: 39
        anchors.topMargin: 305
    }

    Image {
        id: powerConsumptionBatteryEllipse19
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse19.png"
        anchors.leftMargin: 38
        anchors.topMargin: 65
    }

    Image {
        id: powerConsumptionBatteryEllipse18
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse18.png"
        anchors.leftMargin: 24
        anchors.topMargin: 282
    }

    Image {
        id: powerConsumptionBatteryEllipse17
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse17.png"
        anchors.leftMargin: 22
        anchors.topMargin: 85
    }

    Image {
        id: powerConsumptionBatteryEllipse16
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse16.png"
        anchors.leftMargin: 12
        anchors.topMargin: 256
    }

    Image {
        id: powerConsumptionBatteryEllipse15
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse15.png"
        anchors.leftMargin: 10
        anchors.topMargin: 111
    }

    Image {
        id: powerConsumptionBatteryEllipse14
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse14.png"
        anchors.leftMargin: 106
        anchors.topMargin: 359
    }

    Image {
        id: powerConsumptionBatteryEllipse13
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse13.png"
        anchors.leftMargin: 81
        anchors.topMargin: 345
    }

    Image {
        id: powerConsumptionBatteryEllipse12
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse12.png"
        anchors.leftMargin: 134
        anchors.topMargin: 370
    }

    Image {
        id: powerConsumptionBatterySymbol
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatterySymbol.png"
        anchors.leftMargin: 200
        anchors.topMargin: 4
    }

    Image {
        id: powerConsumptionBatteryEllipse121
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse121.png"
        anchors.leftMargin: 109
        anchors.topMargin: 113
    }

    Text {
        id: netPowerConsumptionValue
        width: 78
        height: 43
        color: "#151515"
        text: qsTr("122 V")
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        anchors.leftMargin: 152
        font.family: "Jost"
        anchors.topMargin: 129
    }

    Text {
        id: netPowerConsumptionText
        width: 72
        height: 28
        color: "#151515"
        text: qsTr("NET POWER
CONSUMPTION")
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 10
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.WordWrap
        font.weight: Font.Normal
        anchors.leftMargin: 153
        font.family: "Jost"
        anchors.topMargin: 169
    }

    Image {
        id: powerConsumptionBatteryEllipse11
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse11.png"
        anchors.leftMargin: 185
        anchors.topMargin: 49
    }

    Text {
        id: powerConsumptionBatteryEllipseUpperLimit
        width: 35
        height: 29
        color: "#000000"
        text: qsTr("130")
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Medium
        anchors.leftMargin: 196
        font.family: "Jost"
        anchors.topMargin: 36
    }

    Text {
        id: powerConsumptionBatteryEllipseLowerLimit
        width: 36
        height: 29
        color: "#000000"
        text: qsTr("100")
        anchors.left: parent.left
        anchors.top: parent.top
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Medium
        anchors.leftMargin: 196
        font.family: "Jost"
        anchors.topMargin: 323
    }

    Image {
        id: powerConsumptionBatteryEllipse10
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse10.png"
        anchors.leftMargin: 43
        anchors.topMargin: 166
    }

    Image {
        id: powerConsumptionBatteryEllipse9
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse9.png"
        anchors.leftMargin: 43
        anchors.topMargin: 221
    }

    Image {
        id: powerConsumptionBatteryEllipse8
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse8.png"
        anchors.leftMargin: 93
        anchors.topMargin: 301
    }

    Image {
        id: powerConsumptionBatteryEllipse7
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse7.png"
        anchors.leftMargin: 135
        anchors.topMargin: 325
    }

    Image {
        id: powerConsumptionBatteryEllipse6
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse6.png"
        anchors.leftMargin: 135
        anchors.topMargin: 57
    }

    Image {
        id: powerConsumptionBatteryEllipse5
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse5.png"
        anchors.leftMargin: 93
        anchors.topMargin: 81
    }

    Image {
        id: powerConsumptionBatteryEllipse4
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse4.png"
        anchors.leftMargin: 62
        anchors.topMargin: 265
    }

    Image {
        id: powerConsumptionBatteryEllipse3
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse3.png"
        anchors.leftMargin: 62
        anchors.topMargin: 119
    }

    Image {
        id: powerConsumptionBatteryEllipse2
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse2.png"
        anchors.leftMargin: 185
        anchors.topMargin: 334
    }

    Image {
        id: powerConsumptionBatteryEllipse1
        anchors.left: parent.left
        anchors.top: parent.top
        source: "assets/powerConsumptionBatteryEllipse1.png"
        anchors.leftMargin: 52
        anchors.topMargin: 0
    }

    Image {
        id: powerConsumptionBattery_merged
        x: 47
        y: 63
        source: "assets/powerConsumptionBattery_merged.png"
    }

    Text {
        id: batteryValue
        color: "#151515"
        text: qsTr("68%")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.rightMargin: 148
        font.weight: Font.Normal
        anchors.leftMargin: 137
        font.family: "Jost"
        anchors.bottomMargin: 129
        anchors.topMargin: 180
    }

    Text {
        id: batteryText
        color: "#151515"
        text: qsTr("BATTERY")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 12
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        anchors.rightMargin: 142
        font.weight: Font.Normal
        anchors.leftMargin: 133
        font.family: "Jost"
        anchors.bottomMargin: 121
        anchors.topMargin: 232
    }
}
