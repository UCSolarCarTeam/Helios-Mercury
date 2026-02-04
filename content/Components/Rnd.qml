// Rnd.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import Mercury
import "../Config"
import QtQuick.Effects

Item {
    id: rndComponent
    width: 130
    height: 95

    
    Item {
        id: baseLine
        width: parent.width
        height: 0
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: 0
    }

    property var gears: ["R", "N", "D"]

    // Tracks selected gear
    property int currentGear: b3.ReverseDigital ? 0 : (b3.ForwardDigital ? 2 : 1)

    ListModel { id: gearModel }

    // Ensures reordering dosen't mess with the RND list
    function syncModelIfNeeded() {
        if (gearModel.count !== gears.length) {
            gearModel.clear()
            for (var i = 0; i < gears.length; i++)
                gearModel.append({ label: gears[i] })
        }
    }

    // Reorder model so selected gear is always at index 0
    function moveSelectedToTop() {
        syncModelIfNeeded()

        var selectedLabel = gears[currentGear]
        var fromIndex = -1

        for (var i = 0; i < gearModel.count; i++) {
            if (gearModel.get(i).label === selectedLabel) {
                fromIndex = i
                break
            }
        }

        if (fromIndex > 0) {
            gearModel.move(fromIndex, 0, 1)
        }
    }

    Component.onCompleted: moveSelectedToTop()
    onCurrentGearChanged: moveSelectedToTop()

    Image {
        id: upDownArrow
        width: 36
        height: 24
        anchors.right: gearList.left
        anchors.rightMargin: 10
        anchors.verticalCenter: gearList.verticalCenter
        source: "../Images/UpDownArrow.png"
    }

    // Highlights selected gear
    Text {
        id: selectedGearText
        text: gears[currentGear]
        color: Config.primary
        font.pixelSize: Config.fontSize11
        anchors.top: baseLine.bottom
        anchors.left: gearList.right
        anchors.leftMargin: 10
        anchors.verticalCenter: gearList.verticalCenter
    }

    ListView {
        id: gearList
        width: 40
        height: (Config.fontSize5 + 5) * gears.length
        spacing: 5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: baseLine.bottom
        anchors.topMargin: 5
        interactive: false
        clip: false
        model: gearModel

        delegate: Item {
            width: gearText.width
            height: gearText.height

            Text {
                id: gearText
                text: model.label
                font.pixelSize: Config.fontSize5
                font.weight: (model.label === gears[currentGear]) ? 600 : 400
                color: Config.fontColor
                anchors.centerIn: parent
            }
        }

        // Animation for when the active gear changes
        displaced: Transition {
            NumberAnimation {
                properties: "x,y"
                duration: 220
                easing.type: Easing.InOutQuad
            }
        }
    }
}
