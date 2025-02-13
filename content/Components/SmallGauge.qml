import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0

Item {
    id: root
    width: 200
    height: 200

    // Background Gauge Frame
    Rectangle {
        id: small_gauge_frame
        width: 178
        height: 178
        color: "transparent"

        Item {
            id: accessory_Guage
            anchors.fill: parent

            ArcItem {
                id: ellipse_16
                width: 178
                height: 178
                anchors.left: parent.left
                anchors.top: parent.top
                strokeWidth: 0
                strokeStyle: 0
                strokeColor: "transparent"
                outlineArc: true
                fillColor: "#242627"
                end: -134.72317
                begin: 131.56227
                arcWidth: 1.78
                antialiasing: true
            }

            ArcItem {
                id: ellipse_17
                width: 169
                height: 169
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 5
                anchors.topMargin: 5
                strokeWidth: 0
                strokeStyle: 0
                strokeColor: "transparent"
                outlineArc: true
                fillColor: "#00a8ff"
                end: -134.72317
                begin: 131.56227
                arcWidth: 16.87532
                antialiasing: true
            }
        }
    }

    // Gauge Data Display
    Rectangle {
        id: smallGuageData
        width: 123
        height: 148
        color: "transparent"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: small_gauge_frame.bottom
        anchors.topMargin: -147
        anchors.horizontalCenterOffset: 2

        property alias elementText: element.text
        property alias vText: v.text
        property alias charge_VoltageText: charge_Voltage.text
        property alias element1Text: element1.text

        Text {
            id: charge_Voltage
            width: 80
            height: 30
            color: "#898989"
            text: qsTr("Charge Voltage")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 15
            anchors.topMargin: 90
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Medium
            font.family: "SF Pro"
        }

        Text {
            id: element
            width: 19
            height: 24
            color: "#d4d4d4"
            text: qsTr("0")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 5
            anchors.topMargin: 120
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Medium
            font.family: "SF Pro"
        }

        Text {
            id: element1
            width: 47
            height: 24
            color: "#d4d4d4"
            text: qsTr("100")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 70
            anchors.topMargin: 120
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Medium
            font.family: "SF Pro"
        }

        Rectangle {
            id: frame_80
            width: 108
            height: 81
            color: "transparent"
            anchors.left: parent.left
            anchors.top: parent.top

            Rectangle {
                id: ix_electrical_energy_filled
                width: 24
                height: 24
                color: "transparent"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 42

                Image {
                    anchors.fill: parent
                    id: boltImg
                    width: 13.5
                    height: 20
                    source: "../Images/bolt_icon.png"
                }
                clip: true
            }

            Text {
                id: v
                width: 62
                height: 29
                color: "#ffffff"
                text: qsTr("58 v ")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 24
                anchors.topMargin: 40
                font.pixelSize: 24
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.weight: Font.Medium
                font.family: "SF Pro"
            }
        }
    }

    // Fluent Icon
    Rectangle {
        id: fluent_fast_acceleration_20_regular
        width: 61
        height: 61
        color: "transparent"
        anchors.left: smallGuageData.left
        anchors.top: smallGuageData.top
        anchors.leftMargin: 21
        anchors.topMargin: 18
    }
}
