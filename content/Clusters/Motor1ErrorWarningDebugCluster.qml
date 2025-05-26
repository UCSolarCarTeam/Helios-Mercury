import QtQuick 6.2
import QtQuick.Layouts
import QtQuick.Controls
import "../Components"
import Mercury

Item {
    id: motor1ErrorWarningDebugClusterDebugCluster
    width: Config.windowWidth
    width: Config.windowHeight

    Backplate { 
        id: backplate
    }

    Text {
        id: motor1ErrorWarningLabel
        color: Config.fontColor
        font.family: Config.fontStyle
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 13
        }
        text: "Motor 1 Errors & Warnings"
        font.pixelSize: Config.fontSize6
        font.weight: Font.Medium
    }

    // TODO: better faults/warnings display 
    // GridLayout { 
    //     id: motor1WarningFlagContainer
    //     columns: 6
    //     rows: 6
    //     rowSpacing: 2
    //     columnSpacing: 2
    //     Layout.alignment: Qt.AlignHCenter
    //     anchors {
    //         left: motor1ErrorWarningDebugClusterDebugCluster.left
    //         leftMargin: 115
    //         verticalCenter: motor1ErrorWarningDebugClusterDebugCluster.verticalCenter
    //     }
        
    //     Repeater {
    //         model: [
    //             { name: "Motor About\nTo Stall", isOn: motorDetails1.MotorAboutToStall },
    //             { name: "Delay in Reading\nTemp Sensor", isOn: motorDetails1.DelayInReadingTempSensor },
    //             { name: "Delay in Reading\nPos Sensor", isOn: motorDetails1.DelayInReadingPosSensor },
    //             { name: "Inverter 1\nTemp Very High", isOn: motorDetails1.Inverter1TempVeryHigh },
    //             { name: "Inverter 2\nTemp Very High", isOn: motorDetails1.Inverter2TempVeryHigh },
    //             { name: "Inverter 3\nTemp Very High", isOn: motorDetails1.Inverter3TempVeryHigh },
    //             { name: "Inverter 4\nTemp Very High", isOn: motorDetails1.Inverter4TempVeryHigh },
    //             { name: "Inverter 5\nTemp Very High", isOn: motorDetails1.Inverter5TempVeryHigh },
    //             { name: "Inverter 6\nTemp Very High", isOn: motorDetails1.Inverter6TempVeryHigh },
    //             { name: "CPU Temp\nVery High", isOn: motorDetails1.CpuTemperatureVeryHigh },
    //             { name: "Hall Temp\nVery High", isOn: motorDetails1.HallTemperatureVeryHigh },
    //             { name: "DCLINK Temp\nVery High", isOn: motorDetails1.DclinkTemperatureVeryHigh },
    //             { name: "Delay in DCLINK\nCommunication", isOn: motorDetails1.DelayInDclinkCommunication },
    //             { name: "Inverter 1 Over\nCurrent Warning", isOn: motorDetails1.Inverter1OverCurrentWarning },
    //             { name: "Inverter 2 Over\nCurrent Warning", isOn: motorDetails1.Inverter2OverCurrentWarning },
    //             { name: "Inverter 3 Over\nCurrent Warning", isOn: motorDetails1.Inverter3OverCurrentWarning },
    //             { name: "Inverter 4 Over\nCurrent Warning", isOn: motorDetails1.Inverter4OverCurrentWarning },
    //             { name: "Inverter 5 Over\nCurrent Warning", isOn: motorDetails1.Inverter5OverCurrentWarning },
    //             { name: "Inverter 6 Over\nCurrent Warning", isOn: motorDetails1.Inverter6OverCurrentWarning },
    //             { name: "DC Overvoltage\nWarning", isOn: motorDetails1.DcOvervoltageWarning },
    //             { name: "DC Undervoltage\nWarning", isOn: motorDetails1.DcUndervoltageWarning },
    //             { name: "CAN Comms\nTimeout", isOn: motorDetails1.CanCommsTimeout },
    //             { name: "Inverter 1\nFault Warning", isOn: motorDetails1.Inverter1FaultWarning },
    //             { name: "Inverter 2\nFault Warning", isOn: motorDetails1.Inverter2FaultWarning },
    //             { name: "Inverter 3\nFault Warning", isOn: motorDetails1.Inverter3FaultWarning },
    //             { name: "Inverter 4\nFault Warning", isOn: motorDetails1.Inverter4FaultWarning },
    //             { name: "Inverter 5\nFault Warning", isOn: motorDetails1.Inverter5FaultWarning },
    //             { name: "Inverter 6\nFault Warning", isOn: motorDetails1.Inverter6FaultWarning },
    //             { name: "CAN Send\nWarning", isOn: motorDetails1.CanSendWarning },
    //             { name: "Lost Frames on\nCAN Bus Warning", isOn: motorDetails1.LostFramesOnCanBusWarning },
    //             { name: "Overspeed\nWarning", isOn: motorDetails1.OverspeedWarning },
    //             { name: "CPU\nOverload", isOn: motorDetails1.CpuOverload },
    //             { name: "Torque\nLimited", isOn: motorDetails1.TorqueLimited },
    //             { name: "Start at\nHigh RPM", isOn: motorDetails1.StartAtHighRpm }
    //         ]
            
    //         delegate: Item {
    //             id: motor1WarningFlagFrame
    //             height: 60
    //             width: 117
                
    //             Text {
    //                 id: motor1WarningFlagTitle
    //                 text: modelData.name
    //                 font.pixelSize: Config.fontSize1
    //                 horizontalAlignment: Text.AlignHCenter
    //                 verticalAlignment: Text.AlignVCenter
    //                 font.family: Config.fontStyle
    //                 color: Config.fontColor
    //                 anchors.bottom: WarningFlagIcon.top
    //                 anchors.bottomMargin: 2
    //                 anchors.horizontalCenter: parent.horizontalCenter
    //             }
                
    //             DashIcon {
    //                 id: motor1WarningFlagIcon
    //                 width: 20
    //                 height: 20
    //                 imageSource: modelData.isOn ? "../Images/MpptMbmsStatusOn.png" : "../Images/MpptMbmsStatusOff.png"
    //                 iconMaskColor: modelData.isOn ? Config.valueLow : Config.valueHigh
    //                 anchors.bottom: parent.bottom
    //                 anchors.horizontalCenter: parent.horizontalCenter
    //                 anchors.bottomMargin: 2
    //             }
    //         }
    //     }
    // }

    // GridLayout { 
    //     id: motor1ErrorFlagContainer
    //     columns: 7
    //     rows: 6
    //     rowSpacing: 2
    //     columnSpacing: 2
    //     Layout.alignment: Qt.AlignHCenter
    //     anchors {
    //         right: motor1ErrorWarningDebugClusterDebugCluster.right
    //         rightMargin: 115
    //         verticalCenter: motor1ErrorWarningDebugClusterDebugCluster.verticalCenter
    //     }
        
    //     Repeater {
    //         model: [
    //             { name: "Init\nError", isOn: motorDetails1.InitError },
    //             { name: "Settings\nNot Found", isOn: motorDetails1.SettingsNotFound },
    //             { name: "Motor\nStalled", isOn: motorDetails1.MotorStalled },
    //             { name: "Controller Data\nReading Timeout", isOn: motorDetails1.ControllerDataReadingTimeout },
    //             { name: "Invalid Hall\nSensor Sequence", isOn: motorDetails1.InvalidHallSensorSequence },
    //             { name: "Invalid\nHall Sector", isOn: motorDetails1.InvalidHallSector },
    //             { name: "Error Reading\nTemp Sensor", isOn: motorDetails1.ErrorReadingTempSensor },
    //             { name: "Position Sensor\nReading Error", isOn: motorDetails1.PositionSensorReadingError },
    //             { name: "Error Reading\nEncoder", isOn: motorDetails1.ErrorReadingEncoder },
    //             { name: "Zero Position\nOffset Not Set", isOn: motorDetails1.ZeroPositionOffsetNotSet },
    //             { name: "HW Enable\nNot Set", isOn: motorDetails1.HwEnableNotSet },
    //             { name: "Inverter 1\nTemp Too High", isOn: motorDetails1.Inverter1TempTooHigh },
    //             { name: "Inverter 2\nTemp Too High", isOn: motorDetails1.Inverter2TempTooHigh },
    //             { name: "Inverter 3\nTemp Too High", isOn: motorDetails1.Inverter3TempTooHigh },
    //             { name: "Inverter 4\nTemp Too High", isOn: motorDetails1.Inverter4TempTooHigh },
    //             { name: "Inverter 5\nTemp Too High", isOn: motorDetails1.Inverter5TempTooHigh },
    //             { name: "Inverter 6\nTemp Too High", isOn: motorDetails1.Inverter6TempTooHigh },
    //             { name: "CPU Temp\nToo High", isOn: motorDetails1.CpuTemperatureTooHigh },
    //             { name: "Hall Temp\nToo High", isOn: motorDetails1.HallTemperatureTooHigh },
    //             { name: "DCLINK Temp\nToo High", isOn: motorDetails1.DclinkTemperatureTooHigh },
    //             { name: "Error in DCLINK\nCommunication", isOn: motorDetails1.ErrorInDclinkCommunication},
    //             { name: "Inverter 1\nOvercurrent Error", isOn: motorDetails1.Inverter1OvercurrentError },
    //             { name: "Inverter 2\nOvercurrent Error", isOn: motorDetails1.Inverter2OvercurrentError },
    //             { name: "Inverter 3\nOvercurrent Error", isOn: motorDetails1.Inverter3OvercurrentError },
    //             { name: "Inverter 4\nOvercurrent Error", isOn: motorDetails1.Inverter4OvercurrentError },
    //             { name: "Inverter 5\nOvercurrent Error", isOn: motorDetails1.Inverter5OvercurrentError },
    //             { name: "Inverter 6\nOvercurrent Error", isOn: motorDetails1.Inverter6OvercurrentError },
    //             { name: "DC Overvoltage\nError", isOn: motorDetails1.DcOvervoltageError },
    //             { name: "DC Undervoltage\nError", isOn: motorDetails1.DcUndervoltageError },
    //             { name: "Double CAN\nID On Bus", isOn: motorDetails1.DoubleCanIdOnBus },
    //             { name: "CAN Comms\nTimeout Error", isOn: motorDetails1.CanCommsTimeoutError },
    //             { name: "Inverter 1\nFault Error", isOn: motorDetails1.Inverter1FaultError },
    //             { name: "Inverter 2\nFault Error", isOn: motorDetails1.Inverter2FaultError },
    //             { name: "Inverter 3\nFault Error", isOn: motorDetails1.Inverter3FaultError },
    //             { name: "Inverter 4\nFault Error", isOn: motorDetails1.Inverter4FaultError },
    //             { name: "Inverter 5\nFault Error", isOn: motorDetails1.Inverter5FaultError },
    //             { name: "Inverter 6\nFault Error", isOn: motorDetails1.Inverter6FaultError },
    //             { name: "CAN Send\nError", isOn: motorDetails1.CanSendError },
    //             { name: "Lost Frames on\nCAN Bus Error", isOn: motorDetails1.LostFramesOnCanBusError },
    //             { name: "Overspeed\nError", isOn: motorDetails1.OverspeedError },
    //             { name: "CPU\nOverloaded", isOn: motorDetails1.CpuOverloaded }               
    //         ]
            
    //         delegate: Item {
    //             id: motor1ErrorFlagFrame
    //             height: 60
    //             width: 117
                
    //             Text {
    //                 id: motor1ErrorFlagTitle
    //                 text: modelData.name
    //                 font.pixelSize: Config.fontSize1
    //                 horizontalAlignment: Text.AlignHCenter
    //                 verticalAlignment: Text.AlignVCenter
    //                 font.family: Config.fontStyle
    //                 color: Config.fontColor
    //                 anchors.bottom: ErrorFlagIcon.top
    //                 anchors.bottomMargin: 2
    //                 anchors.horizontalCenter: parent.horizontalCenter
    //             }
                
    //             DashIcon {
    //                 id: motor1ErrorFlagIcon
    //                 width: 20
    //                 height: 20
    //                 imageSource: modelData.isOn ? "../Images/MpptMbmsStatusOn.png" : "../Images/MpptMbmsStatusOff.png"
    //                 iconMaskColor: modelData.isOn ? Config.valueLow : Config.valueHigh
    //                 anchors.bottom: parent.bottom
    //                 anchors.horizontalCenter: parent.horizontalCenter
    //                 anchors.bottomMargin: 2
    //             }
    //         }
    //     }
    // }
}
