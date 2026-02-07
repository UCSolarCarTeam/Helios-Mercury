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

    // --- Added (only): tracks what was previously highlighted so we can animate it back ---
    property string lastSelectedLabel: gears[currentGear]
    // --- End added ---

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

    // --- Added (only): ghost copy that animates the PREVIOUS big gear back into the stack ---
    Text {
        id: returningGearGhost
        visible: false
        z: 999

        text: ""
        color: Config.primary
        font.pixelSize: Config.fontSize11

        // we position this manually when the gear changes
        x: 0
        y: 0

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
            duration: 240
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: returningGearGhost
            property: "y"
            duration: 240
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: returningGearGhost
            property: "scale"
            duration: 240
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: returningGearGhost
            property: "opacity"
            duration: 240
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: returningGearRotation
            property: "angle"
            duration: 240
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
            // animate the PREVIOUS highlighted label back into the stack
            // (does not alter your currentGear / model logic)
            var prev = lastSelectedLabel
            lastSelectedLabel = gears[currentGear]

            if (!prev || prev === lastSelectedLabel)
                return

            if (returnToStackAnim.running)
                returnToStackAnim.stop()

            // set ghost to previous label and start where the big highlight is
            returningGearGhost.text = prev
            returningGearGhost.scale = 1
            returningGearGhost.opacity = 1
            returningGearRotation.angle = 0

            // map selectedGearText position into rndComponent coords
            var startPt = rndComponent.mapFromItem(selectedGearText, 0, 0)
            returningGearGhost.x = startPt.x
            returningGearGhost.y = startPt.y
            returningGearGhost.visible = true

            // destination: center of the gear stack (simple + robust, no delegate lookup)
            var endX = gearList.x + (gearList.width / 2) - (returningGearGhost.width / 2)
            var endY = gearList.y + (gearList.height / 2) - (returningGearGhost.height / 2)

            // configure animation end values
            returnToStackAnim.animations[0].to = endX
            returnToStackAnim.animations[1].to = endY

            // shrink toward list font size (approx) and fade slightly as it "slots in"
            returnToStackAnim.animations[2].to = (Config.fontSize5 / Config.fontSize11)
            returnToStackAnim.animations[3].to = 0.15

            // rotate like a carousel spin
            returnToStackAnim.animations[4].to = -360

            returnToStackAnim.start()
        }
    }
    // --- End added ---

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
