import QtQuick 2.15
import QtQuick.Controls 2.15
import Mercury
import "../Config"
import QtQuick.Effects

Item {
    id: rndComponent
    width: 130
    height: 95

    // Property to track selected gear (0: R, 1: N, 2: D)
    property var gears: ["R", "N", "D"]
    property int currentGear: b3.ReverseDigital ? 0 : (b3.ForwardDigital ? 2 : 1)

    // Displays Arrow For Drive Mode
    Image {
        id: upDownArrow
        width: 36
        height: 24
        anchors.right: gearColumn.left
        anchors.rightMargin: 10
        anchors.verticalCenter: gearColumn.verticalCenter          
        source: "../Images/UpDownArrow.png"
    }
    // Displays the selected gear
    Text {
        id: selectedGearText
        text: gears[currentGear]
        color: Config.primary
        font.pixelSize: Config.fontSize11
        font.weight: index === currentGear ? 600 : 400
        anchors.top: baseLine.bottom
        anchors.left: gearColumn.right
        anchors.leftMargin: 10
        anchors.verticalCenter: gearColumn.verticalCenter
    }
    // Gear column for all drive modes
    Column {
        id: gearColumn
        spacing: 5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: baseLine.bottom
        anchors.topMargin: 5

        Repeater {
            model: gears.length

            Item {
                width: gearText.width
                height: gearText.height

                Text {
                    id: gearText
                    text: gears[index]
                    font.pixelSize: Config.fontSize5
                    font.weight: index === currentGear ? 600 : 400
                    color: Config.fontColor
                    anchors.centerIn: parent
                }
            }
        }
    }
}