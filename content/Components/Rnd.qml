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

    function syncModelIfNeeded() {
        if (gearModel.count !== gears.length) {
            gearModel.clear()
            for (var i = 0; i < gears.length; i++)
                gearModel.append({ label: gears[i] })
        }
    }

    // Keep model static: always R, N, D
    function moveSelectedToTop() {
        syncModelIfNeeded()
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

    // Big highlighted gear
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

    // Ghost gear that animates back into the stack
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

        NumberAnimation {
            target: returningGearGhost
            property: "x"
            duration: 720
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: returningGearGhost
            property: "y"
            duration: 720
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: returningGearGhost
            property: "scale"
            duration: 720
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: returningGearGhost
            property: "opacity"
            duration: 720
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: returningGearRotation
            property: "angle"
            duration: 720
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

            // Start from the big highlighted gear
            returningGearGhost.text = prev
            returningGearGhost.scale = 1
            returningGearGhost.opacity = 1
            returningGearRotation.angle = 0

            var startPt = rndComponent.mapFromItem(selectedGearText, 0, 0)
            returningGearGhost.x = startPt.x
            returningGearGhost.y = startPt.y
            returningGearGhost.visible = true

            // --------------------------------------------------
            // 🔽 EXPLICIT DIRECTIONAL TARGETS (R / N / D)
            // --------------------------------------------------
            var idx
            if (prev === "R") {
                idx = 0      // TOP
            } else if (prev === "N") {
                idx = 1      // MIDDLE
            } else if (prev === "D") {
                idx = 2      // BOTTOM
            } else {
                idx = 1
            }

            var finalScale = Config.fontSize5 / Config.fontSize11
            var rowStep = Config.fontSize5 + gearList.spacing
            var topRowCenterY = gearList.y + (Config.fontSize5 / 2)

            var targetCenterX = gearList.x + (gearList.width / 2)
            var targetCenterY = topRowCenterY + (idx * rowStep)

            var finalW = returningGearGhost.width * finalScale
            var finalH = returningGearGhost.height * finalScale

            returnToStackAnim.animations[0].to = targetCenterX - (finalW / 2)
            returnToStackAnim.animations[1].to = targetCenterY - (finalH / 2)
            returnToStackAnim.animations[2].to = finalScale
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

                // Dimmer blue for active small gear
                color: (model.label === gears[currentGear]) ? Config.primary : Config.fontColor
                opacity: (model.label === gears[currentGear]) ? 0.6 : 1.0

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