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
