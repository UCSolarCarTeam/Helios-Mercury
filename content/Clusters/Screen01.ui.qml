/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import Mercury

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    ScrollView {
        id: scrollView
        x: 8
        y: 0
        width: 1904
        height: 4000
        focusPolicy: Qt.TabFocus
        rightPadding: 0
        z: 100
        contentHeight: 7500
        contentWidth: 2750

        Column {
            spacing: 20
            Row {
                spacing: 20

                Column {
                    Text {
                        text: "Proximity Sensors"
                    }
                    Text {
                        text: "PROX 1: " + proximitySensors.ProximitySensor1
                    }
                    Text {
                        text: "PROX 2: " + proximitySensors.ProximitySensor2
                    }
                    Text {
                        text: "PROX 3: " + proximitySensors.ProximitySensor3
                    }
                    Text {
                        text: "PROX 4: " + proximitySensors.ProximitySensor4
                    }
                }

                Column {
                    Text {
                        text: "Telemetry"
                    }
                    Text {
                        text: "GPS Year: " + telemetry.GpsYear
                    }
                    Text {
                        text: "GPS Month: " + telemetry.GpsMonth
                    }
                    Text {
                        text: "GPS Day: " + telemetry.GpsDay
                    }
                    Text {
                        text: "GPS Hour: " + telemetry.GpsHour
                    }
                    Text {
                        text: "GPS Minute: " + telemetry.GpsMinute
                    }
                    Text {
                        text: "GPS Second: " + telemetry.GpsSecond
                    }
                    Text {
                        text: "GPS Validity Flags: " + telemetry.GpsValidityFlags
                    }
                    Text {
                        text: "GPS Fix Status Flags: " + telemetry.GpsFixStatusFlags
                    }
                    Text {
                        text: "GPS Additional Flags: " + telemetry.GpsAdditionalFlags
                    }
                    Text {
                        text: "GPS Longitude: " + telemetry.GpsLongitude.toFixed(6)
                    }
                    Text {
                        text: "GPS Latitude: " + telemetry.GpsLatitude.toFixed(6)
                    }
                    Text {
                        text: "MPU Acceleration X: " + telemetry.MpuAccelerationX
                    }
                    Text {
                        text: "MPU Acceleration Y: " + telemetry.MpuAccelerationY
                    }
                    Text {
                        text: "MPU Acceleration Z: " + telemetry.MpuAccelerationZ
                    }
                    Text {
                        text: "MPU Rotation X: " + telemetry.MpuRotationX
                    }
                    Text {
                        text: "MPU Rotation Y: " + telemetry.MpuRotationY
                    }
                    Text {
                        text: "MPU Rotation Z: " + telemetry.MpuRotationZ
                    }
                    Text {
                        text: "MPU Temperature: " + telemetry.MpuTemperature
                    }
                }

                Column {
                    Text {
                        text: "B3"
                    }
                    Text {
                        text: "Right Signal In: " + b3.RightSignalInput
                    }
                    Text {
                        text: "Left Signal In: " + b3.LeftSignalInput
                    }
                    Text {
                        text: "Hazard Lights In: " + b3.HazardLightsInput
                    }
                    Text {
                        text: "Headlights Switch In: " + b3.HeadlightsSwitchInput
                    }
                    Text {
                        text: "Forward Digital: " + b3.ForwardDigital
                    }
                    Text {
                        text: "Neutral Digital: " + b3.NeutralDigital
                    }
                    Text {
                        text: "Reverse Digital: " + b3.ReverseDigital
                    }
                    Text {
                        text: "Horn Switch Digital: " + b3.HornSwitchDigital
                    }
                    Text {
                        text: "Brake Switch Digital: " + b3.BrakeSwitchDigital
                    }
                    Text {
                        text: "Handbrake Switch Digital: " + b3.HandbrakeSwitchDigital
                    }
                    Text {
                        text: "Motor Reset Digital: " + b3.MotorResetDigital
                    }
                    Text {
                        text: "Race Mode Digital: " + b3.RaceModeDigital
                    }
                    Text {
                        text: "LapDigital: " + b3.LapDigital
                    }
                    Text {
                        text: "Acceleration: " + b3.Acceleration
                    }
                    Text {
                        text: "Regen Braking: " + b3.RegenBraking
                    }
                    Text {
                        text: "Right Signal Status: " + b3.RightSignalStatus
                    }
                    Text {
                        text: "Left Signal Status: " + b3.LeftSignalStatus
                    }
                    Text {
                        text: "Daytime Running Light Signal Status: " + b3.DaytimeRunningLightSignalStatus
                    }
                    Text {
                        text: "Headlight Signal Status: " + b3.HeadlightSignalStatus
                    }
                    Text {
                        text: "Brake Light Signal Status: " + b3.BrakeLightSignalStatus
                    }
                    Text {
                        text: "Horn Signal Status: " + b3.HornSignalStatus
                    }
                }

                Column {
                    Text {
                        text: "Battery Faults"
                    }
                    Text {
                        text: "Internal Communication Fault: " + batteryFaults.InternalCommunicationFault
                    }
                    Text {
                        text: "Internal Conversion Fault: " + batteryFaults.InternalConverversionFault
                    }
                    Text {
                        text: "Weak Cell Fault: " + batteryFaults.WeakCellFault
                    }
                    Text {
                        text: "Low Cell Voltage Fault: " + batteryFaults.LowCellVoltageFault
                    }
                    Text {
                        text: "Open Wiring Fault: " + batteryFaults.OpenWiringFault
                    }
                    Text {
                        text: "Current Sensor Fault: " + batteryFaults.CurrentSensorFault
                    }
                    Text {
                        text: "Pack Voltage Sensor Fault: " + batteryFaults.PackVoltageSensorFault
                    }
                    Text {
                        text: "Weak Pack Fault: " + batteryFaults.WeakPackFault
                    }
                    Text {
                        text: "Voltage Redundancy Fault: " + batteryFaults.VoltageRedundancyFault
                    }
                    Text {
                        text: "Fan Monitor Fault: " + batteryFaults.FanMonitorFault
                    }
                    Text {
                        text: "Thermistor Fault: " + batteryFaults.ThermistorFault
                    }
                    Text {
                        text: "Canbus Communication Fault: " + batteryFaults.CanbusCommunicationFault
                    }
                    Text {
                        text: "Always On Supply Fault: " + batteryFaults.AlwaysOnSupplyFault
                    }
                    Text {
                        text: "High Voltage Isolation Fault: " + batteryFaults.HighVoltageIsolationFault
                    }
                    Text {
                        text: "Power Supply 12V Fault: " + batteryFaults.PowerSupply12VFault
                    }
                    Text {
                        text: "Charge Limit Enforcement Fault: " + batteryFaults.ChargeLimitEnforcementFault
                    }
                    Text {
                        text: "Discharge Limit Enforcement Fault: " + batteryFaults.DischargeLimitEnforcementFault
                    }
                    Text {
                        text: "Charger Safety Relay Fault: " + batteryFaults.ChargerSafetyRelayFault
                    }
                    Text {
                        text: "Internal Memory Fault: " + batteryFaults.InternalMemoryFault
                    }
                    Text {
                        text: "Internal Thermistor Fault: " + batteryFaults.InternalThermistorFault
                    }
                    Text {
                        text: "Internal Logic Fault: " + batteryFaults.InternalLogicFault
                    }
                    Text {
                        text: "DCL Reduced Due to Low SOC: " + batteryFaults.DclReducedDueToLowSoc
                    }
                    Text {
                        text: "DCL Reduced Due to High Cell Resistance: " + batteryFaults.DclReducedDueToHighCellResistance
                    }
                    Text {
                        text: "DCL Reduced Due to Temperature: " + batteryFaults.DclReducedDueToTemperature
                    }
                    Text {
                        text: "DCL Reduced Due to Low Cell Voltage: " + batteryFaults.DclReducedDueToLowCellVoltage
                    }
                    Text {
                        text: "DCL Reduced Due to Low Pack Voltage: " + batteryFaults.DclReducedDueToLowPackVoltage
                    }
                    Text {
                        text: "DCL and CCL Reduced Due to Voltage Failsafe: " + batteryFaults.DclAndCclReducedDueToVoltageFailsafe
                    }
                    Text {
                        text: "DCL and CCL Reduced Due to Communication Failsafe: " + batteryFaults.DclAndCclReducedDueToCommunicationFailsafe
                    }
                    Text {
                        text: "CCL Reduced Due to High SOC: " + batteryFaults.CclReducedDueToHighSoc
                    }
                    Text {
                        text: "CCL Reduced Due to High Cell Resistance: " + batteryFaults.CclReducedDueToHighCellResistance
                    }
                    Text {
                        text: "CCL Reduced Due to Temperature: " + batteryFaults.CclReducedDueToTemperature
                    }
                    Text {
                        text: "CCL Reduced Due to High Cell Voltage: " + batteryFaults.CclReducedDueToHighCellVoltage
                    }
                    Text {
                        text: "CCL Reduced Due to High Pack Voltage: " + batteryFaults.CclReducedDueToHighPackVoltage
                    }
                    Text {
                        text: "CCL Reduced Due to Charger Latch: " + batteryFaults.CclReducedDueToChargerLatch
                    }
                    Text {
                        text: "CCL Reduced Due to Alternate Current Limit: " + batteryFaults.CclReducedDueToAlternateCurrentLimit
                    }
                }

                Column {
                    Text {
                        text: "MPPT 0 Channel 0"
                    }
                    Text {
                        text: "Array Voltage: " + mppt.Mppt0Ch0ArrayVoltage
                    }
                    Text {
                        text: "Array Current: " + mppt.Mppt0Ch0ArrayCurrent
                    }
                    Text {
                        text: "Battery Voltage: " + mppt.Mppt0Ch0BatteryVoltage
                    }
                    Text {
                        text: "Temperature: " + mppt.Mppt0Ch0Temperature
                    }
                }
                Column {
                    Text {
                        text: "MPPT 0 Channel 1"
                    }
                    Text {
                        text: "Array Voltage: " + mppt.Mppt0Ch1ArrayVoltage
                    }
                    Text {
                        text: "Array Current: " + mppt.Mppt0Ch1ArrayCurrent
                    }
                    Text {
                        text: "Battery Voltage: " + mppt.Mppt0Ch1BatteryVoltage
                    }
                    Text {
                        text: "Temperature: " + mppt.Mppt0Ch1Temperature
                    }
                }
                Column {
                    Text {
                        text: "MPPT 1 Channel 0"
                    }
                    Text {
                        text: "Array Voltage: " + mppt.Mppt1Ch0ArrayVoltage
                    }
                    Text {
                        text: "Array Current: " + mppt.Mppt1Ch0ArrayCurrent
                    }
                    Text {
                        text: "Battery Voltage: " + mppt.Mppt1Ch0BatteryVoltage
                    }
                    Text {
                        text: "Temperature: " + mppt.Mppt1Ch0Temperature
                    }
                }
                Column {
                    Text {
                        text: "MPPT 1 Channel 1"
                    }
                    Text {
                        text: "Array Voltage: " + mppt.Mppt1Ch1ArrayVoltage
                    }
                    Text {
                        text: "Array Current: " + mppt.Mppt1Ch1ArrayCurrent
                    }
                    Text {
                        text: "Battery Voltage: " + mppt.Mppt1Ch1BatteryVoltage
                    }
                    Text {
                        text: "Temperature: " + mppt.Mppt1Ch1Temperature
                    }
                }
                Column {
                    Text {
                        text: "MPPT 2 Channel 0"
                    }
                    Text {
                        text: "Array Voltage: " + mppt.Mppt2Ch0ArrayVoltage
                    }
                    Text {
                        text: "Array Current: " + mppt.Mppt2Ch0ArrayCurrent
                    }
                    Text {
                        text: "Battery Voltage: " + mppt.Mppt2Ch0BatteryVoltage
                    }
                    Text {
                        text: "Temperature: " + mppt.Mppt2Ch0Temperature
                    }
                }
                Column {
                    Text {
                        text: "MPPT 2 Channel 1"
                    }
                    Text {
                        text: "Array Voltage: " + mppt.Mppt2Ch1ArrayVoltage
                    }
                    Text {
                        text: "Array Current: " + mppt.Mppt2Ch1ArrayCurrent
                    }
                    Text {
                        text: "Battery Voltage: " + mppt.Mppt2Ch1BatteryVoltage
                    }
                    Text {
                        text: "Temperature: " + mppt.Mppt2Ch1Temperature
                    }
                }
                Column {
                    Text {
                        text: "MPPT 3 Channel 0"
                    }
                    Text {
                        text: "Array Voltage: " + mppt.Mppt3Ch0ArrayVoltage
                    }
                    Text {
                        text: "Array Current: " + mppt.Mppt3Ch0ArrayCurrent
                    }
                    Text {
                        text: "Battery Voltage: " + mppt.Mppt3Ch0BatteryVoltage
                    }
                    Text {
                        text: "Temperature: " + mppt.Mppt3Ch0Temperature
                    }
                }
                Column {
                    Text {
                        text: "MPPT 3 Channel 1"
                    }
                    Text {
                        text: "Array Voltage: " + mppt.Mppt3Ch1ArrayVoltage
                    }
                    Text {
                        text: "Array Current: " + mppt.Mppt3Ch1ArrayCurrent
                    }
                    Text {
                        text: "Battery Voltage: " + mppt.Mppt3Ch1BatteryVoltage
                    }
                    Text {
                        text: "Temperature: " + mppt.Mppt3Ch1Temperature
                    }
                }
            }

            Row {
                spacing: 20

                Column {
                    Text {
                        text: "MBMS"
                    }
                    Text {
                        text: "Common Contactor State: " + mbms.CommonContactorState
                    }
                    Text {
                        text: "Motor Contactor State: " + mbms.MotorContactorState
                    }
                    Text {
                        text: "Array Contactor State: " + mbms.ArrayContactorState
                    }
                    Text {
                        text: "LV Contactor State: " + mbms.LvContactorState
                    }
                    Text {
                        text: "Charge Contactor State: " + mbms.ChargeContactorState
                    }
                    Text {
                        text: "Common Contactor Error: " + mbms.CommonContactorError
                    }
                    Text {
                        text: "Motor Contactor Error: " + mbms.MotorContactorError
                    }
                    Text {
                        text: "Array Contactor Error: " + mbms.ArrayContactorError
                    }
                    Text {
                        text: "LV Contactor Error: " + mbms.LvContactorError
                    }
                    Text {
                        text: "Charge Contactor Error: " + mbms.ChargeContactorError
                    }
                    Text {
                        text: "Strobe BMS Light: " + mbms.StrobeBmsLight
                    }
                    Text {
                        text: "Allow Charge: " + mbms.AllowCharge
                    }
                    Text {
                        text: "High Voltage Enable State: " + mbms.HighVoltageEnableState
                    }
                    Text {
                        text: "Allow Discharge: " + mbms.AllowDischarge
                    }
                    Text {
                        text: "Orion CAN Received Recently: " + mbms.OrionCanReceivedRecently
                    }
                    Text {
                        text: "Discharge Should Trip: " + mbms.DischargeShouldTrip
                    }
                    Text {
                        text: "Charge Should Trip: " + mbms.ChargeShouldTrip
                    }
                    Text {
                        text: "Auxillary Battery Voltage: " + mbms.AuxillaryBatteryVoltage
                    }
                    Text {
                        text: "Motor Voltage: " + mbms.MotorVoltage
                    }
                    Text {
                        text: "Array Voltage: " + mbms.ArrayVoltage
                    }
                    Text {
                        text: "LV Voltage: " + mbms.LvVoltage
                    }
                    Text {
                        text: "Charge Voltage: " + mbms.ChargeVoltage
                    }
                    Text {
                        text: "Common Current: " + mbms.CommonCurrent
                    }
                    Text {
                        text: "Motor Current: " + mbms.MotorCurrent
                    }
                    Text {
                        text: "Array Current: " + mbms.ArrayCurrent
                    }
                    Text {
                        text: "LV Current: " + mbms.LvCurrent
                    }
                    Text {
                        text: "Charge Current: " + mbms.ChargeCurrent
                    }
                    Text {
                        text: "High Cell Voltage Trip: " + mbms.HighCellVoltageTrip
                    }
                    Text {
                        text: "Low Cell Voltage Trip: " + mbms.LowCellVoltageTrip
                    }
                    Text {
                        text: "High Common Current Trip: " + mbms.HighCommonCurrentTrip
                    }
                    Text {
                        text: "Motor High Temperature Current Trip: " + mbms.MotorHighTemperatureCurrentTrip
                    }
                    Text {
                        text: "Array High Temperature Current Trip: " + mbms.ArrayHighTemperatureCurrentTrip
                    }
                    Text {
                        text: "LV High Temperature Current Trip: " + mbms.LvHighTemperatureCurrentTrip
                    }
                    Text {
                        text: "Charge High Temperature Current Trip: " + mbms.ChargeHighTemperatureCurrentTrip
                    }
                    Text {
                        text: "Protection Trip: " + mbms.ProtectionTrip
                    }
                    Text {
                        text: "Orion Message Timeout Trip: " + mbms.OrionMessageTimeoutTrip
                    }
                    Text {
                        text: "Contactor Disconnected Unexpectedly Trip: " + mbms.ContactorDisconnectedUnexpectedlyTrip
                    }
                }

                Column {
                    Text {
                        text: "BMU Alive: " + battery.BmuAlive
                    }
                    Text {
                        text: "Discharge Relay Enabled: " + battery.DischargeRelayEnabled
                    }
                    Text {
                        text: "Charge Relay Enabled: " + battery.ChargeRelayEnabled
                    }
                    Text {
                        text: "Charger Safety Relay Enabled: " + battery.ChargerSafetyRelayEnabled
                    }
                    Text {
                        text: "Malfunction Indicator Active: " + battery.MalfunctionIndicatorActive
                    }
                    Text {
                        text: "Multi Purpose Input Signal Status: " + battery.MultiPurposeInputSignalStatus
                    }
                    Text {
                        text: "Always On Signal Status: " + battery.AlwaysOnSignalStatus
                    }
                    Text {
                        text: "Is Ready Signal Status: " + battery.IsReadySignalStatus
                    }
                    Text {
                        text: "Is Charging Signal Status: " + battery.IsChargingSignalStatus
                    }
                    Text {
                        text: "Populated Cells: " + battery.PopulatedCells
                    }
                    Text {
                        text: "Input 12V: " + battery.Input12V.toFixed(3)
                    }
                    Text {
                        text: "Fan Voltage: " + battery.FanVoltage.toFixed(3)
                    }
                    Text {
                        text: "Pack Current: " + battery.PackCurrent.toFixed(3)
                    }
                    Text {
                        text: "Pack Voltage: " + battery.PackVoltage.toFixed(3)
                    }
                    Text {
                        text: "Pack State Of Charge: " + battery.PackStateOfCharge.toFixed(3)
                    }
                    Text {
                        text: "Pack Amphours: " + battery.PackAmphours.toFixed(3)
                    }
                    Text {
                        text: "Pack Depth Of Discharge: " + battery.PackDepthOfDischarge.toFixed(3)
                    }
                    Text {
                        text: "High Temperature: " + battery.HighTemperature
                    }
                    Text {
                        text: "High Thermistor Id: " + battery.HighThermistorId
                    }
                    Text {
                        text: "Low Temperature: " + battery.LowTemperature
                    }
                    Text {
                        text: "Low Thermistor Id: " + battery.LowThermistorId
                    }
                    Text {
                        text: "Average Temperature: " + battery.AverageTemperature
                    }
                    Text {
                        text: "Internal Temperature: " + battery.InternalTemperature
                    }
                    Text {
                        text: "Fan Speed: " + battery.FanSpeed
                    }
                    Text {
                        text: "Requested Fan Speed: " + battery.RequestedFanSpeed
                    }
                    Text {
                        text: "Low Cell Voltage: " + battery.LowCellVoltage
                    }
                    Text {
                        text: "Low Cell Voltage Id: " + battery.LowCellVoltageId
                    }
                    Text {
                        text: "High Cell Voltage: " + battery.HighCellVoltage
                    }
                    Text {
                        text: "High Cell Voltage Id: " + battery.HighCellVoltageId
                    }
                    Text {
                        text: "Average Cell Voltage: " + battery.AverageCellVoltage
                    }
                }
            }

            Row {
                spacing: 20

                Column {
                    Text {
                        text: "Motor Details 0"
                    }
                    Text {
                        text: "Control Value: " + motorDetails0.ControlValue
                    }
                    Text {
                        text: "Control Mode: " + motorDetails0.ControlMode
                    }
                    Text {
                        text: "Motor Mode: " + motorDetails0.MotorMode
                    }
                    Text {
                        text: "Software Enable: " + motorDetails0.SoftwareEnable
                    }
                    Text {
                        text: "Debug Mode: " + motorDetails0.DebugMode
                    }
                    Text {
                        text: "Current Motor Torque: " + motorDetails0.CurrentMotorTorque
                    }
                    Text {
                        text: "Current RPM Value: " + motorDetails0.CurrentRpmValue
                    }
                    Text {
                        text: "Motor Temperature: " + motorDetails0.MotorTemperature
                    }
                    Text {
                        text: "Inverter Peak Current: " + motorDetails0.InverterPeakCurrent
                    }
                    Text {
                        text: "Current Motor Power: " + motorDetails0.CurrentMotorPower
                    }
                    Text {
                        text: "Absolute Angle: " + motorDetails0.AbsuluteAngle
                    }
                    Text {
                        text: "Motor About To Stall: " + motorDetails0.MotorAboutToStall
                    }
                    Text {
                        text: "Delay In Reading Temp Sensor: " + motorDetails0.DelayInReadingTempSensor
                    }
                    Text {
                        text: "Delay In Reading Pos Sensor: " + motorDetails0.DelayInReadingPosSensor
                    }
                    Text {
                        text: "Inverter 1 Temp Very High: " + motorDetails0.Inverter1TempVeryHigh
                    }
                    Text {
                        text: "Inverter 2 Temp Very High: " + motorDetails0.Inverter2TempVeryHigh
                    }
                    Text {
                        text: "Inverter 3 Temp Very High: " + motorDetails0.Inverter3TempVeryHigh
                    }
                    Text {
                        text: "Inverter 4 Temp Very High: " + motorDetails0.Inverter4TempVeryHigh
                    }
                    Text {
                        text: "Inverter 5 Temp Very High: " + motorDetails0.Inverter5TempVeryHigh
                    }
                    Text {
                        text: "Inverter 6 Temp Very High: " + motorDetails0.Inverter6TempVeryHigh
                    }
                    Text {
                        text: "CPU Temperature Very High: " + motorDetails0.CpuTemperatureVeryHigh
                    }
                    Text {
                        text: "Hall Temperature Very High: " + motorDetails0.HallTemperatureVeryHigh
                    }
                    Text {
                        text: "DCLINK Temperature Very High: " + motorDetails0.DclinkTemperatureVeryHigh
                    }
                    Text {
                        text: "Delay In DCLINK Communication: " + motorDetails0.DelayInDclinkCommunication
                    }
                    Text {
                        text: "Inverter 1 Over Current Warning: " + motorDetails0.Inverter1OverCurrentWarning
                    }
                    Text {
                        text: "Inverter 2 Over Current Warning: " + motorDetails0.Inverter2OverCurrentWarning
                    }
                    Text {
                        text: "Inverter 3 Over Current Warning: " + motorDetails0.Inverter3OverCurrentWarning
                    }
                    Text {
                        text: "Inverter 4 Over Current Warning: " + motorDetails0.Inverter4OverCurrentWarning
                    }
                    Text {
                        text: "Inverter 5 Over Current Warning: " + motorDetails0.Inverter5OverCurrentWarning
                    }
                    Text {
                        text: "Inverter 6 Over Current Warning: " + motorDetails0.Inverter6OverCurrentWarning
                    }
                    Text {
                        text: "DC Overvoltage Warning: " + motorDetails0.DcOvervoltageWarning
                    }
                    Text {
                        text: "DC Undervoltage Warning: " + motorDetails0.DcUndervoltageWarning
                    }
                    Text {
                        text: "CAN Comms Timeout: " + motorDetails0.CanCommsTimeout
                    }
                    Text {
                        text: "Inverter 1 Fault Warning: " + motorDetails0.Inverter1FaultWarning
                    }
                    Text {
                        text: "Inverter 2 Fault Warning: " + motorDetails0.Inverter2FaultWarning
                    }
                    Text {
                        text: "Inverter 3 Fault Warning: " + motorDetails0.Inverter3FaultWarning
                    }
                    Text {
                        text: "Inverter 4 Fault Warning: " + motorDetails0.Inverter4FaultWarning
                    }
                    Text {
                        text: "Inverter 5 Fault Warning: " + motorDetails0.Inverter5FaultWarning
                    }
                    Text {
                        text: "Inverter 6 Fault Warning: " + motorDetails0.Inverter6FaultWarning
                    }
                    Text {
                        text: "CAN Send Warning: " + motorDetails0.CanSendWarning
                    }
                    Text {
                        text: "Lost Frames On CAN Bus Warning: " + motorDetails0.LostFramesOnCanBusWarning
                    }
                    Text {
                        text: "Overspeed Warning: " + motorDetails0.OverspeedWarning
                    }
                    Text {
                        text: "CPU Overload: " + motorDetails0.CpuOverload
                    }
                    Text {
                        text: "Torque Limited: " + motorDetails0.TorqueLimited
                    }
                    Text {
                        text: "Start At High RPM: " + motorDetails0.StartAtHighRpm
                    }
                    Text {
                        text: "Init Error: " + motorDetails0.InitError
                    }
                    Text {
                        text: "Settings Not Found: " + motorDetails0.SettingsNotFound
                    }
                    Text {
                        text: "Motor Stalled: " + motorDetails0.MotorStalled
                    }
                    Text {
                        text: "Controller Data Reading Timeout: " + motorDetails0.ControllerDataReadingTimeout
                    }
                    Text {
                        text: "Invalid Hall Sensor Sequence: " + motorDetails0.InvalidHallSensorSequence
                    }
                    Text {
                        text: "Invalid Hall Sector: " + motorDetails0.InvalidHallSector
                    }
                    Text {
                        text: "Error Reading Temp Sensor: " + motorDetails0.ErrorReadingTempSensor
                    }
                    Text {
                        text: "Position Sensor Reading Error: " + motorDetails0.PositionSensorReadingError
                    }
                    Text {
                        text: "Error Reading Encoder: " + motorDetails0.ErrorReadingEncoder
                    }
                    Text {
                        text: "Zero Position Offset Not Set: " + motorDetails0.ZeroPositionOffsetNotSet
                    }
                    Text {
                        text: "HW Enable Not Set: " + motorDetails0.HwEnableNotSet
                    }
                    Text {
                        text: "Inverter 1 Temp Too High: " + motorDetails0.Inverter1TempTooHigh
                    }
                    Text {
                        text: "Inverter 2 Temp Too High: " + motorDetails0.Inverter2TempTooHigh
                    }
                    Text {
                        text: "Inverter 3 Temp Too High: " + motorDetails0.Inverter3TempTooHigh
                    }
                    Text {
                        text: "Inverter 4 Temp Too High: " + motorDetails0.Inverter4TempTooHigh
                    }
                    Text {
                        text: "Inverter 5 Temp Too High: " + motorDetails0.Inverter5TempTooHigh
                    }
                    Text {
                        text: "Inverter 6 Temp Too High: " + motorDetails0.Inverter6TempTooHigh
                    }
                    Text {
                        text: "CPU Temperature Too High: " + motorDetails0.CpuTemperatureTooHigh
                    }
                    Text {
                        text: "Hall Temperature Too High: " + motorDetails0.HallTemperatureTooHigh
                    }
                    Text {
                        text: "DCLINK Temperature Too High: " + motorDetails0.DclinkTemperatureTooHigh
                    }
                    Text {
                        text: "Error In DCLINK Communication: " + motorDetails0.ErrorInDclinkCommunication
                    }
                    Text {
                        text: "Inverter 1 Overcurrent Error: " + motorDetails0.Inverter1OvercurrentError
                    }
                    Text {
                        text: "Inverter 2 Overcurrent Error: " + motorDetails0.Inverter2OvercurrentError
                    }
                    Text {
                        text: "Inverter 3 Overcurrent Error: " + motorDetails0.Inverter3OvercurrentError
                    }
                    Text {
                        text: "Inverter 4 Overcurrent Error: " + motorDetails0.Inverter4OvercurrentError
                    }
                    Text {
                        text: "Inverter 5 Overcurrent Error: " + motorDetails0.Inverter5OvercurrentError
                    }
                    Text {
                        text: "Inverter 6 Overcurrent Error: " + motorDetails0.Inverter6OvercurrentError
                    }
                    Text {
                        text: "DC Overvoltage Error: " + motorDetails0.DcOvervoltageError
                    }
                    Text {
                        text: "DC Undervoltage Error: " + motorDetails0.DcUndervoltageError
                    }
                    Text {
                        text: "Double CAN ID On Bus: " + motorDetails0.DoubleCanIdOnBus
                    }
                    Text {
                        text: "CAN Comms Timeout Error: " + motorDetails0.CanCommsTimeoutError
                    }
                    Text {
                        text: "Inverter 1 Fault Error: " + motorDetails0.Inverter1FaultError
                    }
                    Text {
                        text: "Inverter 2 Fault Error: " + motorDetails0.Inverter2FaultError
                    }
                    Text {
                        text: "Inverter 3 Fault Error: " + motorDetails0.Inverter3FaultError
                    }
                    Text {
                        text: "Inverter 4 Fault Error: " + motorDetails0.Inverter4FaultError
                    }
                    Text {
                        text: "Inverter 5 Fault Error: " + motorDetails0.Inverter5FaultError
                    }
                    Text {
                        text: "Inverter 6 Fault Error: " + motorDetails0.Inverter6FaultError
                    }
                    Text {
                        text: "CAN Send Error: " + motorDetails0.CanSendError
                    }
                    Text {
                        text: "Lost Frames On CAN Bus Error: " + motorDetails0.LostFramesOnCanBusError
                    }
                    Text {
                        text: "Overspeed Error: " + motorDetails0.OverspeedError
                    }
                    Text {
                        text: "CPU Overloaded: " + motorDetails0.CpuOverloaded
                    }
                }

                Column {
                    Text {
                        text: "Motor Details 1"
                    }
                    Text {
                        text: "Control Value: " + motorDetails1.ControlValue
                    }
                    Text {
                        text: "Control Mode: " + motorDetails1.ControlMode
                    }
                    Text {
                        text: "Motor Mode: " + motorDetails1.MotorMode
                    }
                    Text {
                        text: "Software Enable: " + motorDetails1.SoftwareEnable
                    }
                    Text {
                        text: "Debug Mode: " + motorDetails1.DebugMode
                    }
                    Text {
                        text: "Current Motor Torque: " + motorDetails1.CurrentMotorTorque
                    }
                    Text {
                        text: "Current RPM Value: " + motorDetails1.CurrentRpmValue
                    }
                    Text {
                        text: "Motor Temperature: " + motorDetails1.MotorTemperature
                    }
                    Text {
                        text: "Inverter Peak Current: " + motorDetails1.InverterPeakCurrent
                    }
                    Text {
                        text: "Current Motor Power: " + motorDetails1.CurrentMotorPower
                    }
                    Text {
                        text: "Absolute Angle: " + motorDetails1.AbsuluteAngle
                    }
                    Text {
                        text: "Motor About To Stall: " + motorDetails1.MotorAboutToStall
                    }
                    Text {
                        text: "Delay In Reading Temp Sensor: " + motorDetails1.DelayInReadingTempSensor
                    }
                    Text {
                        text: "Delay In Reading Pos Sensor: " + motorDetails1.DelayInReadingPosSensor
                    }
                    Text {
                        text: "Inverter 1 Temp Very High: " + motorDetails1.Inverter1TempVeryHigh
                    }
                    Text {
                        text: "Inverter 2 Temp Very High: " + motorDetails1.Inverter2TempVeryHigh
                    }
                    Text {
                        text: "Inverter 3 Temp Very High: " + motorDetails1.Inverter3TempVeryHigh
                    }
                    Text {
                        text: "Inverter 4 Temp Very High: " + motorDetails1.Inverter4TempVeryHigh
                    }
                    Text {
                        text: "Inverter 5 Temp Very High: " + motorDetails1.Inverter5TempVeryHigh
                    }
                    Text {
                        text: "Inverter 6 Temp Very High: " + motorDetails1.Inverter6TempVeryHigh
                    }
                    Text {
                        text: "CPU Temperature Very High: " + motorDetails1.CpuTemperatureVeryHigh
                    }
                    Text {
                        text: "Hall Temperature Very High: " + motorDetails1.HallTemperatureVeryHigh
                    }
                    Text {
                        text: "DCLINK Temperature Very High: " + motorDetails1.DclinkTemperatureVeryHigh
                    }
                    Text {
                        text: "Delay In DCLINK Communication: " + motorDetails1.DelayInDclinkCommunication
                    }
                    Text {
                        text: "Inverter 1 Over Current Warning: " + motorDetails1.Inverter1OverCurrentWarning
                    }
                    Text {
                        text: "Inverter 2 Over Current Warning: " + motorDetails1.Inverter2OverCurrentWarning
                    }
                    Text {
                        text: "Inverter 3 Over Current Warning: " + motorDetails1.Inverter3OverCurrentWarning
                    }
                    Text {
                        text: "Inverter 4 Over Current Warning: " + motorDetails1.Inverter4OverCurrentWarning
                    }
                    Text {
                        text: "Inverter 5 Over Current Warning: " + motorDetails1.Inverter5OverCurrentWarning
                    }
                    Text {
                        text: "Inverter 6 Over Current Warning: " + motorDetails1.Inverter6OverCurrentWarning
                    }
                    Text {
                        text: "DC Overvoltage Warning: " + motorDetails1.DcOvervoltageWarning
                    }
                    Text {
                        text: "DC Undervoltage Warning: " + motorDetails1.DcUndervoltageWarning
                    }
                    Text {
                        text: "CAN Comms Timeout: " + motorDetails1.CanCommsTimeout
                    }
                    Text {
                        text: "Inverter 1 Fault Warning: " + motorDetails1.Inverter1FaultWarning
                    }
                    Text {
                        text: "Inverter 2 Fault Warning: " + motorDetails1.Inverter2FaultWarning
                    }
                    Text {
                        text: "Inverter 3 Fault Warning: " + motorDetails1.Inverter3FaultWarning
                    }
                    Text {
                        text: "Inverter 4 Fault Warning: " + motorDetails1.Inverter4FaultWarning
                    }
                    Text {
                        text: "Inverter 5 Fault Warning: " + motorDetails1.Inverter5FaultWarning
                    }
                    Text {
                        text: "Inverter 6 Fault Warning: " + motorDetails1.Inverter6FaultWarning
                    }
                    Text {
                        text: "CAN Send Warning: " + motorDetails1.CanSendWarning
                    }
                    Text {
                        text: "Lost Frames On CAN Bus Warning: " + motorDetails1.LostFramesOnCanBusWarning
                    }
                    Text {
                        text: "Overspeed Warning: " + motorDetails1.OverspeedWarning
                    }
                    Text {
                        text: "CPU Overload: " + motorDetails1.CpuOverload
                    }
                    Text {
                        text: "Torque Limited: " + motorDetails1.TorqueLimited
                    }
                    Text {
                        text: "Start At High RPM: " + motorDetails1.StartAtHighRpm
                    }
                    Text {
                        text: "Init Error: " + motorDetails1.InitError
                    }
                    Text {
                        text: "Settings Not Found: " + motorDetails1.SettingsNotFound
                    }
                    Text {
                        text: "Motor Stalled: " + motorDetails1.MotorStalled
                    }
                    Text {
                        text: "Controller Data Reading Timeout: " + motorDetails1.ControllerDataReadingTimeout
                    }
                    Text {
                        text: "Invalid Hall Sensor Sequence: " + motorDetails1.InvalidHallSensorSequence
                    }
                    Text {
                        text: "Invalid Hall Sector: " + motorDetails1.InvalidHallSector
                    }
                    Text {
                        text: "Error Reading Temp Sensor: " + motorDetails1.ErrorReadingTempSensor
                    }
                    Text {
                        text: "Position Sensor Reading Error: " + motorDetails1.PositionSensorReadingError
                    }
                    Text {
                        text: "Error Reading Encoder: " + motorDetails1.ErrorReadingEncoder
                    }
                    Text {
                        text: "Zero Position Offset Not Set: " + motorDetails1.ZeroPositionOffsetNotSet
                    }
                    Text {
                        text: "HW Enable Not Set: " + motorDetails1.HwEnableNotSet
                    }
                    Text {
                        text: "Inverter 1 Temp Too High: " + motorDetails1.Inverter1TempTooHigh
                    }
                    Text {
                        text: "Inverter 2 Temp Too High: " + motorDetails1.Inverter2TempTooHigh
                    }
                    Text {
                        text: "Inverter 3 Temp Too High: " + motorDetails1.Inverter3TempTooHigh
                    }
                    Text {
                        text: "Inverter 4 Temp Too High: " + motorDetails1.Inverter4TempTooHigh
                    }
                    Text {
                        text: "Inverter 5 Temp Too High: " + motorDetails1.Inverter5TempTooHigh
                    }
                    Text {
                        text: "Inverter 6 Temp Too High: " + motorDetails1.Inverter6TempTooHigh
                    }
                    Text {
                        text: "CPU Temperature Too High: " + motorDetails1.CpuTemperatureTooHigh
                    }
                    Text {
                        text: "Hall Temperature Too High: " + motorDetails1.HallTemperatureTooHigh
                    }
                    Text {
                        text: "DCLINK Temperature Too High: " + motorDetails1.DclinkTemperatureTooHigh
                    }
                    Text {
                        text: "Error In DCLINK Communication: " + motorDetails1.ErrorInDclinkCommunication
                    }
                    Text {
                        text: "Inverter 1 Overcurrent Error: " + motorDetails1.Inverter1OvercurrentError
                    }
                    Text {
                        text: "Inverter 2 Overcurrent Error: " + motorDetails1.Inverter2OvercurrentError
                    }
                    Text {
                        text: "Inverter 3 Overcurrent Error: " + motorDetails1.Inverter3OvercurrentError
                    }
                    Text {
                        text: "Inverter 4 Overcurrent Error: " + motorDetails1.Inverter4OvercurrentError
                    }
                    Text {
                        text: "Inverter 5 Overcurrent Error: " + motorDetails1.Inverter5OvercurrentError
                    }
                    Text {
                        text: "Inverter 6 Overcurrent Error: " + motorDetails1.Inverter6OvercurrentError
                    }
                    Text {
                        text: "DC Overvoltage Error: " + motorDetails1.DcOvervoltageError
                    }
                    Text {
                        text: "DC Undervoltage Error: " + motorDetails1.DcUndervoltageError
                    }
                    Text {
                        text: "Double CAN ID On Bus: " + motorDetails1.DoubleCanIdOnBus
                    }
                    Text {
                        text: "CAN Comms Timeout Error: " + motorDetails1.CanCommsTimeoutError
                    }
                    Text {
                        text: "Inverter 1 Fault Error: " + motorDetails1.Inverter1FaultError
                    }
                    Text {
                        text: "Inverter 2 Fault Error: " + motorDetails1.Inverter2FaultError
                    }
                    Text {
                        text: "Inverter 3 Fault Error: " + motorDetails1.Inverter3FaultError
                    }
                    Text {
                        text: "Inverter 4 Fault Error: " + motorDetails1.Inverter4FaultError
                    }
                    Text {
                        text: "Inverter 5 Fault Error: " + motorDetails1.Inverter5FaultError
                    }
                    Text {
                        text: "Inverter 6 Fault Error: " + motorDetails1.Inverter6FaultError
                    }
                    Text {
                        text: "CAN Send Error: " + motorDetails1.CanSendError
                    }
                    Text {
                        text: "Lost Frames On CAN Bus Error: " + motorDetails1.LostFramesOnCanBusError
                    }
                    Text {
                        text: "Overspeed Error: " + motorDetails1.OverspeedError
                    }
                    Text {
                        text: "CPU Overloaded: " + motorDetails1.CpuOverloaded
                    }
                }

                Column {
                    Text {
                        text: "Key Motor"
                    }
                    Text {
                        text: "Motor Setpoint: " + keyMotor.MotorSetpoint
                    }
                    Text {
                        text: "Control Mode: " + keyMotor.ControlMode
                    }
                    Text {
                        text: "Motor Mode: " + keyMotor.MotorMode
                    }
                    Text {
                        text: "Software Enable: " + keyMotor.SoftwareEnable
                    }
                    Text {
                        text: "Debug Mode: " + keyMotor.DebugMode
                    }
                }

                Column {
                    Text {
                        text: "Pi"
                    }
                    Text {
                        text: "Rfid: " + pi.Rfid
                    }
                    Text {
                        text: "Driver Name: " + pi.DriverName
                    }
                    Text {
                        text: "Car Latency: " + pi.Latency
                    }
                }
            }
        }
    }
}
