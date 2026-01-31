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

    // Updated from b3 via Connections (more reliable than a derived binding)
    property int currentGear: 1

    // Big-gear display uses this so we can animate between old/new without flicker
    property string displayedGear: gears[currentGear]

    property bool _animRunning: false
    property string _queuedGear: ""
    property string _pendingNew: ""
    property point _newFromPos: Qt.point(0, 0)

    // Stack model contains ONLY non-selected gears (so selected letter disappears from stack)
    ListModel { id: stackModel }

    function computeGearIndex() {
        return b3.ReverseDigital ? 0 : (b3.ForwardDigital ? 2 : 1)
    }

    function updateFromSignals() {
        var g = computeGearIndex()
        if (g !== currentGear)
            currentGear = g
    }

    function rebuildStack(excludeLabel) {
        stackModel.clear()
        for (var i = 0; i < gears.length; i++) {
            if (gears[i] !== excludeLabel)
                stackModel.append({ label: gears[i] })
        }
    }

    function stackIndexOf(label) {
        for (var i = 0; i < stackModel.count; i++)
            if (stackModel.get(i).label === label) return i
        return -1
    }

    function pointToItem(item) {
        if (!item) return Qt.point(0, 0)
        var p = item.mapToItem(rndComponent, 0, 0)
        return Qt.point(p.x, p.y)
    }

    // Computes where a label would be in the stack if the other label is excluded
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
        updateFromSignals()
        displayedGear = gears[currentGear]
        rebuildStack(displayedGear)
    }

    // Ensures we react when b3 booleans change (even if derived bindings don’t re-evaluate)
    Connections {
        target: b3
        function onReverseDigitalChanged() { updateFromSignals() }
        function onForwardDigitalChanged() { updateFromSignals() }
    }

    // When drive mode changes:
    // 1) animate old big gear -> stack slot
    // 2) commit displayedGear + rebuild stack (selected removed)
    // 3) animate new stack gear -> big gear
    onCurrentGearChanged: {
        var newLabel = gears[currentGear]

        if (newLabel === displayedGear) {
            rebuildStack(displayedGear)
            return
        }

        if (_animRunning) {
            _queuedGear = newLabel
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
        visible: status === Image.Ready
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

    ParallelAnimation {
        id: outMove
        NumberAnimation { id: outX; target: floatingGear; property: "x"; duration: 220; easing.type: Easing.InOutQuad }
        NumberAnimation { id: outY; target: floatingGear; property: "y"; duration: 220; easing.type: Easing.InOutQuad }
    }

    ParallelAnimation {
        id: inMove
        NumberAnimation { id: inX; target: floatingGear; property: "x"; duration: 220; easing.type: Easing.InOutQuad }
        NumberAnimation { id: inY; target: floatingGear; property: "y"; duration: 220; easing.type: Easing.InOutQuad }
    }

    SequentialAnimation {
        id: swapAnim

        ScriptAction { script: { _animRunning = true } }

        // Phase 1: old selected gear flies from big -> its stack slot
        ScriptAction { script: { outMove.start() } }
        PauseAnimation { duration: 220 }

        // Commit selection after phase 1 (updates big letter + removes it from the stack)
        ScriptAction {
            script: {
                displayedGear = _pendingNew
                rebuildStack(displayedGear)

                floatingGear.text = _pendingNew
                floatingGear.x = _newFromPos.x
                floatingGear.y = _newFromPos.y

                var bigPos = pointToItem(selectedGearText)
                inX.from = _newFromPos.x; inY.from = _newFromPos.y
                inX.to = bigPos.x;        inY.to = bigPos.y
            }
        }

        // Phase 2: new selected gear flies from stack -> big
        ScriptAction { script: { inMove.start() } }
        PauseAnimation { duration: 220 }

        ScriptAction {
            script: {
                floatingGear.visible = false
                _animRunning = false

                if (_queuedGear !== "" && _queuedGear !== displayedGear) {
                    var q = _queuedGear
                    _queuedGear = ""
                    startGearSwap(q)
                } else {
                    _queuedGear = ""
                }
            }
        }
    }

    function startGearSwap(newLabel) {
        if (_animRunning) {
            _queuedGear = newLabel
            return
        }

        var oldLabel = displayedGear

        // Build stack for old selection before reading positions
        rebuildStack(oldLabel)

        var bigPos = pointToItem(selectedGearText)

        var newIdx = stackIndexOf(newLabel)
        var newItem = (newIdx >= 0) ? gearList.itemAtIndex(newIdx) : null
        _newFromPos = newItem ? pointToItem(newItem) : estimatedStackSlotPos(newLabel, oldLabel)

        floatingGear.text = oldLabel
        floatingGear.x = bigPos.x
        floatingGear.y = bigPos.y
        floatingGear.visible = true

        var oldToPos = estimatedStackSlotPos(oldLabel, newLabel)
        outX.from = bigPos.x; outY.from = bigPos.y
        outX.to = oldToPos.x; outY.to = oldToPos.y

        _pendingNew = newLabel

        swapAnim.stop()
        swapAnim.start()
    }
}
