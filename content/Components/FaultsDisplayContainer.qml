import QtQuick 2.15
import QtQuick.Controls
import QtQml.Models
Rectangle {
    id:mainContainer
    width: 426
    height: 150
    color:'transparent'
    property QtObject batteryObject
    property QtObject motor0Object
    property QtObject motor1Object

        ListView{
            id:listView
            property int visibleErrorCount: 0 // Tracks number of visible error messages

            width:parent.width
            height:parent.height
            spacing:-6
            model:ListModel {
               id: batteryFaultsModel
                   ListElement { faultProperty: "InternalCommunicationFault"; messageText: "Battery Fault: Internal Communication"; severity:"mid";  }
                   ListElement { faultProperty: "InternalConverversionFault"; messageText: "Battery Fault: Internal Conversion";severity:"mid"; }
                   ListElement { faultProperty: "WeakCellFault"; messageText: "Battery Fault: Weak Cell";severity:"mid"; }
                   // ListElement { faultProperty: "LowCellVoltageFault"; messageText: "Battery Fault: Low Cell Voltage";severity:"mid" }
                   // ListElement { faultProperty: "OpenWiringFault"; messageText: "Battery Fault: Open Wiring";severity:"mid" }
                   // ListElement { faultProperty: "CurrentSensorFault"; messageText: "Battery Fault: Current Sensor";severity:"mid" }
                   // ListElement { faultProperty: "PackVoltageSensorFault"; messageText: "Battery Fault: Pack Voltage Sensor";severity:"mid" }
                   // ListElement { faultProperty: "WeakPackFault"; messageText: "Battery Fault: Weak Pack";severity:"mid" }
                   // ListElement { faultProperty: "VoltageRedundancyFault"; messageText: "Battery Fault: Voltage Redundancy";severity:"mid" }
                   // ListElement { faultProperty: "FanMonitorFault"; messageText: "Battery Fault: Fan Monitor";severity:"mid" }
                   // ListElement { faultProperty: "ThermistorFault"; messageText: "Battery Fault: Thermistor";severity:"mid" }
                   // ListElement { faultProperty: "CanbusCommunicationFault"; messageText: "Battery Fault: CANBUS Communications";severity:"mid" }
                   // ListElement { faultProperty: "AlwaysOnSupplyFault"; messageText: "Battery Fault: Always On Supply";severity:"mid" }
                   // ListElement { faultProperty: "HighVoltageIsolationFault"; messageText: "Battery Fault: High Voltage Isolation";severity:"mid" }
                   // ListElement { faultProperty: "PowerSupply12VFault"; messageText: "Battery Fault: Power Supply 12V";severity:"mid" }
                   // ListElement { faultProperty: "ChargeLimitEnforcementFault"; messageText: "Battery Fault: Charge Limit Enforcement";severity:"mid" }
                   // ListElement { faultProperty: "DischargeLimitEnforcementFault"; messageText: "Battery Fault: Discharge Limit Enforcement";severity:"mid" }
                   // ListElement { faultProperty: "ChargerSafetyRelayFault"; messageText: "Battery Fault: Charger Safety Relay";severity:"mid" }
                   // ListElement { faultProperty: "InternalMemoryFault"; messageText: "Battery Fault: Internal Memory";severity:"mid" }
                   // ListElement { faultProperty: "InternalThermistorFault"; messageText: "Battery Fault: Internal Thermistor";severity:"mid" }
                   // ListElement { faultProperty: "InternalLogicFault"; messageText: "Battery Fault: Internal Logic";severity:"mid" }
                   // ListElement { faultProperty: "DclReducedDueToLowSoc"; messageText: "Battery Fault: DCL Reduced Due To Low SOC";severity:"mid" }
                   // ListElement { faultProperty: "InternalLogicFault"; messageText: "Battery Fault: Internal Logic";severity:"mid" }
                   // ListElement { faultProperty: "DclReducedDueToHighCellResistance"; messageText: "Battery Fault: DCL Reduced Due To High Cell Resistance"; severity: "mid" }
                   // ListElement { faultProperty: "DclReducedDueToTemperature"; messageText: "Battery Fault: DCL Reduced Due To Temperature"; severity: "mid" }
                   // ListElement { faultProperty: "DclReducedDueToLowCellVoltage"; messageText: "Battery Fault: DCL Reduced Due To Low Cell Voltage"; severity: "mid" }
                   // ListElement { faultProperty: "DclReducedDueToLowPackVoltage"; messageText: "Battery Fault: DCL Reduced Due To Low Pack Voltage"; severity: "mid" }
                   // ListElement { faultProperty: "DclAndCclReducedDueToVoltageFailsafe"; messageText: "Battery Fault: DCL and CCL Reduced Due To Voltage Failsafe"; severity: "mid" }
                   // ListElement { faultProperty: "DclAndCclReducedDueToCommunicationFailsafe"; messageText: "Battery Fault: DCL and CCL Reduced Due To Communication Failsafe"; severity: "mid" }
                   // ListElement { faultProperty: "CclReducedDueToHighSoc"; messageText: "Battery Fault: CCL Reduced Due To High SOC"; severity: "mid" }
                   // ListElement { faultProperty: "CclReducedDueToHighCellResistance"; messageText: "Battery Fault: CCL Reduced Due To High Cell Resistance"; severity: "mid" }
                   // ListElement { faultProperty: "CclReducedDueToTemperature"; messageText: "Battery Fault: CCL Reduced Due To Temperature"; severity: "mid" }
                   // ListElement { faultProperty: "CclReducedDueToHighCellVoltage"; messageText: "Battery Fault: CCL Reduced Due To High Cell Voltage"; severity: "mid" }
                   // ListElement { faultProperty: "CclReducedDueToHighPackVoltage"; messageText: "Battery Fault: CCL Reduced Due To High Pack Voltage"; severity: "mid" }
                   // ListElement { faultProperty: "CclReducedDueToChargerLatch"; messageText: "Battery Fault: CCL Reduced Due To Charger Latch"; severity: "mid" }
                   // ListElement { faultProperty: "CclReducedDueToAlternateCurrentLimit"; messageText: "Battery Fault: CCL Reduced Due To Alternate Current Limit"; severity: "mid" }

                   // ListElement { faultProperty: "MotorAboutToStall"; messageText: "Motor 0 Warning 1: Motor About to Stall"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "DelayInReadingTempSensor"; messageText: "Motor 0 Warning 1: Delay in Reading Temp Sensor"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "DelayInReadingPosSensor"; messageText: "Motor 0 Warning 1: Delay in Reading Position Sensor"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter1TempVeryHigh"; messageText: "Motor 0 Warning 1: Inverter 1 Temperature Very High"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter2TempVeryHigh"; messageText: "Motor 0 Warning 1: Inverter 2 Temperature Very High"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter3TempVeryHigh"; messageText: "Motor 0 Warning 1: Inverter 3 Temperature Very High"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter4TempVeryHigh"; messageText: "Motor 0 Warning 1: Inverter 4 Temperature Very High"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter5TempVeryHigh"; messageText: "Motor 0 Warning 1: Inverter 5 Temperature Very High"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter6TempVeryHigh"; messageText: "Motor 0 Warning 2: Inverter 6 Temperature Very High"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "CpuTemperatureVeryHigh"; messageText: "Motor 0 Warning 2: CPU Temperature Very High"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "HallTemperatureVeryHigh"; messageText: "Motor 0 Warning 2: Hall Temperature Very High"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "DclinkTemperatureVeryHigh"; messageText: "Motor 0 Warning 2: DC Link Temperature Very High"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "DelayInDclinkCommunication"; messageText: "Motor 0 Warning 2: Delay in DC Link Communication"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter1OverCurrentWarning"; messageText: "Motor 0 Warning 2: Inverter 1 Overcurrent"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter2OverCurrentWarning"; messageText: "Motor 0 Warning 2: Inverter 2 Overcurrent"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter3OverCurrentWarning"; messageText: "Motor 0 Warning 2: Inverter 3 Overcurrent"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter4OverCurrentWarning"; messageText: "Motor 0 Warning 3: Inverter 4 Overcurrent"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter5OverCurrentWarning"; messageText: "Motor 0 Warning 3: Inverter 5 Overcurrent"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter6OverCurrentWarning"; messageText: "Motor 0 Warning 3: Inverter 6 Overcurrent"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "DcOvervoltageWarning"; messageText: "Motor 0 Warning 3: DC Overvoltage"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "DcUndervoltageWarning"; messageText: "Motor 0 Warning 3: DC Undervoltage"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "CanCommsTimeout"; messageText: "Motor 0 Warning 3: CAN Communications Timeout"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter1FaultWarning"; messageText: "Motor 0 Warning 3: Inverter 1 Fault"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter2FaultWarning"; messageText: "Motor 0 Warning 3: Inverter 2 Fault"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter3FaultWarning"; messageText: "Motor 0 Warning 4: Inverter 3 Fault"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter4FaultWarning"; messageText: "Motor 0 Warning 4: Inverter 4 Fault"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter5FaultWarning"; messageText: "Motor 0 Warning 4: Inverter 5 Fault"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter6FaultWarning"; messageText: "Motor 0 Warning 4: Inverter 6 Fault"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "CanSendWarning"; messageText: "Motor 0 Warning 4: CAN Send Warning"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "LostFramesOnCanBusWarning"; messageText: "Motor 0 Warning 4: Lost Frames on CAN Bus"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "OverspeedWarning"; messageText: "Motor 0 Warning 4: Overspeed Warning"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "CpuOverload"; messageText: "Motor 0 Warning 4: CPU Overloaded"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "TorqueLimited"; messageText: "Motor 0 Warning 5: Torque Limited"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "StartAtHighRpm"; messageText: "Motor 0 Warning 5: Start at High RPM"; severity: "mid"; errorType: "motor" }

                   // ListElement { faultProperty: "InitError"; messageText: "Motor 0 Error 1: Init Error"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "SettingsNotFound"; messageText: "Motor 0 Error 1: Settings Not Found"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "MotorStalled"; messageText: "Motor 0 Error 1: Motor Stalled"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "ControllerDataReadingTimeout"; messageText: "Motor 0 Error 1: Controller Data Reading Timeout"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "InvalidHallSensorSequence"; messageText: "Motor 0 Error 1: Invalid Hall Sensor Sequence"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "InvalidHallSector"; messageText: "Motor 0 Error 1: Invalid Hall Sector"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "ErrorReadingTempSensor"; messageText: "Motor 0 Error 1: Error Reading Temp Sensor"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "PositionSensorReadingError"; messageText: "Motor 0 Error 1: Position Sensor Reading Error"; severity: "high"; errorType: "motor" }

                   // ListElement { faultProperty: "ErrorReadingEncoder"; messageText: "Motor 0 Error 2: Error Reading Encoder"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "ZeroPositionOffsetNotSet"; messageText: "Motor 0 Error 2: Zero Position Offset Not Set"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "HwEnableNotSet"; messageText: "Motor 0 Error 2: HW Enable Not Set"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter1TempTooHigh"; messageText: "Motor 0 Error 2: Inverter 1 Temp Too High"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter2TempTooHigh"; messageText: "Motor 0 Error 2: Inverter 2 Temp Too High"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter3TempTooHigh"; messageText: "Motor 0 Error 2: Inverter 3 Temp Too High"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter4TempTooHigh"; messageText: "Motor 0 Error 2: Inverter 4 Temp Too High"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter5TempTooHigh"; messageText: "Motor 0 Error 2: Inverter 5 Temp Too High"; severity: "high"; errorType: "motor" }

                   // ListElement { faultProperty: "Inverter6TempTooHigh"; messageText: "Motor 0 Error 3: Inverter 6 Temp Too High"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "CpuTemperatureTooHigh"; messageText: "Motor 0 Error 3: CPU Temp too High"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "HallTemperatureTooHigh"; messageText: "Motor 0 Error 3: Hall Temp too High"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "DclinkTemperatureTooHigh"; messageText: "Motor 0 Error 3: DC Link Temp too High"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "ErrorInDclinkCommunication"; messageText: "Motor 0 Error 3: Error In DC Link Communication"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter1OvercurrentError"; messageText: "Motor 0 Error 3: Inverter 1 Overcurrent"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter2OvercurrentError"; messageText: "Motor 0 Error 3: Inverter 2 Overcurrent"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter3OvercurrentError"; messageText: "Motor 0 Error 3: Inverter 3 Overcurrent"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter4OvercurrentError"; messageText: "Motor 0 Error 4: Inverter 4 Overcurrent"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter5OvercurrentError"; messageText: "Motor 0 Error 4: Inverter 5 Overcurrent"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter6OvercurrentError"; messageText: "Motor 0 Error 4: Inverter 6 Overcurrent"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "DcOvervoltageError"; messageText: "Motor 0 Error 4: DC Overvoltage"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "DcUndervoltageError"; messageText: "Motor 0 Error 4: DC Under Voltage"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "DoubleCanIdOnBus"; messageText: "Motor 0 Error 4: Double CAN id on bus"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "CanCommsTimeoutError"; messageText: "Motor 0 Error 4: CAN Comms timeout(>200ms)"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter1FaultError"; messageText: "Motor 0 Error 4: Inverter 1 Fault"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter2FaultError"; messageText: "Motor 0 Error 4: Inverter 2 Fault"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter3FaultError"; messageText: "Motor 0 Error 4: Inverter 3 Fault"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter4FaultError"; messageText: "Motor 0 Error 4: Inverter 4 Fault"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter5FaultError"; messageText: "Motor 0 Error 4: Inverter 5 Fault"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter6FaultError"; messageText: "Motor 0 Error 4: Inverter 6 Fault"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "CanSendError"; messageText: "Motor 0 Error 4: CAN send error"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "LostFramesOnCanBusError"; messageText: "Motor 0 Error 4: Lost Frames on CAN Bus"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "OverspeedError"; messageText: "Motor 0 Error 4: Overspeed Error"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "CpuOverloaded"; messageText: "Motor 0 Error 5: CPU Overloaded"; severity: "high"; errorType: "motor" }

                   // ListElement { faultProperty: "MotorAboutToStall"; messageText: "Motor 1 Warning 1: Motor About to Stall"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "DelayInReadingTempSensor"; messageText: "Motor 1 Warning 1: Delay in Reading Temp Sensor"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "DelayInReadingPosSensor"; messageText: "Motor 1 Warning 1: Delay in Reading Position Sensor"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter1TempVeryHigh"; messageText: "Motor 1 Warning 1: Inverter 1 Temperature Very High"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter2TempVeryHigh"; messageText: "Motor 1 Warning 1: Inverter 2 Temperature Very High"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter3TempVeryHigh"; messageText: "Motor 1 Warning 1: Inverter 3 Temperature Very High"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter4TempVeryHigh"; messageText: "Motor 1 Warning 1: Inverter 4 Temperature Very High"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter5TempVeryHigh"; messageText: "Motor 1 Warning 1: Inverter 5 Temperature Very High"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter6TempVeryHigh"; messageText: "Motor 1 Warning 2: Inverter 6 Temperature Very High"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "CpuTemperatureVeryHigh"; messageText: "Motor 1 Warning 2: CPU Temperature Very High"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "HallTemperatureVeryHigh"; messageText: "Motor 1 Warning 2: Hall Temperature Very High"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "DclinkTemperatureVeryHigh"; messageText: "Motor 1 Warning 2: DC Link Temperature Very High"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "DelayInDclinkCommunication"; messageText: "Motor 1 Warning 2: Delay in DC Link Communication"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter1OverCurrentWarning"; messageText: "Motor 1 Warning 2: Inverter 1 Overcurrent"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter2OverCurrentWarning"; messageText: "Motor 1 Warning 2: Inverter 2 Overcurrent"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter3OverCurrentWarning"; messageText: "Motor 1 Warning 2: Inverter 3 Overcurrent"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter4OverCurrentWarning"; messageText: "Motor 1 Warning 3: Inverter 4 Overcurrent"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter5OverCurrentWarning"; messageText: "Motor 1 Warning 3: Inverter 5 Overcurrent"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter6OverCurrentWarning"; messageText: "Motor 1 Warning 3: Inverter 6 Overcurrent"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "DcOvervoltageWarning"; messageText: "Motor 1 Warning 3: DC Overvoltage"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "DcUndervoltageWarning"; messageText: "Motor 1 Warning 3: DC Undervoltage"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "CanCommsTimeout"; messageText: "Motor 1 Warning 3: CAN Communications Timeout"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter1FaultWarning"; messageText: "Motor 1 Warning 3: Inverter 1 Fault"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter2FaultWarning"; messageText: "Motor 1 Warning 3: Inverter 2 Fault"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter3FaultWarning"; messageText: "Motor 1 Warning 4: Inverter 3 Fault"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter4FaultWarning"; messageText: "Motor 1 Warning 4: Inverter 4 Fault"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter5FaultWarning"; messageText: "Motor 1 Warning 4: Inverter 5 Fault"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter6FaultWarning"; messageText: "Motor 1 Warning 4: Inverter 6 Fault"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "CanSendWarning"; messageText: "Motor 1 Warning 4: CAN send Warning"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "LostFramesOnCanBusWarning"; messageText: "Motor 1 Warning 4: Lost Frames on CAN bus"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "OverspeedWarning"; messageText: "Motor 1 Warning 4: Overspeed Warning"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "CpuOverload"; messageText: "Motor 1 Warning 4: CPU Overloaded"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "TorqueLimited"; messageText: "Motor 1 Warning 5: Torque Limited"; severity: "mid"; errorType: "motor" }
                   // ListElement { faultProperty: "StartAtHighRpm"; messageText: "Motor 1 Warning 5: Start at High RPM"; severity: "mid"; errorType: "motor" }

                   // ListElement { faultProperty: "InitError"; messageText: "Motor 1 Error 1: Init Error"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "SettingsNotFound"; messageText: "Motor 1 Error 1: Settings Not Found"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "MotorStalled"; messageText: "Motor 1 Error 1: Motor Stalled"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "ControllerDataReadingTimeout"; messageText: "Motor 1 Error 1: Controller Data Reading Timeout"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "InvalidHallSensorSequence"; messageText: "Motor 1 Error 1: Invalid Hall Sensor Sequence"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "InvalidHallSector"; messageText: "Motor 1 Error 1: Invalid Hall Sector"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "ErrorReadingTempSensor"; messageText: "Motor 1 Error 1: Error Reading Temp Sensor"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "PositionSensorReadingError"; messageText: "Motor 1 Error 1: Position Sensor Reading Error"; severity: "high"; errorType: "motor" }

                   // ListElement { faultProperty: "ErrorReadingEncoder"; messageText: "Motor 1 Error 2: Error Reading Encoder"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "ZeroPositionOffsetNotSet"; messageText: "Motor 1 Error 2: Zero Position Offset not set"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "HwEnableNotSet"; messageText: "Motor 1 Error 2: HW Enable Not Set"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter1TempTooHigh"; messageText: "Motor 1 Error 2: Inverter 1 Temp Too High"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter2TempTooHigh"; messageText: "Motor 1 Error 2: Inverter 2 Temp Too High"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter3TempTooHigh"; messageText: "Motor 1 Error 2: Inverter 3 Temp Too High"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter4TempTooHigh"; messageText: "Motor 1 Error 2: Inverter 4 Temp Too High"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter5TempTooHigh"; messageText: "Motor 1 Error 2: Inverter 5 Temp Too High"; severity: "high"; errorType: "motor" }

                   // ListElement { faultProperty: "Inverter6TempTooHigh"; messageText: "Motor 1 Error 3: Inverter 6 Temp Too High"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "CpuTemperatureTooHigh"; messageText: "Motor 1 Error 3: CPU Temp too High"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "HallTemperatureTooHigh"; messageText: "Motor 1 Error 3: Hall Temp too High"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "DclinkTemperatureTooHigh"; messageText: "Motor 1 Error 3: DC Link Temp too High"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "ErrorInDclinkCommunication"; messageText: "Motor 1 Error 3: Error In DC Link Communication"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter1OvercurrentError"; messageText: "Motor 1 Error 3: Inverter 1 Overcurrent"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter2OvercurrentError"; messageText: "Motor 1 Error 3: Inverter 2 Overcurrent"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter3OvercurrentError"; messageText: "Motor 1 Error 3: Inverter 3 Overcurrent"; severity: "high"; errorType: "motor" }

                   // ListElement { faultProperty: "Inverter4OvercurrentError"; messageText: "Motor 1 Error 4: Inverter 4 Overcurrent"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter5OvercurrentError"; messageText: "Motor 1 Error 4: Inverter 5 Overcurrent"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter6OvercurrentError"; messageText: "Motor 1 Error 4: Inverter 6 Overcurrent"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "DcOvervoltageError"; messageText: "Motor 1 Error 4: DC Overvoltage"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "DcUndervoltageError"; messageText: "Motor 1 Error 4: DC Under Voltage"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "DoubleCanIdOnBus"; messageText: "Motor 1 Error 4: Double CAN id on bus"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "CanCommsTimeoutError"; messageText: "Motor 1 Error 4: CAN Comms timeout(>200ms)"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter1FaultError"; messageText: "Motor 1 Error 4: Inverter 1 Fault"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter2FaultError"; messageText: "Motor 1 Error 4: Inverter 2 Fault"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter3FaultError"; messageText: "Motor 1 Error 4: Inverter 3 Fault"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter4FaultError"; messageText: "Motor 1 Error 4: Inverter 4 Fault"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter5FaultError"; messageText: "Motor 1 Error 4: Inverter 5 Fault"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "Inverter6FaultError"; messageText: "Motor 1 Error 4: Inverter 6 Fault"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "CanSendError"; messageText: "Motor 1 Error 4: CAN send error"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "LostFramesOnCanBusError"; messageText: "Motor 1 Error 4: Lost Frames on CAN Bus"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "OverspeedError"; messageText: "Motor 1 Error 4: Overspeed Error"; severity: "high"; errorType: "motor" }
                   // ListElement { faultProperty: "CpuOverloaded"; messageText: "Motor 1 Error 5: CPU Overloaded"; severity: "high"; errorType: "motor" }
           }

           delegate: FaultsMessage {

               id: faultMessageItem
               visible: batteryObject[model.faultProperty]
               errorType: "battery"
                height: visible ?  33 : 0
               messageText: model.messageText
              width:  listView.width - (listView.currentIndex * 20)
           }
        }

    }

