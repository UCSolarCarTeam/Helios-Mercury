import QtQuick

Rectangle {
    id: contactor_switches
    width: 1023
    height: 105
    color: "transparent"
    property alias cellular_modemText: cellular_modem.text
    property alias common_contactor_textText: common_contactor_text.text
    property alias charge_contactor_textText: charge_contactor_text.text
    property alias hV_contactor_textText: hV_contactor_text.text
    property alias radio_boardText: radio_board.text
    property alias lV_contactor_textText: lV_contactor_text.text
    property alias arrays_contactor_textText: arrays_contactor_text.text

    Item {
        id: contactors
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 360
        anchors.bottomMargin: 11
        anchors.topMargin: 24
        Item {
            id: charge_contactor
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 531
            Rectangle {
                id: charge_contactor_toggle
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
                id: charge_contactor_text
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
            id: arrays_contactor
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 139
            anchors.leftMargin: 407
            Rectangle {
                id: arrays_contactor_toggle
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
                id: arrays_contactor_text
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
            id: lV_contactor
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 272
            anchors.leftMargin: 274
            Rectangle {
                id: lV_contactor_toggle
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
                id: lV_contactor_text
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
            id: hV_contactor
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 404
            anchors.leftMargin: 142
            Rectangle {
                id: hV_contactor_toggle
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
                id: hV_contactor_text
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
            id: common_contactor
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 527
            Rectangle {
                id: common_contactor_toggle
                width: 61
                height: 39
                color: "#34c759"
                radius: 100
                anchors.left: parent.left
                anchors.top: parent.top
                clip: true
                anchors.leftMargin: 38
                anchors.topMargin: 31
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
                id: common_contactor_text
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
                anchors.bottomMargin: 47
            }
        }
    }

    Item {
        id: data_source
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 710
        Text {
            id: cellular_modem
            color: "#a2180f"
            text: qsTr("Cellular Modem")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            anchors.rightMargin: -1
            font.weight: Font.Normal
            font.family: "Jost"
            anchors.bottomMargin: 30
        }

        Text {
            id: radio_board
            color: "#a2180f"
            text: qsTr("Radio Board")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            anchors.rightMargin: -1
            font.weight: Font.Normal
            font.family: "Jost"
            anchors.topMargin: 47
        }
    }
}

/*##^##
Designer {
    D{i:0;uuid:"1afb44f5-071e-52cf-a78c-e83fc11dbc11"}D{i:4;uuid:"579630e6-373a-5ad5-bbcf-5f59fd96a8c0"}
D{i:3;uuid:"4508aac0-d5c9-54cc-9398-e0739cd38dec"}D{i:5;uuid:"ea29e8ad-dcca-5049-8fbc-8f56d84e43e3"}
D{i:2;uuid:"ad37f6f1-1a4d-56ed-a3b6-c9fd8698fc2a"}D{i:8;uuid:"cb46b3bd-b67a-53f4-819d-b5bac31ab1e6"}
D{i:7;uuid:"def3d204-d9ef-5c06-b033-10d1b48bb424"}D{i:9;uuid:"1a43cab5-e7b6-5b89-9f13-43260d5da3bf"}
D{i:6;uuid:"5fa0c4f1-d68d-5370-91a8-285b398fa4d6"}D{i:12;uuid:"3a56f76b-ac21-5bde-a7d6-7050972ee74e"}
D{i:11;uuid:"99af16f3-bc9c-580d-9633-d9e211147327"}D{i:13;uuid:"c10ad936-759b-5b5b-9f42-bdae0f4f351a"}
D{i:10;uuid:"839eaa38-8856-5c46-9095-64a3bdec1f1d"}D{i:16;uuid:"747c5756-facd-524e-a0ee-b55db9af7f78"}
D{i:15;uuid:"3ad75c31-fed7-592a-a558-101ca9ba56ad"}D{i:17;uuid:"80cc16fa-96fd-5b98-9afb-76477933b1cd"}
D{i:14;uuid:"4821bbb5-60b3-557d-b054-54916d8e891e"}D{i:20;uuid:"bacf3f2f-4078-5387-8bdb-2f2241d42244"}
D{i:19;uuid:"f7bac7f1-db0f-5bb6-822c-0dbed72ceb35"}D{i:21;uuid:"34d2dccb-3cc1-55f0-936c-0b2023b9c210"}
D{i:18;uuid:"d43ffa82-3f2a-5d1c-a468-fb4da74461ae"}D{i:1;uuid:"cccc76fa-e5a0-522e-a869-90d10ae28159"}
D{i:23;uuid:"857372e4-ebe9-5d29-a911-15db1971d281"}D{i:24;uuid:"eb3810a0-b1c8-5344-a437-78a1ad106acd"}
D{i:22;uuid:"1709e35a-e019-50e1-b30b-5d67c9416429"}
}
##^##*/

