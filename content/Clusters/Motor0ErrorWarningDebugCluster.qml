import QtQuick 6.2
import QtQuick.Layouts
import QtQuick.Controls
import "../Components"
import Mercury

Item {
    id: motor0ErrorWarningDebugClusterDebugCluster
    width: 1920
    height: 550

    Backplate { 
        id: backplate
    }

    Text {
        id: motor0ErrorWarningLabel
        color: Config.fontColor
        font.family: Config.fontStyle
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 13
        }
        text: "Motor 0 Errors & Warnings"
        font.pixelSize: Config.debugHeaderFontSize
        font.weight: Font.Medium
    }

    // TODO: better faults/warnings display 
    // GridLayout { 
    //     id: motor0WarningFlagContainer
    //     columns: 6
    //     rows: 6
    //     rowSpacing: 2
    //     columnSpacing: 2
    //     Layout.alignment: Qt.AlignHCenter
    //     anchors {
    //         left: motor0ErrorWarningDebugClusterDebugCluster.left
    //         leftMargin: 115
    //         verticalCenter: motor0ErrorWarningDebugClusterDebugCluster.verticalCenter
    //     }
        
    //     Repeater {
    //         model: [
    //             { name: "Motor About\nTo Stall", isOn: motorDetails0.MotorAboutToStall },
    //             { name: "Delay in Reading\nTemp Sensor", isOn: motorDetails0.DelayInReadingTempSensor },
    //             { name: "Delay in Reading\nPos Sensor", isOn: motorDetails0.DelayInReadingPosSensor },
    //             { name: "Inverter 1\nTemp Very High", isOn: motorDetails0.Inverter1TempVeryHigh },
    //             { name: "Inverter 2\nTemp Very High", isOn: motorDetails0.Inverter2TempVeryHigh },
    //             { name: "Inverter 3\nTemp Very High", isOn: motorDetails0.Inverter3TempVeryHigh },
    //             { name: "Inverter 4\nTemp Very High", isOn: motorDetails0.Inverter4TempVeryHigh },
    //             { name: "Inverter 5\nTemp Very High", isOn: motorDetails0.Inverter5TempVeryHigh },
    //             { name: "Inverter 6\nTemp Very High", isOn: motorDetails0.Inverter6TempVeryHigh },
    //             { name: "CPU Temp\nVery High", isOn: motorDetails0.CpuTemperatureVeryHigh },
    //             { name: "Hall Temp\nVery High", isOn: motorDetails0.HallTemperatureVeryHigh },
    //             { name: "DCLINK Temp\nVery High", isOn: motorDetails0.DclinkTemperatureVeryHigh },
    //             { name: "Delay in DCLINK\nCommunication", isOn: motorDetails0.DelayInDclinkCommunication },
    //             { name: "Inverter 1 Over\nCurrent Warning", isOn: motorDetails0.Inverter1OverCurrentWarning },
    //             { name: "Inverter 2 Over\nCurrent Warning", isOn: motorDetails0.Inverter2OverCurrentWarning },
    //             { name: "Inverter 3 Over\nCurrent Warning", isOn: motorDetails0.Inverter3OverCurrentWarning },
    //             { name: "Inverter 4 Over\nCurrent Warning", isOn: motorDetails0.Inverter4OverCurrentWarning },
    //             { name: "Inverter 5 Over\nCurrent Warning", isOn: motorDetails0.Inverter5OverCurrentWarning },
    //             { name: "Inverter 6 Over\nCurrent Warning", isOn: motorDetails0.Inverter6OverCurrentWarning },
    //             { name: "DC Overvoltage\nWarning", isOn: motorDetails0.DcOvervoltageWarning },
    //             { name: "DC Undervoltage\nWarning", isOn: motorDetails0.DcUndervoltageWarning },
    //             { name: "CAN Comms\nTimeout", isOn: motorDetails0.CanCommsTimeout },
    //             { name: "Inverter 1\nFault Warning", isOn: motorDetails0.Inverter1FaultWarning },
    //             { name: "Inverter 2\nFault Warning", isOn: motorDetails0.Inverter2FaultWarning },
    //             { name: "Inverter 3\nFault Warning", isOn: motorDetails0.Inverter3FaultWarning },
    //             { name: "Inverter 4\nFault Warning", isOn: motorDetails0.Inverter4FaultWarning },
    //             { name: "Inverter 5\nFault Warning", isOn: motorDetails0.Inverter5FaultWarning },
    //             { name: "Inverter 6\nFault Warning", isOn: motorDetails0.Inverter6FaultWarning },
    //             { name: "CAN Send\nWarning", isOn: motorDetails0.CanSendWarning },
    //             { name: "Lost Frames on\nCAN Bus Warning", isOn: motorDetails0.LostFramesOnCanBusWarning },
    //             { name: "Overspeed\nWarning", isOn: motorDetails0.OverspeedWarning },
    //             { name: "CPU\nOverload", isOn: motorDetails0.CpuOverload },
    //             { name: "Torque\nLimited", isOn: motorDetails0.TorqueLimited },
    //             { name: "Start at\nHigh RPM", isOn: motorDetails0.StartAtHighRpm }
    //         ]
            
    //         delegate: Item {
    //             id: motor0WarningFlagFrame
    //             height: 60
    //             width: 117
                
    //             Text {
    //                 id: motor0WarningFlagTitle
    //                 text: modelData.name
    //                 font.pixelSize: Config.contactorLabelFontSize
    //                 horizontalAlignment: Text.AlignHCenter
    //                 verticalAlignment: Text.AlignVCenter
    //                 font.family: Config.fontStyle
    //                 color: Config.fontColor
    //                 anchors.bottom: WarningFlagIcon.top
    //                 anchors.bottomMargin: 2
    //                 anchors.horizontalCenter: parent.horizontalCenter
    //             }
                
    //             DashIcon {
    //                 id: motor0WarningFlagIcon
    //                 width: 20
    //                 height: 20
    //                 imageSource: modelData.isOn ? "../Images/MpptMbmsStatusOn.png" : "../Images/MpptMbmsStatusOff.png"
    //                 iconMaskColor: modelData.isOn ? Config.contactorConnectedColor : Config.contactorDisconnectedColor
    //                 anchors.bottom: parent.bottom
    //                 anchors.horizontalCenter: parent.horizontalCenter
    //                 anchors.bottomMargin: 2
    //             }
    //         }
    //     }
    // }

    // GridLayout { 
    //     id: motor0ErrorFlagContainer
    //     columns: 7
    //     rows: 6
    //     rowSpacing: 2
    //     columnSpacing: 2
    //     Layout.alignment: Qt.AlignHCenter
    //     anchors {
    //         right: motor0ErrorWarningDebugClusterDebugCluster.right
    //         rightMargin: 115
    //         verticalCenter: motor0ErrorWarningDebugClusterDebugCluster.verticalCenter
    //     }
        
    //     Repeater {
    //         model: [
    //             { name: "Init\nError", isOn: motorDetails0.InitError },
    //             { name: "Settings\nNot Found", isOn: motorDetails0.SettingsNotFound },
    //             { name: "Motor\nStalled", isOn: motorDetails0.MotorStalled },
    //             { name: "Controller Data\nReading Timeout", isOn: motorDetails0.ControllerDataReadingTimeout },
    //             { name: "Invalid Hall\nSensor Sequence", isOn: motorDetails0.InvalidHallSensorSequence },
    //             { name: "Invalid\nHall Sector", isOn: motorDetails0.InvalidHallSector },
    //             { name: "Error Reading\nTemp Sensor", isOn: motorDetails0.ErrorReadingTempSensor },
    //             { name: "Position Sensor\nReading Error", isOn: motorDetails0.PositionSensorReadingError },
    //             { name: "Error Reading\nEncoder", isOn: motorDetails0.ErrorReadingEncoder },
    //             { name: "Zero Position\nOffset Not Set", isOn: motorDetails0.ZeroPositionOffsetNotSet },
    //             { name: "HW Enable\nNot Set", isOn: motorDetails0.HwEnableNotSet },
    //             { name: "Inverter 1\nTemp Too High", isOn: motorDetails0.Inverter1TempTooHigh },
    //             { name: "Inverter 2\nTemp Too High", isOn: motorDetails0.Inverter2TempTooHigh },
    //             { name: "Inverter 3\nTemp Too High", isOn: motorDetails0.Inverter3TempTooHigh },
    //             { name: "Inverter 4\nTemp Too High", isOn: motorDetails0.Inverter4TempTooHigh },
    //             { name: "Inverter 5\nTemp Too High", isOn: motorDetails0.Inverter5TempTooHigh },
    //             { name: "Inverter 6\nTemp Too High", isOn: motorDetails0.Inverter6TempTooHigh },
    //             { name: "CPU Temp\nToo High", isOn: motorDetails0.CpuTemperatureTooHigh },
    //             { name: "Hall Temp\nToo High", isOn: motorDetails0.HallTemperatureTooHigh },
    //             { name: "DCLINK Temp\nToo High", isOn: motorDetails0.DclinkTemperatureTooHigh },
    //             { name: "Error in DCLINK\nCommunication", isOn: motorDetails0.ErrorInDclinkCommunication},
    //             { name: "Inverter 1\nOvercurrent Error", isOn: motorDetails0.Inverter1OvercurrentError },
    //             { name: "Inverter 2\nOvercurrent Error", isOn: motorDetails0.Inverter2OvercurrentError },
    //             { name: "Inverter 3\nOvercurrent Error", isOn: motorDetails0.Inverter3OvercurrentError },
    //             { name: "Inverter 4\nOvercurrent Error", isOn: motorDetails0.Inverter4OvercurrentError },
    //             { name: "Inverter 5\nOvercurrent Error", isOn: motorDetails0.Inverter5OvercurrentError },
    //             { name: "Inverter 6\nOvercurrent Error", isOn: motorDetails0.Inverter6OvercurrentError },
    //             { name: "DC Overvoltage\nError", isOn: motorDetails0.DcOvervoltageError },
    //             { name: "DC Undervoltage\nError", isOn: motorDetails0.DcUndervoltageError },
    //             { name: "Double CAN\nID On Bus", isOn: motorDetails0.DoubleCanIdOnBus },
    //             { name: "CAN Comms\nTimeout Error", isOn: motorDetails0.CanCommsTimeoutError },
    //             { name: "Inverter 1\nFault Error", isOn: motorDetails0.Inverter1FaultError },
    //             { name: "Inverter 2\nFault Error", isOn: motorDetails0.Inverter2FaultError },
    //             { name: "Inverter 3\nFault Error", isOn: motorDetails0.Inverter3FaultError },
    //             { name: "Inverter 4\nFault Error", isOn: motorDetails0.Inverter4FaultError },
    //             { name: "Inverter 5\nFault Error", isOn: motorDetails0.Inverter5FaultError },
    //             { name: "Inverter 6\nFault Error", isOn: motorDetails0.Inverter6FaultError },
    //             { name: "CAN Send\nError", isOn: motorDetails0.CanSendError },
    //             { name: "Lost Frames on\nCAN Bus Error", isOn: motorDetails0.LostFramesOnCanBusError },
    //             { name: "Overspeed\nError", isOn: motorDetails0.OverspeedError },
    //             { name: "CPU\nOverloaded", isOn: motorDetails0.CpuOverloaded }               
    //         ]
            
    //         delegate: Item {
    //             id: motor0ErrorFlagFrame
    //             height: 60
    //             width: 117
                
    //             Text {
    //                 id: motor0ErrorFlagTitle
    //                 text: modelData.name
    //                 font.pixelSize: Config.contactorLabelFontSize
    //                 horizontalAlignment: Text.AlignHCenter
    //                 verticalAlignment: Text.AlignVCenter
    //                 font.family: Config.fontStyle
    //                 color: Config.fontColor
    //                 anchors.bottom: ErrorFlagIcon.top
    //                 anchors.bottomMargin: 2
    //                 anchors.horizontalCenter: parent.horizontalCenter
    //             }
                
    //             DashIcon {
    //                 id: motor0ErrorFlagIcon
    //                 width: 20
    //                 height: 20
    //                 imageSource: modelData.isOn ? "../Images/MpptMbmsStatusOn.png" : "../Images/MpptMbmsStatusOff.png"
    //                 iconMaskColor: modelData.isOn ? Config.contactorConnectedColor : Config.contactorDisconnectedColor
    //                 anchors.bottom: parent.bottom
    //                 anchors.horizontalCenter: parent.horizontalCenter
    //                 anchors.bottomMargin: 2
    //             }
    //         }
    //     }
    // }
}
