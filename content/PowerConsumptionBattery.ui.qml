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

/*##^##
Designer {
    D{i:0;uuid:"f57eed33-84d1-5169-a63d-d9cc97d6c2f4"}D{i:1;uuid:"658c5126-d96a-54a6-b6a3-e652a9176d32"}
D{i:2;uuid:"0f2f88ee-35fb-58b9-8632-fe2745bf94e0"}D{i:3;uuid:"ef88e7c2-f861-5e25-a707-7d7b0702d087"}
D{i:4;uuid:"f9e87d1c-3a26-58e2-b3cf-23ff9372fcc2"}D{i:5;uuid:"e16da591-5bb9-5db3-a636-cce61458ac71"}
D{i:6;uuid:"6d5d2303-e9cc-5711-913c-5217e1f16227"}D{i:7;uuid:"dcc2af20-d43a-5f68-8e9d-7eb61413895b"}
D{i:8;uuid:"3a487876-1747-5797-8072-e7c116dd4fcd"}D{i:9;uuid:"b8658a4f-5c0e-5bbc-adde-6336a84d7afa"}
D{i:10;uuid:"cced726d-86e6-5c75-af44-500bba3546c3"}D{i:11;uuid:"d03cd121-1eda-5f5d-91fd-b6fde6442538"}
D{i:12;uuid:"6289c3b2-3f4f-574d-8e26-14651354fbc2"}D{i:13;uuid:"31ae79f9-9000-5751-af02-4eff6b44017a"}
D{i:14;uuid:"88a7d83c-5383-549e-91b5-53c5ab15ed34"}D{i:15;uuid:"57881f9d-7ba9-5233-84a4-d9c02a39d99e"}
D{i:16;uuid:"ec0d895c-3693-58c0-b096-685b7652f77c"}D{i:17;uuid:"3a842bca-7222-50fe-9e36-22cf98ea13fb"}
D{i:18;uuid:"5f592a4a-ba14-527d-aea2-6287c9456cf1"}D{i:19;uuid:"056dca0d-7894-59b0-a253-d3f3a84dc95f"}
D{i:20;uuid:"ea35dbaa-2545-5c1f-9fb5-eeb7b3bdb4b2"}D{i:21;uuid:"4feb2e6a-eaa7-5025-b769-3a47c41fa53b"}
D{i:22;uuid:"19cbfead-c21e-53f8-8d12-5496916561fb"}D{i:23;uuid:"4343aa8f-82e2-56d3-8280-bea1c40c4725"}
D{i:24;uuid:"5e282ec3-5b49-58a7-ba9f-c0335eee301d"}D{i:25;uuid:"962e5b99-9089-544b-945d-c31d3e7b92bb"}
D{i:26;uuid:"5ee82417-0d3a-57be-ad53-e0ace170954e"}D{i:27;uuid:"84c86096-c6b3-5aa3-adc9-cff450091031"}
D{i:28;uuid:"bb3a7965-654a-595e-a606-c19cf54338c6"}D{i:29;uuid:"48588097-595a-5eb3-8b9f-1e9f6adff25a"}
D{i:30;uuid:"2fa4ce05-b919-55ec-8d96-fb8c14ba2c5d"}D{i:31;uuid:"fab2a0b5-ba23-5655-9905-2e4cc9ec63d3"}
D{i:32;uuid:"33dcab25-0ac6-5665-a475-dbcc72d413e0"}D{i:33;uuid:"2b0fa0e1-2136-5223-a5fe-976a9c929f4c"}
D{i:34;uuid:"c8b0bf61-fcb4-5e0b-88aa-42e8d5de2d75"}D{i:35;uuid:"0dcb79cf-76c7-5d6b-8988-b1f93415d917"}
}
##^##*/

