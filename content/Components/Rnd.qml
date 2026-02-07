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

    // Tracks previously selected gear (for animation only)
    property string lastSelectedLabel: gears[currentGear]

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

    // Highlighted (big) gear
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

    // Ghost copy that animates back into the stack
    Text {
        id: returningGearGhost
        visible: false
        z: 999

        text: ""
        color: Config.primary
        font.pixelSize: Config.fontSize11

        x: 0
        y: 0
        scale: 1
        opacity: 1

        transformOrigin: Item.Center
        transform: Rotation {
            id: returningGearRotation
            origin.x: returningGearGhost.width / 2
            origin.y: returningGearGhost.height / 2
            angle: 0
        }
    }

    ParallelAnimation {
        id: returnToStackAnim
        running: false

        NumberAnimation {
            target: returningGearGhost
            property: "x"
            duration: 480
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: returningGearGhost
            property: "y"
            duration: 480
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: returningGearGhost
            property: "scale"
            duration: 480
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: returningGearGhost
            property: "opacity"
            duration: 480
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: returningGearRotation
            property: "angle"
            duration: 480
            easing.type: Easing.InOutQuad
        }

        onStopped: {
            returningGearGhost.visible = false
            returningGearGhost.opacity = 1
            returningGearGhost.scale = 1
            returningGearRotation.angle = 0
        }
    }

    Connections {
        target: rndComponent

        function onCurrentGearChanged() {
            var prev = lastSelectedLabel
            lastSelectedLabel = gears[currentGear]

            if (!prev || prev === lastSelectedLabel)
                return

            if (returnToStackAnim.running)
                returnToStackAnim.stop()

            returningGearGhost.text = prev
            returningGearGhost.scale = 1
            returningGearGhost.opacity = 1
            returningGearRotation.angle = 0

            var startPt = rndComponent.mapFromItem(selectedGearText, 0, 0)
            returningGearGhost.x = startPt.x
            returningGearGhost.y = startPt.y
            returningGearGhost.visible = true

            var endX = gearList.x + (gearList.width / 2) - (returningGearGhost.width / 2)
            var endY = gearList.y + (gearList.height / 2) - (returningGearGhost.height / 2)

            returnToStackAnim.animations[0].to = endX
            returnToStackAnim.animations[1].to = endY
            returnToStackAnim.animations[2].to = (Config.fontSize5 / Config.fontSize11)
            returnToStackAnim.animations[3].to = 0.15
            returnToStackAnim.animations[4].to = -360

            returnToStackAnim.start()
        }
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

        displaced: Transition {
            NumberAnimation {
                properties: "x,y"
                duration: 220
                easing.type: Easing.InOutQuad
            }
        }
    }
}
