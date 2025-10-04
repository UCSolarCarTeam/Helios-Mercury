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
                        text: "Internal Conversion Fault: " + batteryFaults.InternalConversionFault
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
                        text: "Temperature: " + mppt.Mppt0Ch0UnitTemperature
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
                        text: "Temperature: " + mppt.Mppt0Ch1UnitTemperature
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
                        text: "Temperature: " + mppt.Mppt1Ch0UnitTemperature
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
                        text: "Temperature: " + mppt.Mppt1Ch1UnitTemperature
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
                        text: "Temperature: " + mppt.Mppt2Ch0UnitTemperature
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
                        text: "Temperature: " + mppt.Mppt2Ch1UnitTemperature
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
                        text: "Temperature: " + mppt.Mppt3Ch0UnitTemperature
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
                        text: "Temperature: " + mppt.Mppt3Ch1UnitTemperature
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
                        text: "Common Contactor Command: " + mbms.CommonContactorCommand
                    }
                    Text {
                        text: "Motor Contactor Command: " + mbms.MotorContactorCommand
                    }
                    Text {
                        text: "Array Contactor Command: " + mbms.ArrayContactorCommand
                    }
                    Text {
                        text: "LV Contactor Command: " + mbms.LvContactorCommand
                    }
                    Text {
                        text: "Charge Contactor Command: " + mbms.ChargeContactorCommand
                    }
                    Text {
                        text: "Auxiliary Battery Voltage: " + mbms.AuxiliaryBatteryVoltage
                    }
                    Text {
                        text: "Strobe BMS Light: " + mbms.StrobeBmsLight
                    }
                    Text {
                        text: "Charge Enable: " + mbms.ChargeEnable
                    }
                    Text {
                        text: "Charge Safety: " + mbms.ChargeSafety
                    }
                    Text {
                        text: "Discharge Enable: " + mbms.DischargeEnable
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
                        text: "Startup State: " + mbms.StartupState
                    }
                    Text {
                        text: "System State: " + mbms.SystemState
                    }
                    Text {
                        text: "Main Power Switch: " + mbms.MainPowerSwitch
                    }
                    Text {
                        text: "External Shutdown: " + mbms.ExternalShutdown
                    }
                    Text {
                        text: "En1: " + mbms.En1
                    }
                    Text {
                        text: "DCDC Fault: " + mbms.DcdcFault
                    }
                    Text {
                        text: "Three A OC: " + mbms.ThreeAOc
                    }
                    Text {
                        text: "DCDC On: " + mbms.DcdcOn
                    }
                    Text {
                        text: "CHG Fault: " + mbms.ChgFault
                    }
                    Text {
                        text: "CHG On: " + mbms.ChgOn
                    }
                    Text {
                        text: "CHG LV En: " + mbms.ChgLvEn
                    }
                    Text {
                        text: "ABATT Disable: " + mbms.AbattDisable
                    }
                    Text {
                        text: "Key: " + mbms.Key
                    }
                    Text {
                        text: "High Cell Voltage Trip: " + mbms.HighCellVoltageTrip
                    }
                    Text {
                        text: "Low Cell Voltage Trip: " + mbms.LowCellVoltageTrip
                    }
                    Text {
                        text: "Common High Current Trip: " + mbms.CommonHighCurrentTrip
                    }
                    Text {
                        text: "Motor High Current Trip: " + mbms.MotorHighCurrentTrip
                    }
                    Text {
                        text: "Array High Current Trip: " + mbms.ArrayHighCurrentTrip
                    }
                    Text {
                        text: "LV High Current Trip: " + mbms.LvHighCurrentTrip
                    }
                    Text {
                        text: "Charge High Current Trip: " + mbms.ChargeHighCurrentTrip
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
                    Text {
                        text: "Contactor Connected Unexpectedly Trip: " + mbms.ContactorConnectedUnexpectedlyTrip
                    }
                    Text {
                        text: "Common Heartbeat Dead Trip: " + mbms.CommonHeartbeatDeadTrip
                    }
                    Text {
                        text: "Motor Heartbeat Dead Trip: " + mbms.MotorHeartbeatDeadTrip
                    }
                    Text {
                        text: "Array Heartbeat Dead Trip: " + mbms.ArrayHeartbeatDeadTrip
                    }
                    Text {
                        text: "LV Heartbeat Dead Trip: " + mbms.LvHeartbeatDeadTrip
                    }
                    Text {
                        text: "Charge Heartbeat Dead Trip: " + mbms.ChargeHeartbeatDeadTrip
                    }
                    Text {
                        text: "MPS Disabled Trip: " + mbms.MpsDisabledTrip
                    }
                    Text {
                        text: "ESD Enabled Trip: " + mbms.EsdEnabledTrip
                    }
                    Text {
                        text: "High Temperature Trip: " + mbms.HighTemperatureTrip
                    }
                    Text {
                        text: "Low Temperature Trip: " + mbms.LowTemperatureTrip
                    }
                    Text {
                        text: "High Cell Voltage Warning: " + mbms.HighCellVoltageWarning
                    }
                    Text {
                        text: "Low Cell Voltage Warning: " + mbms.LowCellVoltageWarning
                    }
                    Text {
                        text: "Common High Current Warning: " + mbms.CommonHighCurrentWarning
                    }
                    Text {
                        text: "Motor High Current Warning: " + mbms.MotorHighCurrentWarning
                    }
                    Text {
                        text: "Array High Current Warning: " + mbms.ArrayHighCurrentWarning
                    }
                    Text {
                        text: "LV High Current Warning: " + mbms.LvHighCurrentWarning
                    }
                    Text {
                        text: "Charge High Current Warning: " + mbms.ChargeHighCurrentWarning
                    }
                    Text {
                        text: "High Temperature Warning: " + mbms.HighTemperatureWarning
                    }
                    Text {
                        text: "Low Temperature Warning: " + mbms.LowTemperatureWarning
                    }
                    Text {
                        text: "CAN OC 12V Warning: " + mbms.CanOc12VWarning
                    }
                }

                Column {
                    Text {
                        text: "Battery"
                    }
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
                        text: "Charger Safety Enabled: " + battery.ChargerSafetyEnabled
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
                    Text {
                        text: "Maximum Cell Voltage: " + battery.MaximumCellVoltage
                    }
                    Text {
                        text: "Minimum Cell Voltage: " + battery.MinimumCellVoltage
                    }
                    Text {
                        text: "Maximum Pack Voltage: " + battery.MaximumPackVoltage
                    }
                    Text {
                        text: "Minimum Pack Voltage: " + battery.MinimumPackVoltage
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
                        text: "Tritium ID: " + motorDetails0.TritiumId
                    }
                    Text {
                        text: "Serial Number: " + motorDetails0.SerialNumber
                    }
                    Text {
                        text: "Limit Flags: " + motorDetails0.LimitFlags
                    }
                    Text {
                        text: "Error Flags: " + motorDetails0.ErrorFlags
                    }
                    Text {
                        text: "Active Motor: " + motorDetails0.ActiveMotor
                    }
                    Text {
                        text: "Tx Error Count: " + motorDetails0.TxErrorCount
                    }
                    Text {
                        text: "Rx Error Count: " + motorDetails0.RxErrorCount
                    }
                    Text {
                        text: "Bus Voltage: " + motorDetails0.BusVoltage
                    }
                    Text {
                        text: "Bus Current: " + motorDetails0.BusCurrent
                    }
                    Text {
                        text: "Motor Velocity: " + motorDetails0.MotorVelocity
                    }
                    Text {
                        text: "Vehicle Velocity: " + motorDetails0.VehicleVelocity
                    }
                    Text {
                        text: "Phase Current B: " + motorDetails0.PhaseCurrentB
                    }
                    Text {
                        text: "Phase Current C: " + motorDetails0.PhaseCurrentC
                    }
                    Text {
                        text: "Vq: " + motorDetails0.Vq
                    }
                    Text {
                        text: "Vd: " + motorDetails0.Vd
                    }
                    Text {
                        text: "Iq: " + motorDetails0.Iq
                    }
                    Text {
                        text: "Id: " + motorDetails0.Id
                    }
                    Text {
                        text: "BEMFq: " + motorDetails0.BEMFq
                    }
                    Text {
                        text: "BEMFd: " + motorDetails0.BEMFd
                    }
                    Text {
                        text: "Supply 15V: " + motorDetails0.Supply15V
                    }
                    Text {
                        text: "Reserved Supply 15V: " + motorDetails0.ReservedSupply15V
                    }
                    Text {
                        text: "Supply 1V9: " + motorDetails0.Supply1V9
                    }
                    Text {
                        text: "Supply 3V3: " + motorDetails0.Supply3V3
                    }
                    Text {
                        text: "Reserved 0A0: " + motorDetails0.Reserved0A0
                    }
                    Text {
                        text: "Reserved 0A1: " + motorDetails0.Reserved0A1
                    }
                    Text {
                        text: "Motor Temp: " + motorDetails0.MotorTemp
                    }
                    Text {
                        text: "Heatsink Temp: " + motorDetails0.HeatsinkTemp
                    }
                    Text {
                        text: "DSP Board Temp: " + motorDetails0.DspBoardTemp
                    }
                    Text {
                        text: "Reserved DSP Board Temp: " + motorDetails0.ReservedDspBoardTemp
                    }
                    Text {
                        text: "Reserved 0D0: " + motorDetails0.Reserved0D0
                    }
                    Text {
                        text: "Reserved 0D1: " + motorDetails0.Reserved0D1
                    }
                    Text {
                        text: "Odometer: " + motorDetails0.Odometer
                    }
                    Text {
                        text: "DC Bus Ah: " + motorDetails0.DCBusAh
                    }
                    Text {
                        text: "Slip Speed: " + motorDetails0.SlipSpeed
                    }
                    Text {
                        text: "Reserved Slip Speed: " + motorDetails0.ReservedSlipSpeed
                    }
                    Text {
                        text: "Motor ID: " + motorDetails0.MotorId
                    }
                }

                Column {
                    Text {
                        text: "Motor Details 1"
                    }
                    Text {
                        text: "Tritium ID: " + motorDetails1.TritiumId
                    }
                    Text {
                        text: "Serial Number: " + motorDetails1.SerialNumber
                    }
                    Text {
                        text: "Limit Flags: " + motorDetails1.LimitFlags
                    }
                    Text {
                        text: "Error Flags: " + motorDetails1.ErrorFlags
                    }
                    Text {
                        text: "Active Motor: " + motorDetails1.ActiveMotor
                    }
                    Text {
                        text: "Tx Error Count: " + motorDetails1.TxErrorCount
                    }
                    Text {
                        text: "Rx Error Count: " + motorDetails1.RxErrorCount
                    }
                    Text {
                        text: "Bus Voltage: " + motorDetails1.BusVoltage
                    }
                    Text {
                        text: "Bus Current: " + motorDetails1.BusCurrent
                    }
                    Text {
                        text: "Motor Velocity: " + motorDetails1.MotorVelocity
                    }
                    Text {
                        text: "Vehicle Velocity: " + motorDetails1.VehicleVelocity
                    }
                    Text {
                        text: "Phase Current B: " + motorDetails1.PhaseCurrentB
                    }
                    Text {
                        text: "Phase Current C: " + motorDetails1.PhaseCurrentC
                    }
                    Text {
                        text: "Vq: " + motorDetails1.Vq
                    }
                    Text {
                        text: "Vd: " + motorDetails1.Vd
                    }
                    Text {
                        text: "Iq: " + motorDetails1.Iq
                    }
                    Text {
                        text: "Id: " + motorDetails1.Id
                    }
                    Text {
                        text: "BEMFq: " + motorDetails1.BEMFq
                    }
                    Text {
                        text: "BEMFd: " + motorDetails1.BEMFd
                    }
                    Text {
                        text: "Supply 15V: " + motorDetails1.Supply15V
                    }
                    Text {
                        text: "Reserved Supply 15V: " + motorDetails1.ReservedSupply15V
                    }
                    Text {
                        text: "Supply 1V9: " + motorDetails1.Supply1V9
                    }
                    Text {
                        text: "Supply 3V3: " + motorDetails1.Supply3V3
                    }
                    Text {
                        text: "Reserved 0A0: " + motorDetails1.Reserved0A0
                    }
                    Text {
                        text: "Reserved 0A1: " + motorDetails1.Reserved0A1
                    }
                    Text {
                        text: "Motor Temp: " + motorDetails1.MotorTemp
                    }
                    Text {
                        text: "Heatsink Temp: " + motorDetails1.HeatsinkTemp
                    }
                    Text {
                        text: "DSP Board Temp: " + motorDetails1.DspBoardTemp
                    }
                    Text {
                        text: "Reserved DSP Board Temp: " + motorDetails1.ReservedDspBoardTemp
                    }
                    Text {
                        text: "Reserved 0D0: " + motorDetails1.Reserved0D0
                    }
                    Text {
                        text: "Reserved 0D1: " + motorDetails1.Reserved0D1
                    }
                    Text {
                        text: "Odometer: " + motorDetails1.Odometer
                    }
                    Text {
                        text: "DC Bus Ah: " + motorDetails1.DCBusAh
                    }
                    Text {
                        text: "Slip Speed: " + motorDetails1.SlipSpeed
                    }
                    Text {
                        text: "Reserved Slip Speed: " + motorDetails1.ReservedSlipSpeed
                    }
                    Text {
                        text: "Motor ID: " + motorDetails1.MotorId
                    }
                }

                Column {
                    Text {
                        text: "Key Motor"
                    }
                    Text {
                        text: "Velocity: " + keyMotor.KeyMotorVelocity
                    }
                    Text {
                        text: "Motor Current: " + keyMotor.MotorCurrent
                    }
                    Text {
                        text: "Bus Current Out: " + keyMotor.BusCurrentOut
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
                    Text {
                        text: "Is Telemetry Connected: " + pi.IsTelemetryConnected
                    }
                }

                Column {
                    Text {
                        text: "Contactors"
                    }
                    Text {
                        text: "Common Precharger Closed: " + contactor.CommonPrechargerClosed
                    }
                    Text {
                        text: "Common Precharger Closing: " + contactor.CommonPrechargerClosing
                    }
                    Text {
                        text: "Common Precharger Error: " + contactor.CommonPrechargerError
                    }
                    Text {
                        text: "Common Contactor Closed: " + contactor.CommonContactorClosed
                    }
                    Text {
                        text: "Common Contactor Closing: " + contactor.CommonContactorClosing
                    }
                    Text {
                        text: "Common Contactor Error: " + contactor.CommonContactorError
                    }
                    Text {
                        text: "Common Line Current: " + contactor.CommonLineCurrent
                    }
                    Text {
                        text: "Common Charge Current: " + contactor.CommonChargeCurrent
                    }
                    Text {
                        text: "Common Contactor Opening Error: " + contactor.CommonContactorOpeningError
                    }
                    Text {
                        text: "Motor Precharger Closed: " + contactor.MotorPrechargerClosed
                    }
                    Text {
                        text: "Motor Precharger Closing: " + contactor.MotorPrechargerClosing
                    }
                    Text {
                        text: "Motor Precharger Error: " + contactor.MotorPrechargerError
                    }
                    Text {
                        text: "Motor Contactor Closed: " + contactor.MotorContactorClosed
                    }
                    Text {
                        text: "Motor Contactor Closing: " + contactor.MotorContactorClosing
                    }
                    Text {
                        text: "Motor Contactor Error: " + contactor.MotorContactorError
                    }
                    Text {
                        text: "Motor Line Current: " + contactor.MotorLineCurrent
                    }
                    Text {
                        text: "Motor Charge Current: " + contactor.MotorChargeCurrent
                    }
                    Text {
                        text: "Motor BPS Error: " + contactor.MotorBPSError
                    }
                    Text {
                        text: "Array Precharger Closed: " + contactor.ArrayPrechargerClosed
                    }
                    Text {
                        text: "Array Precharger Closing: " + contactor.ArrayPrechargerClosing
                    }
                    Text {
                        text: "Array Precharger Error: " + contactor.ArrayPrechargerError
                    }
                    Text {
                        text: "Array Contactor Closed: " + contactor.ArrayContactorClosed
                    }
                    Text {
                        text: "Array Contactor Closing: " + contactor.ArrayContactorClosing
                    }
                    Text {
                        text: "Array Contactor Error: " + contactor.ArrayContactorError
                    }
                    Text {
                        text: "Array Line Current: " + contactor.ArrayLineCurrent
                    }
                    Text {
                        text: "Array Charge Current: " + contactor.ArrayChargeCurrent
                    }
                    Text {
                        text: "Array BPS Error: " + contactor.ArrayBPSError
                    }
                    Text {
                        text: "LV Precharger Closed: " + contactor.LvPrechargerClosed
                    }
                    Text {
                        text: "LV Precharger Closing: " + contactor.LvPrechargerClosing
                    }
                    Text {
                        text: "LV Precharger Error: " + contactor.LvPrechargerError
                    }
                    Text {
                        text: "LV Contactor Closed: " + contactor.LvContactorClosed
                    }
                    Text {
                        text: "LV Contactor Closing: " + contactor.LvContactorClosing
                    }
                    Text {
                        text: "LV Contactor Error: " + contactor.LvContactorError
                    }
                    Text {
                        text: "LV Line Current: " + contactor.LvLineCurrent
                    }
                    Text {
                        text: "LV Charge Current: " + contactor.LvChargeCurrent
                    }
                    Text {
                        text: "LV BPS Error: " + contactor.LvBpsError
                    }
                    Text {
                        text: "Charge Precharger Closed: " + contactor.ChargePrechargerClosed
                    }
                    Text {
                        text: "Charge Precharger Closing: " + contactor.ChargePrechargerClosing
                    }
                    Text {
                        text: "Charge Precharger Error: " + contactor.ChargePrechargerError
                    }
                    Text {
                        text: "Charge Contactor Closed: " + contactor.ChargeContactorClosed
                    }
                    Text {
                        text: "Charge Contactor Closing: " + contactor.ChargeContactorClosing
                    }
                    Text {
                        text: "Charge Contactor Error: " + contactor.ChargeContactorError
                    }
                    Text {
                        text: "Charge Line Current: " + contactor.ChargeLineCurrent
                    }
                    Text {
                        text: "Charge Charge Current: " + contactor.ChargeChargeCurrent
                    }
                    Text {
                        text: "Charge BPS Error: " + contactor.ChargeBPSError
                    }
                }
            }
        }
    }
}
