import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: faultsDisplayContainer
    width: 426
    height: 175
    color: "transparent"

    // Height for fault boxes
    property int delegateHeight: 33

    // Faults list    
    // TODO: Add more fault sources later
    property var faultsData: [
                { fault: "InternalCommunicationFault", msg: "Battery Fault: Internal Communication", severity: "high", type: "battery" },
                { fault: "InternalConverversionFault",  msg: "Battery Fault: Internal Conversion",    severity: "high", type: "battery" },
                { fault: "WeakCellFault",               msg: "Battery Fault: Weak Cell",              severity: "high", type: "battery" },
                { fault: "LowCellVoltageFault",         msg: "Battery Fault: Low Cell Voltage",      severity: "mid", type: "battery" },
                { fault: "OpenWiringFault",             msg: "Battery Fault: Open Wiring",           severity: "mid", type: "battery" },
                { fault: "CurrentSensorFault",          msg: "Battery Fault: Current Sensor",        severity: "mid", type: "battery" },
                { fault: "PackVoltageSensorFault",      msg: "Battery Fault: Pack Voltage Sensor",   severity: "mid", type: "battery" },
                { fault: "VoltageRedundancyFault",      msg: "Battery Fault: Voltage Redundancy",    severity: "low", type: "battery" },
                { fault: "FanMonitorFault",             msg: "Battery Fault: Fan Monitor",           severity: "low", type: "battery" },
                { fault: "ThermistorFault",             msg: "Battery Fault: Thermistor",            severity: "low", type: "battery" },
                { fault: "CanbusCommunicationFault",    msg: "Battery Fault: CANBUS Communications", severity: "low", type: "battery" },
                { fault: "AlwaysOnSupplyFault",         msg: "Battery Fault: Always On Supply",      severity: "mid", type: "battery" },
                { fault: "HighVoltageIsolationFault",   msg: "Battery Fault: High Voltage Isolation",severity: "mid", type: "battery" },
                { fault: "PowerSupply12VFault",         msg: "Battery Fault: Power Supply 12V",      severity: "mid", type: "battery" },
                { fault: "ChargeLimitEnforcementFault", msg: "Battery Fault: Charge Limit Enforcement", severity: "low", type: "battery" },
                { fault: "DischargeLimitEnforcementFault", msg: "Battery Fault: Discharge Limit Enforcement", severity: "mid", type: "battery" },
                { fault: "ChargerSafetyRelayFault",     msg: "Battery Fault: Charger Safety Relay",  severity: "mid", type: "battery" },
            ]

    // The ListModel that feeds the ListView
    ListModel { id: activeModel }

    // Queue for new faults and banner state
    property var pendingFaults: []
    property var displayedFault: null
    property string bannerText: ""
    property bool bannerVisible: false

    // Handle transition to next banner
    function showNextBanner() {
        if (pendingFaults.length > 0) {
            displayedFault = pendingFaults.shift()
            bannerText = displayedFault.msg
            bannerVisible = true
            bannerTimer.restart()
        }
    }

    // Banner hide timer insert by severity order
    Timer {
        id: bannerTimer
        interval: 2000
        repeat: false
        onTriggered: {
            bannerVisible = false
            if (displayedFault) {
                // determine insertion index based on severity
                var idx = 0
                var sev = displayedFault.severity
                if (sev === "high") {
                    // after existing highs
                    for (var i = 0; i < activeModel.count; ++i) {
                        if (activeModel.get(i).severity === "high")
                            idx++
                        else
                            break
                    }
                } else if (sev === "mid") {
                    // after highs + mids
                    for (var i = 0; i < activeModel.count; ++i) {
                        var s = activeModel.get(i).severity
                        if (s === "high" || s === "mid")
                            idx++
                        else
                            break
                    }
                } else {
                    // low or default at end
                    idx = activeModel.count
                }
                // insert the fault at the computed index
                activeModel.insert(idx, {
                    fault: displayedFault.fault,
                    msg:    displayedFault.msg,
                    severity:       displayedFault.severity,
                    type:      displayedFault.type
                })
                displayedFault = null
            }
            Qt.callLater(showNextBanner)
        }
    }

    // // Poll faultsData queue new or remove old faults
    //TODO: implement alternative to timer - each fault emits a signal when it is changed
    Timer {
        id: updateTimer
        interval: 200
        running: true
        repeat: true
        onTriggered: {
            // checks through fault database, finds which are active
            for (var i = 0; i < faultsData.length; ++i) {
                var f = faultsData[i]
                var inModel = false
                for (var j = 0; j < activeModel.count; ++j)
                    if (activeModel.get(j).fault === f.fault)
                        inModel = true

                var inQueue = pendingFaults.some(function(q) { return q.fault === f.fault })
                var isDisplaying = displayedFault && displayedFault.fault === f.fault
                var active = batteryFaults[f.fault]

                if (active && !inModel && !inQueue && !isDisplaying) {
                    pendingFaults.push(f)
                    if (!bannerVisible && !displayedFault)
                        showNextBanner()
                } else if (!active) {
                    // remove from model
                    for (var m = 0; m < activeModel.count; ++m) {
                        if (activeModel.get(m).fault === f.fault) {
                            activeModel.remove(m)
                            break
                        }
                    }
                    // remove from queue
                    pendingFaults = pendingFaults.filter(function(q){ return q.fault !== f.fault })
                    // cancel banner if showing
                    if (isDisplaying) {
                        bannerVisible = false
                        displayedFault = null
                    }
                }
            }
        }
    }

    // Collapsible banner at top
    Rectangle {
        id: bannerArea
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: bannerVisible ? 60 : 0
        radius: 8
        color: displayedFault
               ? (displayedFault.severity === "high" ? "#FC1313"
                  : displayedFault.severity === "mid"  ? "#F6EC93"
                                                        : "white")
               : "#666666"
        clip: true

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
                NumberAnimation { from: 1;    to: 1.05; duration: 600; easing.type: Easing.InOutQuad }
                NumberAnimation { from: 1.05; to: 1;    duration: 600; easing.type: Easing.InOutQuad }
            }

            Text {
                text: bannerText
                font.pixelSize: 20
                color: bannerVisible
                       ? (displayedFault.severity === "high" ? "white" : "black")
                       : "transparent"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment:   Text.AlignVCenter
                height: parent.height
                width: parent.width
            }
        }
    }

    // Auto‑scrolling list below the banner
    ListView {
        id: listView
        anchors.top: bannerArea.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        model: activeModel
        interactive: false
        clip: true

        Behavior on contentY { NumberAnimation { duration: 2000; easing.type: Easing.Linear } }

        // Handles scroll behaviour
        Timer {
            id: scrollTimer
            interval: 2000
            running: true //TODO: should only run if scroll is needed
            repeat: true
            property int faultsOnView: faultsDisplayContainer.height / delegateHeight
            onTriggered: {
                if (activeModel.count >= faultsOnView + 1) {
                    var newY = listView.contentY + delegateHeight;
                    if (newY > (activeModel.count - faultsOnView) * delegateHeight)
                       newY = 0;
                    listView.contentY = newY;
                }   
            }
        }

        delegate: FaultsMessage {
            type: model.type
            severity: model.severity
            msg: model.msg
            width: listView.width
            height: delegateHeight
        }

        // Animations for faults when they become actice/inactive
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
