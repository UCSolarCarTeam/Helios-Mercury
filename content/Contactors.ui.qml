import QtQuick

Rectangle {
    id: contactors
    width: 663
    height: 70
    color: "transparent"
    property alias arraysContactorTextText: arraysContactorText.text
    property alias hVContactorTextText: hVContactorText.text
    property alias chargeContactorTextText: chargeContactorText.text
    property alias commonContactorTextText: commonContactorText.text
    property alias lVContactor1Text: lVContactor1.text

    Item {
        id: chargeContactor
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 531
        Rectangle {
            id: toggle1
            width: 61
            height: 39
            color: "#34c759"
            radius: 100
            anchors.left: parent.left
            anchors.top: parent.top
            clip: true
            anchors.leftMargin: 35
            anchors.topMargin: 31
            Image {
                id: knob
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                source: "assets/knob.png"
                anchors.rightMargin: -6
                anchors.verticalCenterOffset: 3
            }
        }

        Text {
            id: chargeContactorText
            color: "#151515"
            text: qsTr("Charge Contactor")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            anchors.rightMargin: -1
            font.weight: Font.Normal
            font.family: "Jost"
            anchors.bottomMargin: 47
        }
    }

    Item {
        id: arraysContactor
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 139
        anchors.leftMargin: 407
        Rectangle {
            id: toggle11
            width: 61
            height: 39
            color: "#34c759"
            radius: 100
            anchors.left: parent.left
            anchors.top: parent.top
            clip: true
            anchors.leftMargin: 27
            anchors.topMargin: 31
            Image {
                id: knob1
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                source: "assets/knob1.png"
                anchors.rightMargin: -6
                anchors.verticalCenterOffset: 3
            }
        }

        Text {
            id: arraysContactorText
            color: "#151515"
            text: qsTr("Arrays Contactor")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            anchors.rightMargin: -1
            font.weight: Font.Normal
            font.family: "Jost"
            anchors.bottomMargin: 47
        }
    }

    Item {
        id: lVContactor
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 272
        anchors.leftMargin: 274
        Rectangle {
            id: toggle12
            width: 61
            height: 39
            color: "#34c759"
            radius: 100
            anchors.left: parent.left
            anchors.top: parent.top
            clip: true
            anchors.leftMargin: 28
            anchors.topMargin: 31
            Image {
                id: knob2
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                source: "assets/knob2.png"
                anchors.rightMargin: -6
                anchors.verticalCenterOffset: 3
            }
        }

        Text {
            id: lVContactor1
            color: "#151515"
            text: qsTr("LV Contactor")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            anchors.rightMargin: -1
            font.weight: Font.Normal
            font.family: "Jost"
            anchors.bottomMargin: 47
        }
    }

    Item {
        id: hVContactor
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 404
        anchors.leftMargin: 142
        Rectangle {
            id: toggle13
            width: 61
            height: 39
            color: "#34c759"
            radius: 100
            anchors.left: parent.left
            anchors.top: parent.top
            clip: true
            anchors.leftMargin: 28
            anchors.topMargin: 31
            Image {
                id: knob3
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                source: "assets/knob3.png"
                anchors.rightMargin: -6
                anchors.verticalCenterOffset: 3
            }
        }

        Text {
            id: hVContactorText
            color: "#151515"
            text: qsTr("HV Contactor")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            anchors.rightMargin: -1
            font.weight: Font.Normal
            font.family: "Jost"
            anchors.bottomMargin: 47
        }
    }

    Item {
        id: commonContactor
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 527
        anchors.topMargin: 1
        Rectangle {
            id: toggle14
            width: 61
            height: 39
            color: "#34c759"
            radius: 100
            anchors.left: parent.left
            anchors.top: parent.top
            clip: true
            anchors.leftMargin: 38
            anchors.topMargin: 30
            Image {
                id: knob4
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                source: "assets/knob4.png"
                anchors.rightMargin: -6
                anchors.verticalCenterOffset: 3
            }
        }

        Text {
            id: commonContactorText
            color: "#151515"
            text: qsTr("Common Contactor")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            anchors.rightMargin: -1
            font.weight: Font.Normal
            font.family: "Jost"
            anchors.bottomMargin: 46
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"b20785e4-7bbc-549d-91e4-dd65534c9b91"}D{i:3;uuid:"33ba635a-0afe-51ce-ba3b-89a45ee5145c"}
D{i:2;uuid:"7735a3da-5323-5763-8efc-a7700b35f7c2"}D{i:4;uuid:"36077331-1a97-5e57-854e-6d53f5fd87d4"}
D{i:1;uuid:"24a3ffd7-f91c-5f4c-a67f-d5999b386539"}D{i:7;uuid:"79a0e400-d1fd-50c7-959c-cfa74d7976b8"}
D{i:6;uuid:"b9139221-fde7-517f-b4d6-e70c8ed8fd4e"}D{i:8;uuid:"2baae826-7c44-50b8-867e-29bfdaa551c7"}
D{i:5;uuid:"37d3b408-e471-5a5e-8edb-fcbe7f06893f"}D{i:11;uuid:"78d3aeda-994d-5ac2-b98d-d68a3921f3ad"}
D{i:10;uuid:"0c4ee8b1-9e9c-57a1-8995-e41df35f2439"}D{i:12;uuid:"c1bbbdc0-0af7-5af5-9aef-76ccec7ce60c"}
D{i:9;uuid:"d35c1839-fde7-5f2e-9509-f87bb7408235"}D{i:15;uuid:"795f5c04-dbd3-54a7-bc2c-d6fe1d84c161"}
D{i:14;uuid:"a9d60b77-2afb-5f1c-8d9f-c2ab5e69158c"}D{i:16;uuid:"c61fae5d-2143-5413-b680-7b129f5b6444"}
D{i:13;uuid:"7df1f1f2-24ba-51cb-ab06-4914fd8b077b"}D{i:19;uuid:"86e4694e-fdcf-50d3-a9c6-2f05480c61b1"}
D{i:18;uuid:"16f3f234-e3ee-5df0-b374-30caf3148836"}D{i:20;uuid:"3511a978-c9c6-548e-a787-fe0f7f3a1e5a"}
D{i:17;uuid:"6d2cebe4-fd37-55ed-a096-f4099bb4cb7d"}
}
##^##*/

