

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
            x: 0
            y: 492
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
            x: 0
            y: 91
            width: 457
            height: 390
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
            x: 463
            y: 0
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
    }
}
