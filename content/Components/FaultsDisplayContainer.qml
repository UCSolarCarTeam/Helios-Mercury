// FaultsDisplayContainer.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: faultsDisplayContainer
    width: 426
    height: 175
    color: "transparent"

    // Height for each fault row
    property int delegateHeight: 33

    // All possible faults: we'll listen to <fault>NameChanged signals on each source object
    property var faultsData: [
        { fault: "InternalCommunicationFault", msg: "Battery Fault: Internal Communication", severity: "high", type: "battery" },
        { fault: "InternalConverversionFault", msg: "Battery Fault: Internal Conversion", severity: "high", type: "battery" },
        { fault: "WeakCellFault", msg: "Battery Fault: Weak Cell", severity: "high", type: "battery" },
        { fault: "LowCellVoltageFault", msg: "Battery Fault: Low Cell Voltage", severity: "mid",  type: "battery" },
        { fault: "OpenWiringFault", msg: "Battery Fault: Open Wiring", severity: "mid",  type: "battery" },
        { fault: "CurrentSensorFault", msg: "Battery Fault: Current Sensor", severity: "mid", type: "battery" },
        { fault: "PackVoltageSensorFault", msg: "Battery Fault: Pack Voltage Sensor", severity: "mid", type: "battery" },
        { fault: "VoltageRedundancyFault", msg: "Battery Fault: Voltage Redundancy", severity: "low", type: "battery" },
        { fault: "FanMonitorFault", msg: "Battery Fault: Fan Monitor", severity: "low", type: "battery" },
        { fault: "ThermistorFault", msg: "Battery Fault: Thermistor", severity: "low", type: "battery" },
        { fault: "CanbusCommunicationFault", msg: "Battery Fault: CANBUS Communications", severity: "low", type: "battery" },
        { fault: "AlwaysOnSupplyFault", msg: "Battery Fault: Always On Supply", severity: "mid", type: "battery" },
        { fault: "HighVoltageIsolationFault", msg: "Battery Fault: High Voltage Isolation", severity: "mid", type: "battery" },
        { fault: "PowerSupply12VFault", msg: "Battery Fault: Power Supply 12V", severity: "mid", type: "battery" },
        { fault: "ChargeLimitEnforcementFault",msg: "Battery Fault: Charge Limit Enforcement", severity: "low", type: "battery" },
        { fault: "DischargeLimitEnforcementFault", msg: "Battery Fault: Discharge Limit Enforcement", severity: "mid", type: "battery" },
        { fault: "ChargerSafetyRelayFault", msg: "Battery Fault: Charger Safety Relay", severity: "mid", type: "battery" }
    ]

    // External data source for battery faults
    property QtObject batteryObject: batteryFaults

    // The model backing the ListView
    ListModel { id: activeModel }

    // Queue + banner state
    property var pendingFaults: []
    property var displayedFault: null
    property bool bannerVisible: false
    property string bannerText: ""

    function showNextBanner() {
        if (pendingFaults.length > 0) {
            displayedFault = pendingFaults.shift()
            bannerText = displayedFault.msg
            bannerVisible = true
            bannerTimer.restart()
        }
    }

    Timer {
        id: bannerTimer
        interval: 2000; repeat: false
        onTriggered: {
            bannerVisible = false
            if (displayedFault) {
                // insert into activeModel in severity order
                var idx = 0
                var sev = displayedFault.severity
                if (sev === "high") {
                    while (idx < activeModel.count && activeModel.get(idx).severity === "high")
                        idx++
                } else if (sev === "mid") {
                    while (idx < activeModel.count) {
                        var s = activeModel.get(idx).severity
                        if (s === "high" || s === "mid") idx++
                        else break
                    }
                } else {
                    idx = activeModel.count
                }
                activeModel.insert(idx, {
                    fault: displayedFault.fault,
                    msg: displayedFault.msg,
                    severity: displayedFault.severity,
                    type: displayedFault.type
                })
                displayedFault = null
            }
            Qt.callLater(showNextBanner)
        }
    }

    // Central handler for all fault-changed signals
    function onFaultChanged(desc) {
        // Determine actual boolean
        var isActive = !!(
                (desc.type === "battery" ? batteryObject
                 : desc.type === "motor0" ? motor0Object
                 : motor1Object
                )[desc.fault]
            );
        if (isActive) {
            pendingFaults.push(desc)
            if (!bannerVisible && !displayedFault)
                showNextBanner()
        } else {
            // remove from queue
            for (var q = pendingFaults.length - 1; q >= 0; --q) {
                if (pendingFaults[q].fault === desc.fault) {
                    pendingFaults.splice(q,1)
                }
            }
            // cancel banner if showing
            if (displayedFault && displayedFault.fault === desc.fault) {
                bannerVisible = false
                displayedFault = null
            }
            // remove from list
            for (var j = 0; j < activeModel.count; ++j) {
                if (activeModel.get(j).fault === desc.fault) {
                    activeModel.remove(j)
                    break
                }
            }
        }
    }

    // Wire up each fault’s Changed signal to onFaultChanged() on complete
    Component.onCompleted: {
        for (var i = 0; i < faultsData.length; ++i) {
            (function(descriptor) {
                var source = descriptor.type === "battery"
                     ? batteryObject
                     // if you add motor0/motor1 types later:
                     : descriptor.type === "motor0" ? motor0Object
                     : motor1Object

                var sig = "on" + descriptor.fault + "Changed";
                if (source && source[sig]) {
                    source[sig].connect(function() {
                        faultsDisplayContainer.onFaultChanged(descriptor)
                    })
                }
            })(faultsData[i])
        }
    }

    // Collapsible banner
    Rectangle {
        id: bannerArea
        anchors { top: parent.top; left: parent.left; right: parent.right }
        height: bannerVisible ? 60 : 0
        radius: 8
        clip: true
        color: displayedFault ? (displayedFault.severity === "high" ? "#FC1313"
            : displayedFault.severity === "mid"  ? "#F6EC93"
            : "white")
            : "#666666"

        Behavior on height { NumberAnimation { duration: 300; easing.type: Easing.OutQuad } }

        Row {
            anchors.fill: parent
            anchors.margins: 12
            spacing: 8

            opacity: bannerVisible ? 1 : 0
            Behavior on opacity { NumberAnimation { duration: 300; easing.type: Easing.OutQuad } }

            SequentialAnimation on scale {
                loops: Animation.Infinite
                running: bannerVisible
                NumberAnimation { from: 1.0;  to: 1.05; duration: 600; easing.type: Easing.InOutQuad }
                NumberAnimation { from: 1.05; to: 1.0;  duration: 600; easing.type: Easing.InOutQuad }
            }

            Text {
                text: bannerText
                font.pixelSize: 20
                color: bannerVisible
                    ? (displayedFault.severity === "high" ? "white" : "black")
                    : "transparent"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment:   Text.AlignVCenter
                width: parent.width
                height: parent.height
            }
        }
    }

    // Auto-scrolling ListView
    ListView {
        id: listView
        anchors { top: bannerArea.bottom; left: parent.left; right: parent.right; bottom: parent.bottom }
        model: activeModel
        interactive: false
        clip: true

        Behavior on contentY { NumberAnimation { duration: 2000; easing.type: Easing.Linear } }

        Timer {
            id: scrollTimer
            interval: 2000
            repeat: true
            // timer only runs when there’s more faults than will fit on screen
            running: activeModel.count > faultsOnView
            property int faultsOnView: Math.floor(faultsDisplayContainer.height / delegateHeight)
            onTriggered: {
                var newY = listView.contentY + delegateHeight
                var maxY = (activeModel.count - faultsOnView) * delegateHeight
                listView.contentY = newY > maxY ? 0 : newY
            }
        }

        delegate: FaultsMessage {
            type: model.type
            severity: model.severity
            msg: model.msg
            width: listView.width
            height: delegateHeight
        }

        add: Transition {
            NumberAnimation { property: "x"; from: width; to: 0; duration: 300; easing.type: Easing.OutBack }
            NumberAnimation { property: "opacity"; from: 0; to: 1; duration: 300 }
        }
        remove: Transition {
            NumberAnimation { property: "x"; to: width; duration: 300; easing.type: Easing.InQuad }
            NumberAnimation { property: "opacity"; to: 0; duration: 300 }
        }
    }
}
