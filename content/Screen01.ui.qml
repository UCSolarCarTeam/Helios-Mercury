

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
                        text: "GPS Longitude: " + telemetry.GpsLongitude
                    }
                    Text {
                        text: "GPS Latitude: " + telemetry.GpsLatitude
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
                        text: "Right Signal In: " + b3.RightSignalIn
                    }
                    Text {
                        text: "Left Signal In: " + b3.LeftSignalIn
                    }
                    Text {
                        text: "Hazard Lights In: " + b3.HazardLightsIn
                    }
                    Text {
                        text: "Headlights Switch In: " + b3.HeadlightsSwitchIn
                    }
                    Text {
                        text: "Forward Switch In: " + b3.ForwardSwitchIn
                    }
                    Text {
                        text: "Horn Switch In: " + b3.HornSwitchIn
                    }
                    Text {
                        text: "Forward In: " + b3.ForwardIn
                    }
                    Text {
                        text: "Neutral: " + b3.Neutral
                    }
                    Text {
                        text: "Reverse: " + b3.Reverse
                    }
                    Text {
                        text: "Brake Switch: " + b3.BrakeSwitch
                    }
                    Text {
                        text: "Handbrake Switch: " + b3.HandbrakeSwitch
                    }
                    Text {
                        text: "Motor Reset: " + b3.MotorReset
                    }
                    Text {
                        text: "Race Mode: " + b3.RaceMode
                    }
                    Text {
                        text: "Lap: " + b3.Lap
                    }
                    Text {
                        text: "Zoom Zoom: " + b3.ZoomZoom
                    }
                    Text {
                        text: "Acceleration: " + b3.Acceleration
                    }
                    Text {
                        text: "Regen Braking: " + b3.RegenBraking
                    }
                    Text {
                        text: "Right Signal Out: " + b3.RightSignalOut
                    }
                    Text {
                        text: "Left Signal Out: " + b3.LeftSignalOut
                    }
                    Text {
                        text: "Daytime Running Light Signal Out: " + b3.DaytimeRunningLightSignalOut
                    }
                    Text {
                        text: "Headlight Signal Out: " + b3.HeadlightSignalOut
                    }
                    Text {
                        text: "Brake Light Signal Out: " + b3.BrakeLightSignalOut
                    }
                    Text {
                        text: "Horn Signal Out: " + b3.HornSignalOut
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
                        text: "Discharge Limit Enforcement Fault: "
                            + batteryFaults.DischargeLimitEnforcementFault
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
                        text: "DCL Reduced Due to High Cell Resistance: "
                            + batteryFaults.DclReducedDueToHighCellResistance
                    }
                    Text {
                        text: "DCL Reduced Due to Temperature: " + batteryFaults.DclReducedDueToTemperature
                    }
                    Text {
                        text: "DCL Reduced Due to Low Cell Voltage: "
                            + batteryFaults.DclReducedDueToLowCellVoltage
                    }
                    Text {
                        text: "DCL Reduced Due to Low Pack Voltage: "
                            + batteryFaults.DclReducedDueToLowPackVoltage
                    }
                    Text {
                        text: "DCL and CCL Reduced Due to Voltage Failsafe: "
                            + batteryFaults.DclAndCclReducedDueToVoltageFailsafe
                    }
                    Text {
                        text: "DCL and CCL Reduced Due to Communication Failsafe: "
                            + batteryFaults.DclAndCclReducedDueToCommunicationFailsafe
                    }
                    Text {
                        text: "CCL Reduced Due to High SOC: " + batteryFaults.CclReducedDueToHighSoc
                    }
                    Text {
                        text: "CCL Reduced Due to High Cell Resistance: "
                            + batteryFaults.CclReducedDueToHighCellResistance
                    }
                    Text {
                        text: "CCL Reduced Due to Temperature: " + batteryFaults.CclReducedDueToTemperature
                    }
                    Text {
                        text: "CCL Reduced Due to High Cell Voltage: "
                            + batteryFaults.CclReducedDueToHighCellVoltage
                    }
                    Text {
                        text: "CCL Reduced Due to High Pack Voltage: "
                            + batteryFaults.CclReducedDueToHighPackVoltage
                    }
                    Text {
                        text: "CCL Reduced Due to Charger Latch: "
                            + batteryFaults.CclReducedDueToChargerLatch
                    }
                    Text {
                        text: "CCL Reduced Due to Alternate Current Limit: "
                            + batteryFaults.CclReducedDueToAlternateCurrentLimit
                    }
                }

                Column {
                    Text {
                        text: "MPPT 0"
                    }
                    Text {
                        text: "Channel Number: " + mppt0.ChannelNumber
                    }
                    Text {
                        text: "MPPT Status: " + mppt0.MpptStatus
                    }
                    Text {
                        text: "Array Voltage: " + mppt0.ArrayVoltage
                    }
                    Text {
                        text: "Array Current: " + mppt0.ArrayCurrent
                    }
                    Text {
                        text: "Battery Voltage: " + mppt0.BatteryVoltage
                    }
                    Text {
                        text: "Temperature: " + mppt0.Temperature
                    }
                }

                Column {
                    Text {
                        text: "MPPT 1"
                    }
                    Text {
                        text: "Channel Number: " + mppt1.ChannelNumber
                    }
                    Text {
                        text: "MPPT Status: " + mppt1.MpptStatus
                    }
                    Text {
                        text: "Array Voltage: " + mppt1.ArrayVoltage
                    }
                    Text {
                        text: "Array Current: " + mppt1.ArrayCurrent
                    }
                    Text {
                        text: "Battery Voltage: " + mppt1.BatteryVoltage
                    }
                    Text {
                        text: "Temperature: " + mppt1.Temperature
                    }
                }

                Column {
                    Text {
                        text: "MPPT 2"
                    }
                    Text {
                        text: "Channel Number: " + mppt2.ChannelNumber
                    }
                    Text {
                        text: "MPPT Status: " + mppt2.MpptStatus
                    }
                    Text {
                        text: "Array Voltage: " + mppt2.ArrayVoltage
                    }
                    Text {
                        text: "Array Current: " + mppt2.ArrayCurrent
                    }
                    Text {
                        text: "Battery Voltage: " + mppt2.BatteryVoltage
                    }
                    Text {
                        text: "Temperature: " + mppt2.Temperature
                    }
                }

                Column {
                    Text {
                        text: "MPPT 3"
                    }
                    Text {
                        text: "Channel Number: " + mppt3.ChannelNumber
                    }
                    Text {
                        text: "MPPT Status: " + mppt3.MpptStatus
                    }
                    Text {
                        text: "Array Voltage: " + mppt3.ArrayVoltage
                    }
                    Text {
                        text: "Array Current: " + mppt3.ArrayCurrent
                    }
                    Text {
                        text: "Battery Voltage: " + mppt3.BatteryVoltage
                    }
                    Text {
                        text: "Temperature: " + mppt3.Temperature
                    }
                }
            }

            Row {
                spacing: 20

                Column {
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
                        text: "Input 12V: " + battery.Input12V
                    }
                    Text {
                        text: "Fan Voltage: " + battery.FanVoltage
                    }
                    Text {
                        text: "Pack Current: " + battery.PackCurrent
                    }
                    Text {
                        text: "Pack Voltage: " + battery.PackVoltage
                    }
                    Text {
                        text: "Pack State Of Charge: " + battery.PackStateOfCharge
                    }
                    Text {
                        text: "Pack Amphours: " + battery.PackAmphours
                    }
                    Text {
                        text: "Pack Depth Of Discharge: " + battery.PackDepthOfDischarge
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
        }
    }
}
