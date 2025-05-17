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
        { fault: "InternalCommunicationFault", msg: "Battery Fault: Internal Communication", severity: "high", type: "batteryFaults" },
        { fault: "InternalConverversionFault", msg: "Battery Fault: Internal Conversion", severity: "high", type: "batteryFaults" },
        { fault: "WeakCellFault", msg: "Battery Fault: Weak Cell", severity: "high", type: "batteryFaults" },
        { fault: "LowCellVoltageFault", msg: "Battery Fault: Low Cell Voltage", severity: "mid",  type: "batteryFaults" },
        { fault: "OpenWiringFault", msg: "Battery Fault: Open Wiring", severity: "mid",  type: "batteryFaults" },
        { fault: "CurrentSensorFault", msg: "Battery Fault: Current Sensor", severity: "mid", type: "batteryFaults" },
        { fault: "PackVoltageSensorFault", msg: "Battery Fault: Pack Voltage Sensor", severity: "mid", type: "batteryFaults" },
        { fault: "VoltageRedundancyFault", msg: "Battery Fault: Voltage Redundancy", severity: "low", type: "batteryFaults" },
        { fault: "FanMonitorFault", msg: "Battery Fault: Fan Monitor", severity: "low", type: "batteryFaults" },
        { fault: "ThermistorFault", msg: "Battery Fault: Thermistor", severity: "low", type: "batteryFaults" },
        { fault: "CanbusCommunicationFault", msg: "Battery Fault: CANBUS Communications", severity: "low", type: "batteryFaults" },
        { fault: "AlwaysOnSupplyFault", msg: "Battery Fault: Always On Supply", severity: "mid", type: "batteryFaults" },
        { fault: "HighVoltageIsolationFault", msg: "Battery Fault: High Voltage Isolation", severity: "mid", type: "batteryFaults" },
        { fault: "PowerSupply12VFault", msg: "Battery Fault: Power Supply 12V", severity: "mid", type: "batteryFaults" },
        { fault: "ChargeLimitEnforcementFault",msg: "Battery Fault: Charge Limit Enforcement", severity: "low", type: "batteryFaults" },
        { fault: "DischargeLimitEnforcementFault", msg: "Battery Fault: Discharge Limit Enforcement", severity: "mid", type: "batteryFaults" },
        { fault: "ChargerSafetyRelayFault", msg: "Battery Fault: Charger Safety Relay", severity: "mid", type: "batteryFaults" },
        { fault: "HighCellVoltageTrip", msg: "MBMS SAMPLE ERROR", severity: "mid", type: "mbms" }
    ]

    //TODO: add levels as needed
    //TODO: completely replace low/mid/high with number values or enum
    property var severityRankings : {
        "high": 0,
        "mid": 1,
        "low": 2
    }

    // The model backing the ListView
    ListModel { id: activeModel }

    // Queue + banner state
    property var pendingFaults: []
    property var displayedFault: null
    property string bannerText: ""

    function showNextBanner() {
        if (pendingFaults.length > 0) {
            displayedFault = pendingFaults.shift()
            bannerText = displayedFault.msg
            bannerTimer.restart()
        }
    }

    Timer {
        id: bannerTimer
        interval: 2000
        repeat: false
        onTriggered: {
            if (displayedFault) {
                var placementIndex = 0;
                var severityRank = severityRankings[displayedFault.severity];

                // Sort in the new fault in the correct place based on severity
                while(placementIndex < activeModel.count){
                    const currentRank = severityRankings[activeModel.get(placementIndex).severity];
                    if(currentRank > severityRank) break;
                    placementIndex++;
                }

                activeModel.insert(placementIndex, displayedFault);

                displayedFault = null;
            }
            Qt.callLater(showNextBanner)
        }
    }

    /*
        Handle the toggling of each defined fault
        - If the fault is active, add it to the pendingFaults and show the next banner
        - If the fault is inactive, remove it from pendingFaults and activeModel
    */
    function onFaultChanged(fault, isActive) {
        if (isActive) {
            pendingFaults.push(fault)
            if (!displayedFault) showNextBanner()
        } else {
            // remove from queue
            pendingFaults = pendingFaults.filter(function(pendingFault) {
                return pendingFault.fault !== fault.fault;
            });

            // cancel banner if showing
            if (displayedFault?.fault === fault.fault) displayedFault = null

            // remove from list
            for (var i = 0; i < activeModel.count; ++i) {
                if (activeModel.get(i).fault === fault.fault) {
                    activeModel.remove(i)
                    break
                }
            }
        }
    }

    // Wire up each fault’s Changed signal to onFaultChanged() on complete
    Component.onCompleted: {
        for(let fault of faultsData){
            let sourceContext = null;

            if(fault.type === "batteryFaults") sourceContext = batteryFaults;
            else if (fault.type === "mbms") sourceContext = mbms;

            sourceContext["on" + fault.fault + "Changed"].connect(function(){
                onFaultChanged(fault, sourceContext[fault.fault]);
            });
        }
    }

    // Collapsible banner
    Rectangle {
        id: bannerArea
        anchors { 
            top: parent.top; 
            left: parent.left; 
            right: parent.right 
        }
        height: displayedFault ? 60 : 0
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

            opacity: displayedFault ? 1 : 0
            Behavior on opacity { NumberAnimation { duration: 300; easing.type: Easing.OutQuad } }

            SequentialAnimation on scale {
                loops: Animation.Infinite
                running: displayedFault 
                NumberAnimation { from: 1.0;  to: 1.05; duration: 600; easing.type: Easing.InOutQuad }
                NumberAnimation { from: 1.05; to: 1.0;  duration: 600; easing.type: Easing.InOutQuad }
            }

            Text {
                text: bannerText
                font.pixelSize: 20
                color: displayedFault
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
        anchors { 
            top: bannerArea.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom 
        }
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
