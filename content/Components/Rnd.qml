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

    property var gears: ["R", "N", "D"]
    property int currentGear: b3.ReverseDigital ? 0 : (b3.ForwardDigital ? 2 : 1)

    // Big-gear display uses this so we can animate between old/new without flicker
    property string displayedGear: gears[currentGear]
    property string _prevDisplayedGear: gears[currentGear]
    property bool _animRunning: false

    // Stack model contains ONLY non-selected gears (so selected letter disappears from stack)
    ListModel { id: stackModel }

    function rebuildStack(excludeLabel) {
        stackModel.clear()
        for (var i = 0; i < gears.length; i++) {
            if (gears[i] !== excludeLabel)
                stackModel.append({ label: gears[i] })
        }
    }

    function stackIndexOf(label) {
        for (var i = 0; i < stackModel.count; i++) {
            if (stackModel.get(i).label === label) return i
        }
        return -1
    }

    function pointToItem(item) {
        if (!item) return Qt.point(0, 0)
        var p = item.mapToItem(rndComponent, 0, 0)
        return Qt.point(p.x, p.y)
    }

    // Computes where a label would be in the stack if the other label is excluded
    // Used for animating the old gear back into the correct stack slot.
    function estimatedStackSlotPos(label, excludeLabel) {
        var idx = -1
        for (var i = 0; i < gears.length; i++) {
            if (gears[i] === excludeLabel) continue
            idx++
            if (gears[i] === label) break
        }
        var rowH = Config.fontSize5 + gearList.spacing
        var p = gearList.mapToItem(rndComponent, 0, Math.max(0, idx) * rowH)
        return Qt.point(p.x, p.y)
    }

    Component.onCompleted: {
        displayedGear = gears[currentGear]
        _prevDisplayedGear = displayedGear
        rebuildStack(displayedGear)
    }

    // When drive mode changes:
    // 1) animate old big gear -> stack slot
    // 2) swap displayedGear + rebuild stack (selected removed)
    // 3) animate new stack gear -> big gear
    onCurrentGearChanged: {
        var newLabel = gears[currentGear]
        if (newLabel === displayedGear) {
            rebuildStack(displayedGear)
            _prevDisplayedGear = displayedGear
            return
        }
        startGearSwap(newLabel)
    }

    Image {
        id: upDownArrow
        width: 36
        height: 24
        anchors.right: gearList.left
        anchors.rightMargin: 10
        anchors.verticalCenter: gearList.verticalCenter
        source: "../Images/UpDownArrow.png"
    }

    Text {
        id: selectedGearText
        text: displayedGear
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
        model: stackModel

        delegate: Item {
            width: gearText.width
            height: gearText.height

            Text {
                id: gearText
                text: model.label
                font.pixelSize: Config.fontSize5
                font.weight: 400
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

    // Single flying text used for both directions (big->stack, stack->big)
    Text {
        id: floatingGear
        visible: false
        text: ""
        color: Config.primary
        font.pixelSize: selectedGearText.font.pixelSize
        font.weight: selectedGearText.font.weight
        z: 999
    }

    SequentialAnimation {
        id: swapAnim

        PropertyAnimation {
            id: animOut
            target: floatingGear
            properties: "x,y"
            duration: 220
            easing.type: Easing.InOutQuad
        }

        // Commit the selection only after the out motion finishes
        ScriptAction {
            script: {
                displayedGear = _pendingNew
                rebuildStack(displayedGear)
            }
        }

        PropertyAnimation {
            id: animIn
            target: floatingGear
            properties: "x,y"
            duration: 220
            easing.type: Easing.InOutQuad
        }

        ScriptAction {
            script: {
                floatingGear.visible = false
                _animRunning = false
                _prevDisplayedGear = displayedGear
            }
        }
    }

    property string _pendingNew: ""
    property point _newFromPos: Qt.point(0, 0)

    function startGearSwap(newLabel) {
        if (_animRunning) return
        _animRunning = true

        var oldLabel = displayedGear
        var bigPos = pointToItem(selectedGearText)

        // Find where the new label currently sits in the stack (before it gets excluded)
        var newIdx = stackIndexOf(newLabel)
        var newItem = (newIdx >= 0) ? gearList.itemAtIndex(newIdx) : null
        _newFromPos = newItem ? pointToItem(newItem) : estimatedStackSlotPos(newLabel, oldLabel)

        // Phase 1: old label flies from big -> its stack slot
        floatingGear.text = oldLabel
        floatingGear.x = bigPos.x
        floatingGear.y = bigPos.y
        floatingGear.visible = true

        var oldToPos = estimatedStackSlotPos(oldLabel, newLabel)
        animOut.from = Qt.point(bigPos.x, bigPos.y)
        animOut.to   = Qt.point(oldToPos.x, oldToPos.y)

        // Prepare phase 2 target
        _pendingNew = newLabel
        animIn.from = Qt.point(_newFromPos.x, _newFromPos.y)
        animIn.to   = Qt.point(bigPos.x, bigPos.y)

        // Set the floating gear to the new label right before animating in
        swapAnim.animations[2].script = function() {
            floatingGear.text = newLabel
            floatingGear.x = _newFromPos.x
            floatingGear.y = _newFromPos.y
            floatingGear.visible = true
        }

        swapAnim.stop()
        swapAnim.start()
    }
}
