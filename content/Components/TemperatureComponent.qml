import QtQuick
import QtQuick.Layouts 1.15
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0

Rectangle {
    id: temperture_Scale
    width: 370
    height: 24
    color: "black"
    property alias elementText: element.text
    property alias cText: c.text
    property alias hText: h.text
    property int batteryTemp: 0
    onBatteryTempChanged: {
        console.log("Battery temperature changed to:", batteryTemp);
    }

    RowLayout {
        id: temperture_Scale_layout
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        Item {
            id: cool
            x: 56
            y: 0
            width: 56
            height: 19
            SvgPathItem {
                id: line_5_Stroke_
                width: 15
                height: 3
                anchors.right: parent.right
                anchors.top: parent.top
                path: "M 13 3 L 0 3 L 0 0 L 13 0 L 13 3 Z"
                strokeWidth: 3
                rotation: 90
                strokeColor: "transparent"
                joinStyle: 0
                antialiasing: true
                strokeStyle: 1
                anchors.topMargin: 8
                anchors.leftMargin: -5
                fillColor: "#1b46b7"
            }

            SvgPathItem {
                id: line_6_Stroke_
                width: 50
                height: 3
                anchors.left: parent.left
                anchors.top: parent.top
                path: "M 50 3 L 0 3 L 0 0 L 50 0 L 50 3 Z"
                strokeWidth: 3
                rotation: 180
                strokeColor: "transparent"
                joinStyle: 0
                antialiasing: true
                strokeStyle: 1
                fillColor: "#1b46b7"
            }

            Text {
                id: c
                width: 13
                height: 11
                color: "#1b46b7"
                text: qsTr("C")
                anchors.left: parent.left
                anchors.top: parent.top
                font.pixelSize: 12
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.family: "SF Pro"
                font.weight: Font.Medium
                anchors.topMargin: 5
                anchors.leftMargin: 1

            }
            Layout.preferredWidth: 56
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.preferredHeight: 19
        }

        Item {
            id: temperature_slider_container
            x: 68
            y: 0
            width: 234
            height: 24
            SvgPathItem {
                id: line_1_Stroke_
                width: 234
                height: 3
                anchors.left: parent.left
                anchors.top: parent.top
                path: "M 234 3 L 0 3 L 0 0 L 234 0 L 234 3 Z"
                strokeWidth: 3
                strokeColor: "transparent"
                joinStyle: 0
                antialiasing: true
                strokeStyle: 1
                fillColor: "#ffffff"
            }

            SvgPathItem {
                id: line_2_Stroke_
                width: 13
                height: 3
                anchors.left: parent.left
                anchors.top: parent.top
                path: "M 13 3 L 0 3 L 0 0 L 13 0 L 13 3 Z"
                strokeWidth: 3
                rotation: 90
                strokeColor: "transparent"
                joinStyle: 0
                antialiasing: true
                strokeStyle: 1
                anchors.topMargin: 8
                anchors.leftMargin: -5
                fillColor: "#ffffff"
            }

            SvgPathItem {
                id: line_3_Stroke_
                width: 13
                height: 3
                anchors.left: parent.left
                anchors.top: parent.top
                path: "M 13 3 L 0 3 L 0 0 L 13 0 L 13 3 Z"
                strokeWidth: 3
                rotation: 90
                strokeColor: "transparent"
                joinStyle: 0
                antialiasing: true
                strokeStyle: 1
                anchors.topMargin: 8
                anchors.leftMargin: 226
                fillColor: "#ffffff"
            }

            SvgPathItem {
                id: line_4_slider
                width: 24
                height: 4
                anchors.left: parent.left
                anchors.top: parent.top
                path: "M 24 4 L 0 4 L 0 0 L 24 0 L 24 4 Z"
                strokeWidth: 4
                strokeColor: "transparent"
                joinStyle: 0
                antialiasing: true
                strokeStyle: 1
                anchors.topMargin: -4
                fillColor: "red"
                PropertyAnimation{
                    id:animationRight
                    target:line_4_slider
                    property:"x"
                    to: parent.x - line_4_slider.width
                    duration:500
                }
            }

            Text {
                id: element
                width: 41
                height: 17
                color: "#1b46b7"
                text: qsTr(batteryTemp.toString())
                anchors.left: parent.left
                anchors.top: parent.top
                font.pixelSize: 14
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.family: "SF Pro"
                font.weight: Font.Medium
                anchors.topMargin: 7
                anchors.leftMargin: 123
            }

            Rectangle {
                id: temperature
                width: 16
                height: 16
                color: "transparent"
                anchors.left: parent.left
                anchors.top: parent.top

                SvgPathItem {
                    id: primary
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 2
                    path: "M 2.000004768371582 5.606666713528627 L 2.000004768371582 1.3333333686691773 C 2.000004768371582 0.9797113598748193 2.1404808163642883 0.6405727437029154 2.3905293146769204 0.39052423876352715 C 2.6405778129895525 0.14047573382413886 2.979716102282206 2.960594810795086e-16 3.333338101704915 0 C 3.686960101127624 2.960594810795086e-16 4.026098390420278 0.14047573382413886 4.27614688873291 0.39052423876352715 C 4.526195387045543 0.6405727437029154 4.666671435038248 0.9797113598748193 4.666671435038248 1.3333333686691773 L 4.666671435038248 5.606666713528627 C 5.368539492289225 5.912987051153885 5.943529526392619 6.451636088008291 6.294958114624023 7.132039577033306 C 6.646386702855428 7.8124430660583215 6.752819110949834 8.593102206035384 6.59635861714681 9.342749525351099 C 6.439898123343785 10.092396844666814 6.030087788899739 10.7653096985751 5.4358367919921875 11.248338361660082 C 4.841585795084636 11.731367024745063 4.099138895670572 11.995051383972168 3.333338101704915 11.995051383972168 C 2.567537307739258 11.995051383972168 1.8250900109608967 11.731367024745063 1.2308390140533447 11.248338361660082 C 0.6365880171457927 10.7653096985751 0.2267773946126302 10.092396844666814 0.07031690080960591 9.342749525351099 C -0.08614359299341838 8.593102206035384 0.020288825035095215 7.8124430660583215 0.3717174132664998 7.132039577033306 C 0.7231460014979044 6.451636088008291 1.2981367111206055 5.912987051153885 2.000004768371582 5.606666713528627 Z M 3.333338101704915 7.333333527680475 C 3.0696296890576678 7.333333527680475 2.811843474706014 7.411532270632584 2.5925779342651367 7.5580408191987924 C 2.3733123938242593 7.704549367765001 2.2024154464403787 7.912787686879161 2.101498603820801 8.15642251332038 C 2.000581761201223 8.400057339761597 1.9741773158311844 8.66814594591252 2.0256242752075195 8.926787295089035 C 2.0770712345838547 9.18542864426555 2.2040593028068542 9.423005691551982 2.3905293146769204 9.609475708363854 C 2.5769993265469866 9.795945725175727 2.8145763675371804 9.92293379676415 3.073217709859212 9.974380757503926 C 3.3318590521812435 10.025827718243702 3.599947651227315 9.999423272173898 3.843582471211751 9.898506426879834 C 4.087217291196187 9.79758958158577 4.295455604791641 9.626693265455692 4.441964149475098 9.407427719203865 C 4.588472694158554 9.188162172952037 4.666671435038248 8.930375315985668 4.666671435038248 8.666666896349652 C 4.666671435038248 8.313044887555293 4.526195387045543 7.973906589274838 4.27614688873291 7.72385808433545 C 4.026098390420278 7.473809579396061 3.686960101127624 7.333333527680475 3.333338101704915 7.333333527680475 Z"
                    strokeWidth: 1
                    strokeColor: "#1b46b7"
                    joinStyle: 2
                    antialiasing: true
                    strokeStyle: 1
                    anchors.topMargin: 2
                    anchors.leftMargin: 5
                    fillColor: "transparent"
                    anchors.rightMargin: 5
                }
                anchors.topMargin: 7
                anchors.leftMargin: 105
                clip: true
            }
            Layout.preferredWidth: 234
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.preferredHeight: 24
        }

        Item {
            id: hot
            x: 314
            y: 0
            width: 56
            height: 19
            SvgPathItem {
                id: line_5_Stroke_1
                width: 13
                height: 3
                anchors.left: parent.left
                anchors.top: parent.top
                path: "M 13 3 L 0 3 L 0 0 L 13 0 L 13 3 Z"
                strokeWidth: 3
                rotation: 90
                strokeColor: "transparent"
                joinStyle: 0
                antialiasing: true
                strokeStyle: 1
                anchors.topMargin: 8
                anchors.leftMargin: -5
                fillColor: "#ce4727"
            }

            SvgPathItem {
                id: line_6_Stroke_1
                width: 50
                height: 3
                anchors.left: parent.left
                anchors.top: parent.top
                path: "M 50 3 L 0 3 L 0 0 L 50 0 L 50 3 Z"
                strokeWidth: 3
                rotation: 180
                strokeColor: "transparent"
                joinStyle: 0
                antialiasing: true
                strokeStyle: 1
                fillColor: "#ce4727"
            }

            Text {
                id: h
                width: 13
                height: 14
                color: "#ce4727"
                text: qsTr("H")
                anchors.left: parent.left
                anchors.top: parent.top
                font.pixelSize: 12
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                font.family: "SF Pro"
                font.weight: Font.Medium
                anchors.topMargin: 5
                anchors.leftMargin: 40
            }
            Layout.preferredWidth: 56
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.preferredHeight: 19
        }

    }
}
