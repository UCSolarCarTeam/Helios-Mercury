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
        { fault: "StrobeBmsLight", msg: "Strobe SOS", severity: "bps", type: "mbms"},
        { fault: "ChargeEnable", msg: "OBMS Charge Disabled", severity: "warn", type: "mbms"},
        { fault: "DischargeEnable", msg: "OBMS Discharge Disabled", severity: "warn", type: "mbms"},
        { fault: "HighCellVoltageTrip", msg: "High Cell Voltage Trip", severity: "bps", type: "mbms"},
        { fault: "LowCellVoltageTrip", msg: "Low Cell Voltage Trip", severity: "bps", type: "mbms"},
        { fault: "CommonHighCurrentTrip", msg: "Common High Current Trip", severity: "bps", type: "mbms"},
        { fault: "MotorHighCurrentTrip", msg: "Motor High Current Trip", severity: "bps", type: "mbms"},
        { fault: "ArrayHighCurrentTrip", msg: "Array High Current Trip", severity: "bps", type: "mbms"},
        { fault: "LvHighCurrentTrip", msg: "LV High Current Trip", severity: "bps", type: "mbms"},
        { fault: "ChargeHighCurrentTrip", msg: "Charge High Current Trip", severity: "bps", type: "mbms"},
        { fault: "ProtectionTrip", msg: "Protection Trip", severity: "bps", type: "mbms"},
        { fault: "OrionMessageTimeoutTrip", msg: "Orion Message Timeout Trip", severity: "bps", type: "mbms"},
        { fault: "ContactorDisconnectedUnexpectedlyTrip", msg: "Contactor Disconnected Unexpectedly Trip", severity: "bps", type: "mbms"},
        { fault: "ContactorConnectedUnexpectedlyTrip", msg: "Contactor Connected Unexpectely Trip", severity: "bps", type: "mbms"},
        { fault: "CommonHeartbeatDeadTrip", msg: "Common Heartbeat Dead Trip", severity: "bps", type: "mbms"},
        { fault: "MotorHeartbeatDeadTrip", msg: "Motor Heartbeat Dead Trip", severity: "bps", type: "mbms"},
        { fault: "ArrayHeartbeatDeadTrip", msg: "Array Heartbeat Dead Trip", severity: "bps", type: "mbms"},
        { fault: "LvHeartbeatDeadTrip", msg: "LV Heartbeat Dead Trip", severity: "bps", type: "mbms"},
        { fault: "ChargeHeartbeatDeadTrip", msg: "Charge Heartbeat Dead Trip", severity: "bps", type: "mbms"},
        { fault: "MpsDisabledTrip", msg: "MPS Disabled Trip", severity: "warn", type: "mbms"},
        { fault: "EsdEnabledTrip", msg: "ESD Enabled Trip", severity: "bps", type: "mbms"},
        { fault: "HighTemperatureTrip", msg: "High Temperature Trip", severity: "bps", type: "mbms"},
        { fault: "LowTemperatureTrip", msg: "Low Temperature Trip", severity: "bps", type: "mbms"},
        { fault: "HighCellVoltageWarning", msg: "High Cell Voltage Warning", severity: "error", type: "mbms"},
        { fault: "LowCellVoltageWarning", msg: "Low Cell Voltage Warning", severity: "error", type: "mbms"},
        { fault: "CommonHighCurrentWarning", msg: "Common High Current Warning", severity: "error", type: "mbms"},
        { fault: "MotorHighCurrentWarning", msg: "Motor High Current Warning", severity: "error", type: "mbms"},
        { fault: "ArrayHighCurrentWarning", msg: "Array High Current Warning", severity: "error", type: "mbms"},
        { fault: "LvHighCurrentWarning", msg: "LV High Current Warning", severity: "error", type: "mbms"},
        { fault: "ChargeHighCurrentWarning", msg: "Charge HIgh Current Warning", severity: "error", type: "mbms"},
        { fault: "HighTemperatureWarning", msg: "High Temperature Warning", severity: "error", type: "mbms"},
        { fault: "LowTemperatureWarning", msg: "Low Temperature Warning", severity: "error", type: "mbms"},
        { fault: "CommonContactorError", msg: "Common Contactor Failed to Close", severity: "error", type: "contactor"},
        { fault: "CommonContactorOpeningError", msg: "Common Contactor Failed to Open", severity: "error", type: "contactor"},
        { fault: "MotorContactorError", msg: "Motor Contactor Failed to Close", severity: "error", type: "contactor"},
        { fault: "MotorBPSError", msg: "Motor Contactor Failed to Open", severity: "error", type: "contactor"},
        { fault: "ArrayContactorError", msg: "Array Contactor Failed to Close", severity: "error", type: "contactor"},
        { fault: "ArrayBPSError", msg: "Array Contactor Failed to Open", severity: "error", type: "contactor"},
        { fault: "LvContactorError", msg: "LV Contactor Failed to Close", severity: "error", type: "contactor"},
        { fault: "LvBpsError", msg: "LV Contactor Failed to Open", severity: "error", type: "contactor"},
        { fault: "ChargeContactorError", msg: "Charge Contactor Failed to Close", severity: "error", type: "contactor"},
        { fault: "ChargeBPSError", msg: "Charge Contactor Failed to Open", severity: "error", type: "contactor"},
        { fault: "LimitFlags", msg: "Motor 0 Hardware Over Current", severity: "error", type: "motor0"},   
        { fault: "ErrorFlags", msg: "Motor 0 Software Over Current", severity: "error", type: "motor0"}, 
        { fault: "ActiveMotor", msg: "Motor 0 DC Bus Over Voltage", severity: "error", type: "motor0"}, 
        { fault: "TxErrorCount", msg: "Bad Motor 0 Position Hall Sequence", severity: "error", type: "motor0"}, 
        { fault: "LimitFlags", msg: "Motor 1 Hardware Over Current", severity: "error", type: "motor1"}, 
        { fault: "ErrorFlags", msg: "Motor 1 Software Over Current", severity: "error", type: "motor1"}, 
        { fault: "ActiveMotor", msg: "Motor 1 DC Bus Over Voltage", severity: "error", type: "motor1"},         
        { fault: "TxErrorCount", msg: "Bad Motor 1 Position Hall Sequence", severity: "error", type: "motor1"}              
    ]
    //TODO: add levels as needed
    //TODO: completely replace info/warn/error with number values or enum
    property var severityRankings : {
        "error": 0,
        "warn": 1,
        "info": 2,
        "bps": 3
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

        color: displayedFault ? (displayedFault.severity === "error" ? "#FC1313"
            : displayedFault.severity === "warn"  ? "#F6EC93"
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
                    ? (displayedFault.severity === "error" ? "white" : "black")
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
