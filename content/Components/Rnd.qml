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

    // Live input from CAN/Helios
    property int currentGear: b3.ReverseDigital ? 0 : (b3.ForwardDigital ? 2 : 1)

    // Used for the big gear so animation can transition smoothly
    property string displayedGear: gears[currentGear]

    property bool _animRunning: false
    property string _queuedGear: ""
    property string _pendingNew: ""
    property point _newFromPos: Qt.point(0, 0)

    ListModel { id: stackModel }

    // Rebuilds stack with selected gear removed
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

    // Position where label would appear in stack
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
        rebuildStack(displayedGear)
    }

    // Handles gear commands from CAN signals
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

    // Single floating gear used for animation
    Text {
        id: floatingGear
        visible: false
        text: ""
        color: Config.primary
        font.pixelSize: selectedGearText.font.pixelSize
        font.weight: selectedGearText.font.weight
        z: 999
    }

    // OUT: big → stack
    ParallelAnimation {
        id: outMove
        NumberAnimation { id: outX; target: floatingGear; property: "x"; duration: 220; easing.type: Easing.InOutQuad }
        NumberAnimation { id: outY; target: floatingGear; property: "y"; duration: 220; easing.type: Easing.InOutQuad }
    }

    // IN: stack → big
    ParallelAnimation {
        id: inMove
        NumberAnimation { id: inX; target: floatingGear; property: "x"; duration: 220; easing.type: Easing.InOutQuad }
        NumberAnimation { id: inY; target: floatingGear; property: "y"; duration: 220; easing.type: Easing.InOutQuad }
    }

    // Full animation sequence
    SequentialAnimation {
        id: swapAnim

        ScriptAction { script: { _animRunning = true } }

        // Phase 1: old -> stack
        ScriptAction { script: { outMove.start() } }
        PauseAnimation { duration: 220 }

        // Update selected gear and prepare phase 2
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

        // Phase 2: stack -> big
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

    // Main animation handler
    function startGearSwap(newLabel) {
        if (_animRunning) {
            _queuedGear = newLabel
            return
        }

        var oldLabel = displayedGear
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
