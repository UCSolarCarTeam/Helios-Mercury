#ifndef JSONDEFINITIONS_H
#define JSONDEFINITIONS_H

namespace JsonDefinitions {

    /**
     * Common keys
     */
    constexpr const char* TITLE = "Title";
    constexpr const char* TIMESTAMP = "TimeStamp";

    /**
     * Key motor keys
     */
    constexpr const char* KEY_MOTOR = "KeyMotor";
    constexpr const char* MOTOR_SETPOINT = "MotorSetpoint";
    constexpr const char* CONTROL_MODE = "ControlMode";
    constexpr const char* MOTOR_MODE = "MotorMode";
    constexpr const char* SOFTWARE_ENABLE = "SoftwareEnable";
    constexpr const char* DEBUG_MODE= "DebugMode";

    /**
     * Motor details keys
     */
    constexpr const char* MOTOR_DETAILS = "MotorDetails";
    constexpr const char* CONTROL_VALUE = "ControlValue";
    constexpr const char* CURRENT_MOTOR_TORQUE = "CurrentMotorTorque";
    constexpr const char* CURRENT_RPM_VALUE = "CurrentRpmValue";
    constexpr const char* MOTOR_TEMPERATURE = "MotorTemperature";
    constexpr const char* INVERTER_PEAK_CURRENT = "InverterPeakCurrent";
    constexpr const char* CURRENT_MOTOR_POWER = "CurrentMotorPower";
    constexpr const char* ABSOLUTE_ANGLE = "AbsoluteAngle";
    constexpr const char* MOTOR_ABOUT_TO_STALL = "MotorAboutToStall";
    constexpr const char* DELAY_IN_READING_TEMP_SENSOR = "DelayInReadingTempSensor";
    constexpr const char* DELAY_IN_READING_POS_SENSOR = "DelayInReadingPosSensor";
    constexpr const char* INVERTER1_TEMP_VERY_HIGH = "Inverter1TempVeryHigh";
    constexpr const char* INVERTER2_TEMP_VERY_HIGH = "Inverter2TempVeryHigh";
    constexpr const char* INVERTER3_TEMP_VERY_HIGH = "Inverter3TempVeryHigh";
    constexpr const char* INVERTER4_TEMP_VERY_HIGH = "Inverter4TempVeryHigh";
    constexpr const char* INVERTER5_TEMP_VERY_HIGH = "Inverter5TempVeryHigh";
    constexpr const char* INVERTER6_TEMP_VERY_HIGH = "Inverter6TempVeryHigh";
    constexpr const char* CPU_TEMPERATURE_VERY_HIGH = "CpuTemperatureVeryHigh";
    constexpr const char* HALL_TEMPERATURE_VERY_HIGH = "HallTemperatureVeryHigh";
    constexpr const char* DCLINK_TEMPERATURE_VERY_HIGH = "DclinkTemperatureVeryHigh";
    constexpr const char* DELAY_IN_DCLINK_COMMUNICATION = "DelayInDclinkCommunication";
    constexpr const char* INVERTER1_OVER_CURRENT_WARNING = "Inverter1OverCurrentWarning";
    constexpr const char* INVERTER2_OVER_CURRENT_WARNING = "Inverter2OverCurrentWarning";
    constexpr const char* INVERTER3_OVER_CURRENT_WARNING = "Inverter3OverCurrentWarning";
    constexpr const char* INVERTER4_OVER_CURRENT_WARNING = "Inverter4OverCurrentWarning";
    constexpr const char* INVERTER5_OVER_CURRENT_WARNING = "Inverter5OverCurrentWarning";
    constexpr const char* INVERTER6_OVER_CURRENT_WARNING = "Inverter6OverCurrentWarning";
    constexpr const char* DC_OVERVOLTAGE_WARNING = "DcOvervoltageWarning";
    constexpr const char* DC_UNDERVOLTAGE_WARNING = "DcUndervoltageWarning";
    constexpr const char* CAN_COMMS_TIMEOUT_WARNING = "CanCommsTimeoutWarning";
    constexpr const char* INVERTER1_FAULT_WARNING = "Inverter1FaultWarning";
    constexpr const char* INVERTER2_FAULT_WARNING = "Inverter2FaultWarning";
    constexpr const char* INVERTER3_FAULT_WARNING = "Inverter3FaultWarning";
    constexpr const char* INVERTER4_FAULT_WARNING = "Inverter4FaultWarning";
    constexpr const char* INVERTER5_FAULT_WARNING = "Inverter5FaultWarning";
    constexpr const char* INVERTER6_FAULT_WARNING = "Inverter6FaultWarning";
    constexpr const char* CAN_SEND_WARNING = "CanSendWarning";
    constexpr const char* LOST_FRAMES_ON_CAN_BUS_WARNING = "LostFramesOnCanBusWarning";
    constexpr const char* OVERSPEED_WARNING = "OverspeedWarning";
    constexpr const char* CPU_OVERLOAD = "CpuOverload";
    constexpr const char* TORQUE_LIMITED = "TorqueLimited";
    constexpr const char* START_AT_HIGH_RPM = "StartAtHighRpm";
    constexpr const char* INIT_ERROR = "InitError";
    constexpr const char* SETTINGS_NOT_FOUND = "SettingsNotFound";
    constexpr const char* MOTOR_STALLED = "MotorStalled";
    constexpr const char* CONTROLLER_DATA_READING_TIMEOUT = "ControllerDataReadingTimeout";
    constexpr const char* INVALID_HALL_SENSOR_SEQUENCE = "InvalidHallSensorSequence";
    constexpr const char* INVALID_HALL_SECTOR = "InvalidHallSector";
    constexpr const char* ERROR_READING_TEMP_SENSOR = "ErrorReadingTempSensor";
    constexpr const char* POSITION_SENSOR_READING_ERROR = "PositionSensorReadingError";
    constexpr const char* ERROR_READING_ENCODER = "ErrorReadingEncoder";
    constexpr const char* ZERO_POSITION_OFFSET_NOT_SET = "ZeroPositionOffsetNotSet";
    constexpr const char* HW_ENABLE_NOT_SET = "HwEnableNotSet";
    constexpr const char* INVERTER1_TEMP_TOO_HIGH = "Inverter1TempTooHigh";
    constexpr const char* INVERTER2_TEMP_TOO_HIGH = "Inverter2TempTooHigh";
    constexpr const char* INVERTER3_TEMP_TOO_HIGH = "Inverter3TempTooHigh";
    constexpr const char* INVERTER4_TEMP_TOO_HIGH = "Inverter4TempTooHigh";
    constexpr const char* INVERTER5_TEMP_TOO_HIGH = "Inverter5TempTooHigh";
    constexpr const char* INVERTER6_TEMP_TOO_HIGH = "Inverter6TempTooHigh";
    constexpr const char* CPU_TEMP_TOO_HIGH = "CpuTempTooHigh";
    constexpr const char* CPU_TEMPERATURE_TOO_HIGH = "CpuTempTooHigh";
    constexpr const char* HALL_TEMP_TOO_HIGH = "HallTempTooHigh";
    constexpr const char* DCLINK_TEMP_TOO_HIGH = "DclinkTempTooHigh";
    constexpr const char* ERROR_IN_DCLINK_COMMUNICATION = "ErrorInDclinkCommunication";
    constexpr const char* INVERTER1_OVERCURRENT_ERROR = "Inverter1OvercurrentError";
    constexpr const char* INVERTER2_OVERCURRENT_ERROR = "Inverter2OvercurrentError";
    constexpr const char* INVERTER3_OVERCURRENT_ERROR = "Inverter3OvercurrentError";
    constexpr const char* INVERTER4_OVERCURRENT_ERROR = "Inverter4OvercurrentError";
    constexpr const char* INVERTER5_OVERCURRENT_ERROR = "Inverter5OvercurrentError";
    constexpr const char* INVERTER6_OVERCURRENT_ERROR = "Inverter6OvercurrentError";
    constexpr const char* DC_OVERVOLTAGE_ERROR = "DcOvervoltageError";
    constexpr const char* DC_UNDERVOLTAGE_ERROR = "DcUndervoltageError";
    constexpr const char* DOUBLE_CAN_ID_ON_BUS = "DoubleCanIdOnBus";
    constexpr const char* CAN_COMMS_TIMEOUT_ERROR = "CanCommsTimeoutError";
    constexpr const char* INVERTER1_FAULT_ERROR = "Inverter1FaultError";
    constexpr const char* INVERTER2_FAULT_ERROR = "Inverter2FaultError";
    constexpr const char* INVERTER3_FAULT_ERROR = "Inverter3FaultError";
    constexpr const char* INVERTER4_FAULT_ERROR = "Inverter4FaultError";
    constexpr const char* INVERTER5_FAULT_ERROR = "Inverter5FaultError";
    constexpr const char* INVERTER6_FAULT_ERROR = "Inverter6FaultError";
    constexpr const char* CAN_SEND_ERROR = "CanSendError";
    constexpr const char* LOST_FRAMES_ON_CAN_BUS_ERROR = "LostFramesOnCanBusError";
    constexpr const char* OVERSPEED_ERROR = "OverspeedError";
    constexpr const char* CPU_OVERLOADED = "CpuOverload";
    constexpr const char* MOTOR_ERRORS = "MotorErrors";
    constexpr const char* MOTOR_WARNINGS = "MotorWarnings";

    /**
     * B3 keys
     */
    constexpr const char* B3 = "B3";
    constexpr const char* RIGHT_SIGNAL_IN = "RightSignalIn";
    constexpr const char* LEFT_SIGNAL_IN = "LeftSignalIn";
    constexpr const char* HAZARD_LIGHTS_IN = "HazardLightsIn";
    constexpr const char* HEADLIGHTS_SWITCH_IN = "HeadightsSwitchIn";
    constexpr const char* FORWARD_SWITCH_IN = "ForwardSwitchIn";
    constexpr const char* HORN_SWITCH_IN = "HornSwitchIn";
    constexpr const char* FORWARD_IN = "ForwardIn";
    constexpr const char* NEUTRAL = "Neutral";
    constexpr const char* REVERSE = "Reverse";
    constexpr const char* BRAKE_SWITCH = "BrakeSwitch";
    constexpr const char* HANDBRAKE_SWITCH = "HandbrakeSwitch";
    constexpr const char* MOTOR_RESET = "MotorReset";
    constexpr const char* RACE_MODE = "RaceMode";
    constexpr const char* LAP = "Lap";
    constexpr const char* ZOOM_ZOOM = "ZoomZoom";
    constexpr const char* ACCELERATION = "Acceleration";
    constexpr const char* REGEN_BRAKING = "RegenBraking";
    constexpr const char* RIGHT_SIGNAL_OUT = "RightSignalOut";
    constexpr const char* LEFT_SIGNAL_OUT = "LeftSignalOut";
    constexpr const char* DAYTIME_RUNNING_LIGHT_SIGNAL_OUT = "DaytimeRunningLightSignalOut";
    constexpr const char* HEADLIGHT_SIGNAL_OUT = "HeadlightSignalOut";
    constexpr const char* BRAKE_LIGHT_SIGNAL_OUT = "BrakeLightSignalOut";
    constexpr const char* HORN_SIGNAL_OUT = "HornSignalOut";

    /**
     * Telemetry keys
     */
    constexpr const char* TELEMETRY = "Telemetry";
    constexpr const char* GPS_YEAR = "GpsYear";
    constexpr const char* GPS_MONTH = "GpsMonth";
    constexpr const char* GPS_DAY = "GpsDay";
    constexpr const char* GPS_HOUR = "GpsHour";
    constexpr const char* GPS_MINUTE = "GpsMinute";
    constexpr const char* GPS_SECOND = "GpsSecond";
    constexpr const char* GPS_VALIDITY_FLAGS = "GpsValidityFlags";
    constexpr const char* GPS_FIX_STATUS_FLAGS = "GpsFixStatusFlags";
    constexpr const char* GPS_ADDITIONAL_FLAGS = "GpsAdditionalFlags";
    constexpr const char* GPS_LONGITUDE = "GpsLongitude";
    constexpr const char* GPS_LATITUDE = "GpsLatitude";
    constexpr const char* MPU_ACCELERATION_X = "MpuAccelerationX";
    constexpr const char* MPU_ACCELERATION_Y = "MpuAccelerationY";
    constexpr const char* MPU_ACCELERATION_Z = "MpuAccelerationZ";
    constexpr const char* MPU_ROTATION_X = "MpuRotationX";
    constexpr const char* MPU_ROTATION_Y = "MpuRotationY";
    constexpr const char* MPU_ROTATION_Z = "MpuRotationZ";
    constexpr const char* MPU_TEMPERATURE = "MpuTemperature";

    /**
     * Battery Fault keys
     */
    constexpr const char* BATTERY_FAULTS = "BatteryFaults";
    constexpr const char* INTERNAL_COMMUNICATION_FAULT = "InternalCommunicationFault";
    constexpr const char* INTERNAL_CONVERSION_FAULT = "InternalConversionFault";
    constexpr const char* WEAK_CELL_FAULT = "WeakCellFault";
    constexpr const char* LOW_CELL_VOLTAGE_FAULT = "LowCellVoltageFault";
    constexpr const char* OPEN_WIRING_FAULT = "OpenWiringFault";
    constexpr const char* CURRENT_SENSOR_FAULT = "CurrentSensorFault";
    constexpr const char* PACK_VOLTAGE_SENSOR_FAULT = "PackVoltageSensorFault";
    constexpr const char* WEAK_PACK_FAULT = "WeakPackFault";
    constexpr const char* VOLTAGE_REDUNDANCY_FAULT = "VoltageRedundancyFault";
    constexpr const char* FAN_MONITOR_FAULT = "FanMonitorFault";
    constexpr const char* THERMISTOR_FAULT = "ThermistorFault";
    constexpr const char* CANBUS_COMMUNICATION_FAULT = "CanbusCommunicationFault";
    constexpr const char* ALWAYS_ON_SUPPLY_FAULT = "AlwaysOnSupplyFault";
    constexpr const char* HIGH_VOLTAGE_ISOLATION_FAULT = "HighVoltageIsolationFault";
    constexpr const char* POWER_SUPPLY_12V_FAULT = "PowerSupply12VFault";
    constexpr const char* CHARGE_LIMIT_ENFORCEMENT_FAULT = "ChargeLimitEnforcementFault";
    constexpr const char* DISCHARGE_LIMIT_ENFORCEMENT_FAULT = "DischargeLimitEnforcementFault";
    constexpr const char* CHARGER_SAFETY_RELAY_FAULT = "ChargerSafetyRelayFault";
    constexpr const char* INTERNAL_MEMORY_FAULT = "InternalMemoryFault";
    constexpr const char* INTERNAL_THERMISTOR_FAULT = "InternalThermistorFault";
    constexpr const char* INTERNAL_LOGIC_FAULT = "InternalLogicFault";
    constexpr const char* DCL_REDUCED_DUE_TO_LOW_SOC = "DclReducedDueToLowSoc";
    constexpr const char* DCL_REDUCED_DUE_TO_HIGH_CELL_RESISTANCE = "DclReducedDueToHighCellResistance";
    constexpr const char* DCL_REDUCED_DUE_TO_TEMPERATURE = "DclReducedDueToTemperature";
    constexpr const char* DCL_REDUCED_DUE_TO_LOW_CELL_VOLTAGE = "DclReducedDueToLowCellVoltage";
    constexpr const char* DCL_REDUCED_DUE_TO_LOW_PACK_VOLTAGE = "DclReducedDueToLowPackVoltage";
    constexpr const char* DCL_AND_CCL_REDUCED_DUE_TO_VOLTAGE_FAILSAFE = "DclAndCclReducedDueToVoltageFailsafe";
    constexpr const char* DCL_AND_CCL_REDUCED_DUE_TO_COMMUNICATION_FAILSAFE = "DclAndCclReducedDueToCommunicationFailsafe";
    constexpr const char* CCL_REDUCED_DUE_TO_HIGH_SOC = "CclReducedDueToHighSoc";
    constexpr const char* CCL_REDUCED_DUE_TO_HIGH_CELL_RESISTANCE = "CclReducedDueToHighCellResistance";
    constexpr const char* CCL_REDUCED_DUE_TO_TEMPERATURE = "CclReducedDueToTemperature";
    constexpr const char* CCL_REDUCED_DUE_TO_HIGH_CELL_VOLTAGE = "CclReducedDueToHighCellVoltage";
    constexpr const char* CCL_REDUCED_DUE_TO_HIGH_PACK_VOLTAGE = "CclReducedDueToHighPackVoltage";
    constexpr const char* CCL_REDUCED_DUE_TO_CHARGER_LATCH = "CclReducedDueToChargerLatch";
    constexpr const char* CCL_REDUCED_DUE_TO_ALTERNATE_CURRENT_LIMIT = "CclReducedDueToAlternateCurrentLimit";
    constexpr const char* WARNINGS = "Warnings";
    constexpr const char* ERRORS = "Errors";

    /**
     * Battery keys
     */
    constexpr const char* BATTERY = "Battery";
    constexpr const char* BMU_ALIVE = "BmuAlive";
    constexpr const char* DISCHARGE_RELAY_ENABLED = "DischargeRelayEnabled";
    constexpr const char* CHARGE_RELAY_ENABLED = "ChargeRelayEnabled";
    constexpr const char* CHARGER_SAFETY_ENABLED = "ChargerSafetyEnabled";
    constexpr const char* MALFUNCTION_INDICATOR_ACTIVE = "MalfunctionIndicatorActive";
    constexpr const char* MULTI_PURPOSE_INPUT_SIGNAL_STATUS = "MultiPurposeInputSignalStatus";
    constexpr const char* ALWAYS_ON_SIGNAL_STATUS = "AlwaysOnSignalStatus";
    constexpr const char* IS_READY_SIGNAL_STATUS = "IsReadySignalStatus";
    constexpr const char* IS_CHARGING_SIGNAL_STATUS = "IsChargingSignalStatus";
    constexpr const char* POPULATED_CELLS = "PopulatedCells";
    constexpr const char* INPUT_12V = "Input12V";
    constexpr const char* FAN_VOLTAGE = "FanVoltage";
    constexpr const char* PACK_CURRENT = "PackCurrent";
    constexpr const char* PACK_VOLTAGE = "PackVoltage";
    constexpr const char* PACK_STATE_OF_CHARGE = "PackStateOfCharge";
    constexpr const char* PACK_AMPHOURS = "PackAmphours";
    constexpr const char* PACK_DEPTH_OF_DISCHARGE = "PackDepthOfDischarge";
    constexpr const char* HIGH_TEMPERATURE = "HighTemperature";
    constexpr const char* HIGH_THERMISTOR_ID = "HighThermistorId";
    constexpr const char* LOW_TEMPERATURE = "LowTemperature";
    constexpr const char* LOW_THERMISTOR_ID = "LowThermistorId";
    constexpr const char* AVERAGE_TEMPERATURE = "AverageTemperature";
    constexpr const char* INTERNAL_TEMPERATURE = "InternalTemperature";
    constexpr const char* FAN_SPEED = "FanSpeed";
    constexpr const char* REQUESTED_FAN_SPEED = "RequestedFanSpeed";
    constexpr const char* LOW_CELL_VOLTAGE = "LowCellVoltage";
    constexpr const char* LOW_CELL_VOLTAGE_ID = "LowCellVoltageId";
    constexpr const char* HIGH_CELL_VOLTAGE = "HighCellVoltage";
    constexpr const char* HIGH_CELL_VOLTAGE_ID = "HighCellVoltageId";
    constexpr const char* AVERAGE_CELL_VOLTAGE = "AverageCellVoltage";
    constexpr const char* BATTERY_CELL = "BatteryCell";
    constexpr const char* BATTERY_FAN = "BatteryFan";
    constexpr const char* BATTERY_PACK = "BatteryPack";
    constexpr const char* BATTERY_TEMPERATURE = "BatteryTemperature";

    /**
     * Mppt keys
     */
    constexpr const char* MPPT = "MPPT";
    constexpr const char* CHANNEL_NUMBER = "ChannelNumber";
    constexpr const char* IS_ALIVE = "IsAlive";
    constexpr const char* BATTERY_VOLTAGE = "BatteryVoltage";
    constexpr const char* TEMPERATURE = "Temperature";

    /**
     * Mbms keys
     */
    constexpr const char* MBMS = "MBMS";
    constexpr const char* COMMON_CONTACTOR_STATE = "CommonContactorState";
    constexpr const char* MOTOR_CONTACTOR_STATE = "MotorContactorState";
    constexpr const char* ARRAY_CONTACTOR_STATE = "ArrayContactorState";
    constexpr const char* LV_CONTACTOR_STATE = "LvContactorState";
    constexpr const char* CHARGE_CONTACTOR_STATE = "ChargeContactorState";
    constexpr const char* COMMON_CONTACTOR_ERROR = "CommonContactorError";
    constexpr const char* MOTOR_CONTACTOR_ERROR = "MotorContactorError";
    constexpr const char* ARRAY_CONTACTOR_ERROR = "ArrayContactorError";
    constexpr const char* LV_CONTACTOR_ERROR = "LvContactorError";
    constexpr const char* CHARGE_CONTACTOR_ERROR = "ChargeContactorError";
    constexpr const char* STROBE_BMS_LIGHT = "StrobeBmsLight";
    constexpr const char* ALLOW_CHARGE = "AllowCharge";
    constexpr const char* HIGH_VOLTAGE_ENABLE_STATE = "HighVoltageEnableState";
    constexpr const char* ALLOW_DISCHARGE = "AllowDischarge";
    constexpr const char* ORION_CAN_RECEIVED_RECENTLY = "OrionCanReceivedRecently";
    constexpr const char* DISCHARGE_SHOULD_TRIP = "DischargeShouldTrip";
    constexpr const char* CHARGE_SHOULD_TRIP = "ChargeShouldTrip";
    constexpr const char* AUXILLARY_BATTERY_VOLTAGE = "AuxillaryBatteryVoltage";
    constexpr const char* MOTOR_VOLTAGE = "MotorVoltage";
    constexpr const char* ARRAY_VOLTAGE = "ArrayVoltage";
    constexpr const char* LV_VOLTAGE = "LvVoltage";
    constexpr const char* CHARGE_VOLTAGE = "ChargeVoltage";
    constexpr const char* COMMON_CURRENT = "CommonCurrent";
    constexpr const char* MOTOR_CURRENT = "MotorCurrent";
    constexpr const char* ARRAY_CURRENT = "ArrayCurrent";
    constexpr const char* LV_CURRENT = "LvCurrent";
    constexpr const char* CHARGE_CURRENT = "ChargeCurrent";
    constexpr const char* HIGH_CELL_VOLTAGE_TRIP = "HighCellVoltageTrip";
    constexpr const char* LOW_CELL_VOLTAGE_TRIP = "LowCellVoltageTrip";
    constexpr const char* HIGH_COMMON_CURRENT_TRIP = "HighCommonCurrentTrip";
    constexpr const char* MOTOR_HIGH_TEMPERATURE_CURRENT_TRIP = "MotorHighTemperatureCurrentTrip";
    constexpr const char* ARRAY_HIGH_TEMPERATURE_CURRENT_TRIP = "ArrayHighTemperatureCurrentTrip";
    constexpr const char* LV_HIGH_TEMPERATURE_CURRENT_TRIP = "LvHighTemperatureCurrentTrip";
    constexpr const char* CHARGE_HIGH_TEMPERATURE_CURRENT_TRIP = "ChargeHighTemperatureCurrentTrip";
    constexpr const char* PROTECTION_TRIP = "ProtectionTrip";
    constexpr const char* ORION_MESSAGE_TIMEOUT_TRIP = "OrionMessageTimeoutTrip";
    constexpr const char* CONTACTOR_DISCONNECTED_UNEXPECTEDLY_TRIP = "ContactorDisconnectedUnexpectedlyTrip";

    /**
     * Proximity Sensor keys
     */
    constexpr const char* PROXIMITY_SENSORS = "ProximitySensors";
    constexpr const char* PROXIMITY_SENSOR_1 = "ProximitySensor1";
    constexpr const char* PROXIMITY_SENSOR_2 = "ProximitySensor2";
    constexpr const char* PROXIMITY_SENSOR_3 = "ProximitySensor3";
    constexpr const char* PROXIMITY_SENSOR_4 = "ProximitySensor4";

    /**
     * Pi keys
     */
    constexpr const char* PI = "Pi";
    constexpr const char* RFID = "Rfid";
    constexpr const char* DRIVER_NAME = "DriverName";
    constexpr const char* PILATENCY = "Latency";
    constexpr const char* PITELEMETRYCONNECTED = "TelemetryConnected";    
}

#endif // JSONDEFINITIONS_H
