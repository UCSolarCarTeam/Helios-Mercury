// FaultsDisplayContainer.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import Mercury

Rectangle {
    id: faultsDisplayContainer
    width: 426
    height: 175
    color: "transparent"

    property int delegateHeight: 33

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
        { fault: "ErrorFlags", msg: "Motor 0 Hardware Over Current", severity: "error", type: "motorDetails0", bit: 0},   
        { fault: "ErrorFlags", msg: "Motor 0 Software Over Current", severity: "error", type: "motorDetails0", bit: 1}, 
        { fault: "ErrorFlags", msg: "Motor 0 DC Bus Over Voltage", severity: "error", type: "motorDetails0", bit: 2}, 
        { fault: "ErrorFlags", msg: "Bad Motor 0 Position Hall Sequence", severity: "error", type: "motorDetails0", bit: 3}, 
        { fault: "ErrorFlags", msg: "Motor 1 Hardware Over Current", severity: "error", type: "motorDetails1", bit: 0}, 
        { fault: "ErrorFlags", msg: "Motor 1 Software Over Current", severity: "error", type: "motorDetails1", bit: 1}, 
        { fault: "ErrorFlags", msg: "Motor 1 DC Bus Over Voltage", severity: "error", type: "motorDetails1", bit: 2},         
        { fault: "ErrorFlags", msg: "Bad Motor 1 Position Hall Sequence", severity: "error", type: "motorDetails1", bit: 3}              
    ]
    
    property var severityRankings : {
        "info": 0,
        "warn": 1,
        "error": 2,
        "bps": 3
    }

    ListModel { id: activeModel }

    property var pendingFaults: []
    property var displayedFault: null
    property string bannerText: ""
    property bool showingBpsFault: false 

    function showNextBanner() {
        if (showingBpsFault) {
            return;
        }
        
        if (pendingFaults.length > 0) {
            displayedFault = pendingFaults.shift()
            bannerText = displayedFault.msg
            
            if (displayedFault.severity === "bps") {
                showingBpsFault = true
            } else {
                bannerTimer.restart()
            }
        }
    }

    Timer {
        id: bannerTimer
        interval: 2000
        repeat: false
        onTriggered: {
            if (displayedFault) {
                if (displayedFault.severity !== "bps") {
                    var placementIndex = 0;
                    var severityRank = severityRankings[displayedFault.severity];
                    
                    while(placementIndex < activeModel.count){
                        const currentRank = severityRankings[activeModel.get(placementIndex).severity];
                        if(currentRank > severityRank) break;
                        placementIndex++;
                    }
                    
                    activeModel.insert(placementIndex, displayedFault);
                    
                    displayedFault = null;
                    
                    if (!showingBpsFault) {
                        Qt.callLater(showNextBanner)
                    }
                }
            }
        }
    }

    function onFaultChanged(fault, isActive) {
        if (isActive) {
            if (fault.severity === "bps") {
                if (displayedFault && displayedFault.severity !== "bps") {
                    pendingFaults.unshift(displayedFault) 
                }
                
                displayedFault = fault;
                bannerText = fault.msg;
                showingBpsFault = true;
                
                bannerTimer.stop();
            } else {
                if (showingBpsFault) {
                    var index = 0;
                    var rank = severityRankings[fault.severity];
                    while(index < activeModel.count){
                        const current = severityRankings[activeModel.get(index).severity];
                        if(current > rank) break;
                        index++;
                    }
                    activeModel.insert(index, fault);
                } else {
                    pendingFaults.push(fault);
                    if (!displayedFault) showNextBanner();
                }
            }
        } else {
            pendingFaults = pendingFaults.filter(pendingFault => 
                pendingFault.fault !== fault.fault
            );

            if (fault.severity === "bps") {
                if (displayedFault?.fault === fault.fault) {
                    displayedFault = null;
                    showingBpsFault = false;
                    Qt.callLater(showNextBanner);
                }
            } else {
                if (displayedFault?.fault === fault.fault) {
                    displayedFault = null;
                    if (!showingBpsFault) {
                        Qt.callLater(showNextBanner);
                    }
                }
            }

            for (var i = 0; i < activeModel.count; ++i) {
                if (activeModel.get(i).fault === fault.fault) {
                    activeModel.remove(i);
                    break;
                }
            }
        }
    }

    Component.onCompleted: {
        for(let fault of faultsData){
            let sourceContext = null;

            if(fault.type === "batteryFaults") sourceContext = batteryFaults;
            else if (fault.type === "mbms") sourceContext = mbms;
            else if (fault.type === "motorDetails0") sourceContext = motorDetails0;
            else if (fault.type === "motorDetails1") sourceContext = motorDetails1;
            else if (fault.type === "contactor") sourceContext = contactor;

            if (fault.bit !== undefined) {
                sourceContext["on" + fault.fault + "Changed"].connect(function(){
                    const errorFlags = sourceContext[fault.fault];
                    const bitActive = (errorFlags & (1 << fault.bit)) !== 0;
                    onFaultChanged(fault, bitActive);
                });
            } else {
                sourceContext["on" + fault.fault + "Changed"].connect(function(){
                    onFaultChanged(fault, sourceContext[fault.fault]);
                });
            }
        }
    }

    Rectangle {
        id: bpsFullScreen
        anchors.fill: parent
        color: Config.valueHigh
        visible: displayedFault && displayedFault.severity === "bps"
        radius: 8
        z: 10 
        
        SequentialAnimation on scale {
            running: true
            loops: Animation.Infinite
            NumberAnimation { from: 0.8; to: 1.1; duration: 800; easing.type: Easing.InOutQuad }
            NumberAnimation { from: 1.1; to: 0.8; duration: 800; easing.type: Easing.InOutQuad }
        }

        Text {
            anchors.centerIn: parent
            text: bannerText
            font.pixelSize: Config.fontSize6
            font.bold: true
            color: Config.fontColor
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            width: parent.width - 40
            wrapMode: Text.WordWrap
            maximumLineCount: 3
            elide: Text.ElideRight
        }
    }

    Rectangle {
        id: bannerArea
        anchors { 
            top: parent.top; 
            left: parent.left; 
            right: parent.right 
        }
        height: (displayedFault && displayedFault.severity !== "bps") ? 60 : 0
        radius: 8
        clip: true
        z: 5

        color: displayedFault ? (displayedFault.severity === "error" ? Config.valueHigh :
               displayedFault.severity === "warn"  ? Config.valueModerate :
               displayedFault.severity === "info"  ? Config.valueLow :
               Config.fontColor) : Config.faintGrey

        Behavior on height { NumberAnimation { duration: 300; easing.type: Easing.OutQuad } }

        Item {
            anchors.fill: parent
            anchors.margins: 12

            opacity: displayedFault ? 1 : 0
            Behavior on opacity { NumberAnimation { duration: 300; easing.type: Easing.OutQuad } }

            Text {
                anchors.centerIn: parent
                text: bannerText
                font.pixelSize: Config.fontSize5
                color: Config.fontColor 
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                width: parent.width
                wrapMode: Text.WordWrap
                maximumLineCount: 2
                elide: Text.ElideRight
            }
        }
    }

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
        visible: !(displayedFault && displayedFault.severity === "bps")

        Behavior on contentY { NumberAnimation { duration: 2000; easing.type: Easing.Linear } }

        Timer {
            id: scrollTimer
            interval: 2000
            repeat: true

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
