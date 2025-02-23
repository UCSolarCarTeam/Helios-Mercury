import QtQuick 2.15
import QtQuick.Controls

Rectangle {
    id:mainContainer
    width: 426
    height: 150

    property QtObject batteryObject
    property QtObject motor0Object
    property QtObject motor1Object

    ScrollView{
        width:parent.width
        height:parent.height
        Grid{
            columns: 1
            spacing:1
            // Battery Faults
            FaultsMessage{
                visible: batteryObject.InternalCommunicationFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: Internal Communication"
            }
            FaultsMessage{
                visible:batteryObject.InternalConverversionFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: Internal Coversion"
            }
            FaultsMessage{
                visible:batteryObject.WeakCellFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: Weak Cell"
            }
            FaultsMessage{
                visible:batteryObject.LowCellVoltageFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: Low Cell Voltage"
            }
            FaultsMessage{
                visible:batteryObject.OpenWiringFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: Open Wiring"
            }
            FaultsMessage{
                visible: batteryObject.CurrentSensorFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: Current Sensor"
            }
            FaultsMessage{
                visible: batteryObject.PackVoltageSensorFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: Pack Voltage Sensor"
            }
            FaultsMessage{
                visible: batteryObject.WeakPackFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: Weak Pack"
            }
            FaultsMessage{
                visible: batteryObject.VoltageRedundancyFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: Voltage Redundancy"
            }
            FaultsMessage{
                visible: batteryObject.FanMonitorFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: Fan Monitor"
            }
            FaultsMessage{
                visible: batteryObject.ThermistorFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: Thermistor"
            }
            FaultsMessage{
                visible: batteryObject.CanbusCommunicationFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: CANBUS Communications"
            }
            FaultsMessage{
                visible: batteryObject.AlwaysOnSupplyFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: Always On Supply"
            }
            FaultsMessage{
                visible: batteryObject.HighVoltageIsolationFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: High Voltage Isolation"
            }
            FaultsMessage{
                visible: batteryObject.PowerSupply12VFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: Power Supply 12V"
            }
            FaultsMessage{
                visible: batteryObject.ChargeLimitEnforcementFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: Charge Limit Enforcement"
            }
            FaultsMessage{
                visible: batteryObject.DischargeLimitEnforcementFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: Discharge Limit Enforcement"
            }
            FaultsMessage{
                visible: batteryObject.ChargerSafetyRelayFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: Charger Safety Relay"
            }
            FaultsMessage{
                visible: batteryObject.InternalMemoryFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: Internal Memory"
            }
            FaultsMessage{
                visible: batteryObject.InternalThermistorFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: Internal Thermistor"
            }
            FaultsMessage{
                visible: batteryObject.InternalLogicFault
                errorType: "battery"
                severity:"mid"
                messageText: "Battery Fault: Internal Logic"
            }

            // Battery Limit Faults
            FaultsMessage{
                visible: batteryObject.DclReducedDueToLowSoc
                errorType: "battery"
                severity:"low"
                messageText: "Battery Fault: DCL Reduced Due To Low SOC"
            }
            FaultsMessage{
                visible: batteryObject.DclReducedDueToHighCellResistance
                severity:"low"
                messageText: "Battery Fault: DCL Reduced Due To High Cell Resistance"
            }
            FaultsMessage{
                visible: batteryObject.DclReducedDueToTemperature
                errorType: "battery"
                severity:"low"
                messageText: "Battery Fault: DCL Reduced Due To Temperature"
            }
            FaultsMessage{
                visible: batteryObject.DclReducedDueToLowCellVoltage
                errorType: "battery"
                severity:"low"
                messageText: "Battery Fault: DCL Reduced Due To Low Cell Voltage"
            }
            FaultsMessage{
                visible: batteryObject.DclReducedDueToLowPackVoltage
                errorType: "battery"
                severity:"low"
                messageText: "Battery Fault: DCL Reduced Due To Low Pack Voltage"
            }
            FaultsMessage{
                visible: batteryObject.DclAndCclReducedDueToVoltageFailsafe
                errorType: "battery"
                severity:"high"
                messageText: "Battery Fault: DCL and CCL Reduced Due To Voltage Failsafe"
            }
            FaultsMessage{
                visible: batteryObject.DclAndCclReducedDueToCommunicationFailsafe
                errorType: "battery"
                severity:"high"
                messageText: "Battery Fault: DCL and CCL Reduced Due To Communication Failsafe"
            }
            FaultsMessage{
                visible: batteryObject.CclReducedDueToHighSoc
                errorType: "battery"
                severity:"low"
                messageText: "Battery Fault: CCL Reduced Due To High SOC"
            }
            FaultsMessage{
                visible: batteryObject.CclReducedDueToHighCellResistance
                errorType: "battery"
                severity:"low"
                messageText: "Battery Fault: CCL Reduced Due To High Cell Resistance"
            }
            FaultsMessage{
                visible: batteryObject.CclReducedDueToTemperature
                errorType: "battery"
                severity:"low"
                messageText: "Battery Fault: CCL Reduced Due To Temperature"
            }
            FaultsMessage{
                visible: batteryObject.CclReducedDueToHighCellVoltage
                errorType: "battery"
                severity:"low"
                messageText: "Battery Fault: CCL Reduced Due To High Cell Voltage"
            }
            FaultsMessage{
                visible: batteryObject.CclReducedDueToHighPackVoltage
                errorType: "battery"
                severity:"low"
                messageText: "Battery Fault: CCL Reduced Due To High Pack Voltage"
            }
            FaultsMessage{
                visible: batteryObject.CclReducedDueToChargerLatch
                errorType: "battery"
                severity:"low"
                messageText: "Battery Fault: CCL Reduced Due To Charger Latch"
            }
            FaultsMessage{
                visible: batteryObject.CclReducedDueToAlternateCurrentLimit
                errorType: "battery"
                severity:"low"
                messageText: "Battery Fault: CCL Reduced Due To Alternate Current Limit"
            }

            // Motor 0 Faults
            FaultsMessage {
                visible: motor0Object.MotorAboutToStall
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 1: Motor About to Stall"
            }
            FaultsMessage {
                visible: motor0Object.DelayInReadingTempSensor
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 1: Delay in Reading Temp Sensor"
            }
            FaultsMessage {
                visible: motor0Object.DelayInReadingPosSensor
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 1: Delay in Reading Position Sensor"
            }
            FaultsMessage {
                visible: motor0Object.Inverter1TempVeryHigh
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 1: Inverter 1 Temperature Very High"
            }
            FaultsMessage {
                visible: motor0Object.Inverter2TempVeryHigh
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 1: Inverter 2 Temperature Very High"
            }
            FaultsMessage {
                visible: motor0Object.Inverter3TempVeryHigh
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 1: Inverter 3 Temperature Very High"
            }
            FaultsMessage {
                visible: motor0Object.Inverter4TempVeryHigh
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 1: Inverter 4 Temperature Very High"
            }
            FaultsMessage {
                visible: motor0Object.Inverter5TempVeryHigh
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 1: Inverter 5 Temperature Very High"
            }
            FaultsMessage {
                visible: motor0Object.Inverter6TempVeryHigh
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 2: Inverter 6 Temperature Very High"
            }
            FaultsMessage {
                visible: motor0Object.CpuTemperatureVeryHigh
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 2: CPU Temperature Very High"
            }
            FaultsMessage {
                visible: motor0Object.HallTemperatureVeryHigh
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 2: Hall Temperature Very High"
            }
            FaultsMessage {
                visible: motor0Object.DclinkTemperatureVeryHigh
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 2: DC Link Temperature Very High"
            }
            FaultsMessage {
                visible: motor0Object.DelayInDclinkCommunication
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 2: Delay in DC Link Communication"
            }
            FaultsMessage {
                visible: motor0Object.Inverter1OverCurrentWarning
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 2: Inverter 1 Overcurrent"
            }
            FaultsMessage {
                visible: motor0Object.Inverter2OverCurrentWarning
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 2: Inverter 2 Overcurrent"
            }
            FaultsMessage {
                visible: motor0Object.Inverter3OverCurrentWarning
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 2: Inverter 3 Overcurrent"
            }
            FaultsMessage {
                visible: motor0Object.Inverter4OverCurrentWarning
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 3: Inverter 4 Overcurrent"
            }
            FaultsMessage {
                visible: motor0Object.Inverter5OverCurrentWarning
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 3: Inverter 5 Overcurrent"
            }
            FaultsMessage {
                visible: motor0Object.Inverter6OverCurrentWarning
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 3: Inverter 6 Overcurrent"
            }
            FaultsMessage {
                visible: motor0Object.DcOvervoltageWarning
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 3: DC Overvoltage"
            }
            FaultsMessage {
                visible: motor0Object.DcUndervoltageWarning
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 3: DC Undervoltage"
            }
            FaultsMessage {
                visible: motor0Object.CanCommsTimeout
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 3: CAN Communications Timeout"
            }
            FaultsMessage {
                visible:motor0Object.Inverter1FaultWarning
                errorType:"motor"
                severity:"mid"
                messageText: "Motor 0 Warning 3: Inverter 1 Fault"
            }
            FaultsMessage {
                visible:motor0Object.Inverter2FaultWarning
                errorType:"motor"
                severity:"mid"
                messageText: "Motor 0 Warning 3: Inverter 2 Fault"
            }
            FaultsMessage {
                visible:motor0Object.Inverter3FaultWarning
                errorType:"motor"
                severity:"mid"
                messageText: "Motor 0 Warning 4: Inverter 3 Fault"
            }
            FaultsMessage {
                visible:motor0Object.Inverter4FaultWarning
                errorType:"motor"
                severity:"mid"
                messageText: "Motor 0 Warning 4: Inverter 4 Fault"
            }
            FaultsMessage {
                visible:motor0Object.Inverter5FaultWarning
                errorType:"motor"
                severity:"mid"
                messageText: "Motor 0 Warning 4: Inverter 5 Fault"
            }
            FaultsMessage {
                visible:motor0Object.Inverter6FaultWarning
                errorType:"motor"
                severity:"mid"
                messageText: "Motor 0 Warning 4: Inverter 6 Fault"
            }
            FaultsMessage {
                visible: motor0Object.CanSendWarning
                errorType:"motor"
                severity:"mid"
                messageText: "Motor 0 Warning 4: CAN send Warning"

            }
            FaultsMessage {
                visible: motor0Object.LostFramesOnCanBusWarning
                errorType:"motor"
                severity:"mid"
                messageText: "Motor 0 Warning 4: Lost Frames on CAN bus"

            }
            FaultsMessage {
                visible: motor0Object.OverspeedWarning
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 4: Overspeed Warning"
            }
            FaultsMessage {
                visible: motor0Object.CpuOverload
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 4 : CPU Overloaded"
            }
            FaultsMessage {
                visible: motor0Object.TorqueLimited
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 5: Torque Limited"
            }
            FaultsMessage {
                visible: motor0Object.StartAtHighRpm
                errorType: "motor"
                severity:'mid'
                messageText: "Motor 0 Warning 5: Start at High RPM"
            }

            // Motor 0 Error Codes
            FaultsMessage {
                visible: motor0Object.InitError
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 1: Init Error "
            }
            FaultsMessage {
                visible: motor0Object.SettingsNotFound
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 1: Settings Not Found "
            }
            FaultsMessage {
                visible: motor0Object.MotorStalled
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 1: Motor Stalled "
            }
            FaultsMessage {
                visible: motor0Object.ControllerDataReadingTimeout
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 1: Controller Data Reading Timeout "
            }
            FaultsMessage {
                visible: motor0Object.InvalidHallSensorSequence
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 1: Invalid Hall Sensor Sequence "
            }
            FaultsMessage {
                visible: motor0Object.InvalidHallSector
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 1: Invalid Hall Sector "
            }
            FaultsMessage {
                visible: motor0Object.ErrorReadingTempSensor
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 1: Error Reading Temp Sensor "
            }
            FaultsMessage {
                visible: motor0Object.PositionSensorReadingError
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 1: Position Sensor Reading Error "
            }
            // Motor 0 Error Code 2
            FaultsMessage {
                visible: motor0Object.ErrorReadingEncoder
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 2: Error Reading Encoder "
            }
            FaultsMessage {
                visible: motor0Object.ZeroPositionOffsetNotSet
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 2: Zero Position Offset not set "
            }
            FaultsMessage {
                visible: motor0Object.HwEnableNotSet
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 2: HW Enable Not Set "
            }
            FaultsMessage {
                visible: motor0Object.Inverter1TempTooHigh
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 2: Inverter 1 Temp Too High "
            }
            FaultsMessage {
                visible: motor0Object.Inverter2TempTooHigh
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 2: Inverter 2 Temp Too High "
            }
            FaultsMessage {
                visible: motor0Object.Inverter3TempTooHigh
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 2: Inverter 3 Temp Too High "
            }
            FaultsMessage {
                visible: motor0Object.Inverter4TempTooHigh
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 2: Inverter 4 Temp Too High "
            }
            FaultsMessage {
                visible: motor0Object.Inverter5TempTooHigh
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 2: Inverter 5 Temp Too High "
            }
            // Motor 0 Error code 3
            FaultsMessage {
                visible: motor0Object.Inverter6TempTooHigh
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 3: Inverter 6 Temp Too High "
            }
            FaultsMessage {
                visible: motor0Object.CpuTemperatureTooHigh
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 3: CPU Temp too High "
            }
            FaultsMessage {
                visible: motor0Object.HallTemperatureTooHigh
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 3: Hall Temp too High "
            }
            FaultsMessage {
                visible: motor0Object.DclinkTemperatureTooHigh
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 3: DC Link Temp too High "
            }
            FaultsMessage {
                visible: motor0Object.ErrorInDclinkCommunication
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 3: Error In DC Link Communication "
            }
            FaultsMessage {
                visible: motor0Object.Inverter1OvercurrentError
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 3: Inverter 1 Overcurrent  "
            }
            FaultsMessage {
                visible: motor0Object.Inverter2OvercurrentError
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 3: Inverter 2 Overcurrent  "
            }
            FaultsMessage {
                visible: motor0Object.Inverter3OvercurrentError
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 3: Inverter 3 Overcurrent  "
            }
            // Motor 0 Error code 4
            FaultsMessage {
                visible: motor0Object.Inverter4OvercurrentError
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 4: Inverter 4 Overcurrent  "
            }
            FaultsMessage {
                visible: motor0Object.Inverter5OvercurrentError
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 4: Inverter 5 Overcurrent  "
            }
            FaultsMessage {
                visible: motor0Object.Inverter6OvercurrentError
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 4: Inverter 6 Overcurrent  "
            }
            FaultsMessage {
                visible: motor0Object.DcOvervoltageError
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 4: DC Overvoltage  "
            }
            FaultsMessage {
                visible: motor0Object.DcUndervoltageError
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 4: DC Under Voltage  "
            }
            FaultsMessage {
                visible: motor0Object.DoubleCanIdOnBus
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 4: Double CAN id on bus  "
            }
            FaultsMessage {
                visible: motor0Object.CanCommsTimeoutError
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 4: CAN Comms timeout(>200ms)  "
            }
            FaultsMessage {
                visible: motor0Object.Inverter1FaultError
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 4: Inverter 1 Fault  "
            }
            FaultsMessage {
                visible: motor0Object.Inverter2FaultError
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 4: Inverter 2 Fault  "
            }
            FaultsMessage {
                visible: motor0Object.Inverter3FaultError
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 4: Inverter 3 Fault  "
            }
            FaultsMessage {
                visible: motor0Object.Inverter4FaultError
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 4: Inverter 4 Fault  "
            }
            FaultsMessage {
                visible: motor0Object.Inverter5FaultError
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 4: Inverter 5 Fault  "
            }
            FaultsMessage {
                visible: motor0Object.Inverter6FaultError
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 4: Inverter 6 Fault  "
            }
            FaultsMessage {
                visible: motor0Object.CanSendError
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 4: CAN send error  "
            }
            FaultsMessage {
                visible: motor0Object.LostFramesOnCanBusError
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 4: Lost Frames on CAN Bus  "
            }
            FaultsMessage {
                visible: motor0Object.OverspeedError
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 4: Overspeed Error "
            }
            // Motor 0 Error code 5
            FaultsMessage {
                visible: motor0Object.CpuOverloaded
                errorType: "motor"
                severity:'high'
                messageText: "Motor 0 Error 5: CPU Overloaded "
            }
            // Motor 1 Faults
                       FaultsMessage {
                           visible: motor1Object.MotorAboutToStall
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 1: Motor About to Stall"
                       }
                       FaultsMessage {
                           visible: motor1Object.DelayInReadingTempSensor
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 1: Delay in Reading Temp Sensor"
                       }
                       FaultsMessage {
                           visible: motor1Object.DelayInReadingPosSensor
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 1: Delay in Reading Position Sensor"
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter1TempVeryHigh
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 1: Inverter 1 Temperature Very High"
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter2TempVeryHigh
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 1: Inverter 2 Temperature Very High"
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter3TempVeryHigh
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 1: Inverter 3 Temperature Very High"
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter4TempVeryHigh
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 1: Inverter 4 Temperature Very High"
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter5TempVeryHigh
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 1: Inverter 5 Temperature Very High"
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter6TempVeryHigh
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 2: Inverter 6 Temperature Very High"
                       }
                       FaultsMessage {
                           visible: motor1Object.CpuTemperatureVeryHigh
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 2: CPU Temperature Very High"
                       }
                       FaultsMessage {
                           visible: motor1Object.HallTemperatureVeryHigh
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 2: Hall Temperature Very High"
                       }
                       FaultsMessage {
                           visible: motor1Object.DclinkTemperatureVeryHigh
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 2: DC Link Temperature Very High"
                       }
                       FaultsMessage {
                           visible: motor1Object.DelayInDclinkCommunication
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 2: Delay in DC Link Communication"
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter1OverCurrentWarning
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 2: Inverter 1 Overcurrent"
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter2OverCurrentWarning
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 2: Inverter 2 Overcurrent"
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter3OverCurrentWarning
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 2: Inverter 3 Overcurrent"
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter4OverCurrentWarning
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 3: Inverter 4 Overcurrent"
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter5OverCurrentWarning
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 3: Inverter 5 Overcurrent"
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter6OverCurrentWarning
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 3: Inverter 6 Overcurrent"
                       }
                       FaultsMessage {
                           visible: motor1Object.DcOvervoltageWarning
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 3: DC Overvoltage"
                       }
                       FaultsMessage {
                           visible: motor1Object.DcUndervoltageWarning
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 3: DC Undervoltage"
                       }
                       FaultsMessage {
                           visible: motor1Object.CanCommsTimeout
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 3: CAN Communications Timeout"
                       }
                       FaultsMessage {
                           visible:motor1Object.Inverter1FaultWarning
                           errorType:"motor"
                           severity:"mid"
                           messageText: "Motor 1 Warning 3: Inverter 1 Fault"
                       }
                       FaultsMessage {
                           visible:motor1Object.Inverter2FaultWarning
                           errorType:"motor"
                           severity:"mid"
                           messageText: "Motor 1 Warning 3: Inverter 2 Fault"
                       }
                       FaultsMessage {
                           visible:motor1Object.Inverter3FaultWarning
                           errorType:"motor"
                           severity:"mid"
                           messageText: "Motor 1 Warning 4: Inverter 3 Fault"
                       }
                       FaultsMessage {
                           visible:motor1Object.Inverter4FaultWarning
                           errorType:"motor"
                           severity:"mid"
                           messageText: "Motor 1 Warning 4: Inverter 4 Fault"
                       }
                       FaultsMessage {
                           visible:motor1Object.Inverter5FaultWarning
                           errorType:"motor"
                           severity:"mid"
                           messageText: "Motor 1 Warning 4: Inverter 5 Fault"
                       }
                       FaultsMessage {
                           visible:motor1Object.Inverter6FaultWarning
                           errorType:"motor"
                           severity:"mid"
                           messageText: "Motor 1 Warning 4: Inverter 6 Fault"
                       }
                       FaultsMessage {
                           visible: motor1Object.CanSendWarning
                           errorType:"motor"
                           severity:"mid"
                           messageText: "Motor 1 Warning 4: CAN send Warning"

                       }
                       FaultsMessage {
                           visible: motor1Object.LostFramesOnCanBusWarning
                           errorType:"motor"
                           severity:"mid"
                           messageText: "Motor 1 Warning 4: Lost Frames on CAN bus"

                       }
                       FaultsMessage {
                           visible: motor1Object.OverspeedWarning
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 4: Overspeed Warning"
                       }
                       FaultsMessage {
                           visible: motor1Object.CpuOverload
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 4 : CPU Overloaded"
                       }
                       FaultsMessage {
                           visible: motor1Object.TorqueLimited
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 5: Torque Limited"
                       }
                       FaultsMessage {
                           visible: motor1Object.StartAtHighRpm
                           errorType: "motor"
                           severity:'mid'
                           messageText: "Motor 1 Warning 5: Start at High RPM"
                       }

                       // Motor 1 Error Codes
                       FaultsMessage {
                           visible: motor1Object.InitError
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 1: Init Error "
                       }
                       FaultsMessage {
                           visible: motor1Object.SettingsNotFound
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 1: Settings Not Found "
                       }
                       FaultsMessage {
                           visible: motor1Object.MotorStalled
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 1: Motor Stalled "
                       }
                       FaultsMessage {
                           visible: motor1Object.ControllerDataReadingTimeout
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 1: Controller Data Reading Timeout "
                       }
                       FaultsMessage {
                           visible: motor1Object.InvalidHallSensorSequence
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 1: Invalid Hall Sensor Sequence "
                       }
                       FaultsMessage {
                           visible: motor1Object.InvalidHallSector
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 1: Invalid Hall Sector "
                       }
                       FaultsMessage {
                           visible: motor1Object.ErrorReadingTempSensor
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 1: Error Reading Temp Sensor "
                       }
                       FaultsMessage {
                           visible: motor1Object.PositionSensorReadingError
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 1: Position Sensor Reading Error "
                       }
                       // Motor 1 Error Code 2
                       FaultsMessage {
                           visible: motor1Object.ErrorReadingEncoder
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 2: Error Reading Encoder "
                       }
                       FaultsMessage {
                           visible: motor1Object.ZeroPositionOffsetNotSet
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 2: Zero Position Offset not set "
                       }
                       FaultsMessage {
                           visible: motor1Object.HwEnableNotSet
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 2: HW Enable Not Set "
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter1TempTooHigh
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 2: Inverter 1 Temp Too High "
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter2TempTooHigh
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 2: Inverter 2 Temp Too High "
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter3TempTooHigh
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 2: Inverter 3 Temp Too High "
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter4TempTooHigh
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 2: Inverter 4 Temp Too High "
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter5TempTooHigh
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 2: Inverter 5 Temp Too High "
                       }
                       // Motor 1 Error code 3
                       FaultsMessage {
                           visible: motor1Object.Inverter6TempTooHigh
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 3: Inverter 6 Temp Too High "
                       }
                       FaultsMessage {
                           visible: motor1Object.CpuTemperatureTooHigh
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 3: CPU Temp too High "
                       }
                       FaultsMessage {
                           visible: motor1Object.HallTemperatureTooHigh
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 3: Hall Temp too High "
                       }
                       FaultsMessage {
                           visible: motor1Object.DclinkTemperatureTooHigh
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 3: DC Link Temp too High "
                       }
                       FaultsMessage {
                           visible: motor1Object.ErrorInDclinkCommunication
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 3: Error In DC Link Communication "
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter1OvercurrentError
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 3: Inverter 1 Overcurrent  "
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter2OvercurrentError
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 3: Inverter 2 Overcurrent  "
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter3OvercurrentError
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 3: Inverter 3 Overcurrent  "
                       }
                       // Motor 1 Error code 4
                       FaultsMessage {
                           visible: motor1Object.Inverter4OvercurrentError
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 4: Inverter 4 Overcurrent  "
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter5OvercurrentError
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 4: Inverter 5 Overcurrent  "
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter6OvercurrentError
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 4: Inverter 6 Overcurrent  "
                       }
                       FaultsMessage {
                           visible: motor1Object.DcOvervoltageError
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 4: DC Overvoltage  "
                       }
                       FaultsMessage {
                           visible: motor1Object.DcUndervoltageError
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 4: DC Under Voltage  "
                       }
                       FaultsMessage {
                           visible: motor1Object.DoubleCanIdOnBus
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 4: Double CAN id on bus  "
                       }
                       FaultsMessage {
                           visible: motor1Object.CanCommsTimeoutError
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 4: CAN Comms timeout(>200ms)  "
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter1FaultError
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 4: Inverter 1 Fault  "
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter2FaultError
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 4: Inverter 2 Fault  "
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter3FaultError
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 4: Inverter 3 Fault  "
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter4FaultError
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 4: Inverter 4 Fault  "
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter5FaultError
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 4: Inverter 5 Fault  "
                       }
                       FaultsMessage {
                           visible: motor1Object.Inverter6FaultError
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 4: Inverter 6 Fault  "
                       }
                       FaultsMessage {
                           visible: motor1Object.CanSendError
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 4: CAN send error  "
                       }
                       FaultsMessage {
                           visible: motor1Object.LostFramesOnCanBusError
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 4: Lost Frames on CAN Bus  "
                       }
                       FaultsMessage {
                           visible: motor1Object.OverspeedError
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 4: Overspeed Error "
                       }
                       // Motor 1 Error code 5
                       FaultsMessage {
                           visible: motor1Object.CpuOverloaded
                           errorType: "motor"
                           severity:'high'
                           messageText: "Motor 1 Error 5: CPU Overloaded "
                       }
        }


    }
}
