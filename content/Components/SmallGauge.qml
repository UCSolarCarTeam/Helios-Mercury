import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0
import "../util/util.js"

Item {
    id: root
    width: 178
    height: 178


    property int minValue: 0
    property int maxValue: 100
    property string units: "units"
    property string gaugeTitle: "title"
    property int value: 50
    property string iconPath: "../Images/BoltIcon.png"

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

            // Needle
            Rectangle {
                id: needle
                width: 5
                height: 17
                color: "#ffffff"
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
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
        anchors.topMargin: -148
        anchors.horizontalCenterOffset: 1

        // property alias vText: v.text
        // property alias charge_VoltageText: charge_Voltage.text

        Text {
            id: title
            width: parent.width
            color: "#898989"
            text: gaugeTitle
            anchors.top: parent.top
            anchors.topMargin: 90
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            wrapMode: Text.Wrap
            font.weight: Font.Medium
            font.family: "SF Pro"
        }

        Rectangle {
            id: frame_80
            height: 81
            width: parent.width
            color: "transparent"
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                id: ix_electrical_energy_filled
                width: 13.5
                height: 20
                anchors.horizontalCenter: parent.horizontalCenter

                color: "transparent"
                anchors.top: parent.top

                Image {
                    anchors.fill: parent
                    height: 20
                    width:13.5
                    id: gaugeIcon
                    source: iconPath
                }
                clip: true
            }

            Text {
                id: incomingValue
                width: parent.width
                height: 29
                color: "#ffffff"
                text: value.toString() + " " + units
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.top: parent.top
                anchors.topMargin: 40
                font.pixelSize: 24
                wrapMode: Text.NoWrap
                font.weight: Font.Medium
                font.family: "SF Pro"
            }

            Rectangle{
                id: minMaxContainer
                width: parent.width

                Text {
                id: minVal
                width: 12
                height: 24
                color: "#d4d4d4"
                text: minValue
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: -10
                anchors.topMargin: 120
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.weight: Font.Medium
                font.family: "SF Pro"
                }

                Text {
                id: maxVal
                width: 38
                height: 24
                color: "#d4d4d4"
                text: maxValue
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 104
                anchors.topMargin: 120
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.weight: Font.Medium
                font.family: "SF Pro"
                }
            }
        }
    }
}


