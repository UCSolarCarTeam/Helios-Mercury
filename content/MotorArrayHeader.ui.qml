import QtQuick

Rectangle {
    id: motorArrayHeader
    width: 1062
    height: 108
    color: "transparent"
    property alias motorLeftCurrentText: motorLeftCurrent.text
    property alias motorRightCurrentText: motorRightCurrent.text
    property alias totalArraysCurrentText: totalArraysCurrent.text

    Text {
        id: motorRightCurrent
        color: "#a2180f"
        text: qsTr("Motor R Current: 100 A")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.rightMargin: 476
        font.weight: Font.Normal
        anchors.leftMargin: 1
        font.family: "Jost"
        anchors.bottomMargin: 50
    }

    Text {
        id: motorLeftCurrent
        color: "#a2180f"
        text: qsTr("Motor L Current: 100 A")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.rightMargin: 476
        font.weight: Font.Normal
        anchors.leftMargin: 1
        font.family: "Jost"
        anchors.topMargin: 50
    }

    Text {
        id: totalArraysCurrent
        color: "#a2180f"
        text: qsTr("Total Arrays Current: 100 A")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.rightMargin: -2
        font.weight: Font.Normal
        anchors.leftMargin: 479
        font.family: "Jost"
        anchors.bottomMargin: 11
        anchors.topMargin: 39
    }
}

/*##^##
Designer {
    D{i:0;uuid:"561a3ff8-7127-57b5-83ee-5a22abac9b18"}D{i:1;uuid:"5f9b3c5f-1efb-59bb-be77-f6758a34b8dd"}
D{i:2;uuid:"def61ecd-71f4-5d2e-90ea-35921c648ee2"}D{i:3;uuid:"b35cb3df-299d-50b6-80bf-d732c16ec805"}
}
##^##*/

