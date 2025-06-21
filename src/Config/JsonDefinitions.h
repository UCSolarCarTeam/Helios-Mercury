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
    constexpr const char* KEY_MOTOR_VELOCITY = "KeyMotorVelocity";
    constexpr const char* MOTOR_CURRENT = "MotorCurrent";
    constexpr const char* BUS_CURRENT_OUT = "BusCurrentOut";

    /**
     * Motor details keys
     */
    constexpr const char* MOTOR_DETAILS = "MotorDetails";
    constexpr const char* MOTOR_ID = "MotorId";
    constexpr const char* TRITIUM_ID = "TritiumId";
    constexpr const char* SERIAL_NUMBER = "SerialNumber";
    constexpr const char* LIMIT_FLAGS = "LimitFlags";
    constexpr const char* ERROR_FLAGS = "ErrorFlags";
    constexpr const char* ACTIVE_MOTOR = "ActiveMotor";
    constexpr const char* TX_ERROR_COUNT = "TxErrorCount";
    constexpr const char* RX_ERROR_COUNT = "RxErrorCount";
    constexpr const char* BUS_VOLTAGE = "BusVoltage";
    constexpr const char* BUS_CURRENT = "BusCurrent";
    constexpr const char* MOTOR_VELOCITY = "MotorVelocity";
    constexpr const char* VEHICLE_VELOCITY = "VehicleVelocity";
    constexpr const char* PHASE_CURRENT_B = "PhaseCurrentB";
    constexpr const char* PHASE_CURRENT_C = "PhaseCurrentC";
    constexpr const char* VQ = "Vq";
    constexpr const char* VD = "Vd";
    constexpr const char* IQ = "Iq";
    constexpr const char* ID = "Id";
    constexpr const char* BEMF_Q = "BEMF_Q";
    constexpr const char* BEMF_D = "BEMF_D";
    constexpr const char* SUPPLY_15V = "Supply15V";
    constexpr const char* SUPPLY_1V9 = "Supply1V9";
    constexpr const char* SUPPLY_3V3 = "Supply3V3";
    constexpr const char* MOTOR_TEMPERATURE = "MotorTemperature";
    constexpr const char* HEATSINK_TEMPERATURE = "HeatsinkTemperature";
    constexpr const char* DSP_BOARD_TEMPERATURE = "DspBoardTemperature";
    constexpr const char* ODOMETER = "Odometer";
    constexpr const char* DC_BUS_AH = "DC_Bus_Ah";
    constexpr const char* SLIP_SPEED = "SlipSpeed";

    /**
     * B3 keys
     */
    constexpr const char* B3 = "B3";
    constexpr const char* B3_HEARTBEAT = "B3Heartbeat";    
    constexpr const char* RIGHT_SIGNAL_INPUT = "RightSignalInput";
    constexpr const char* LEFT_SIGNAL_INPUT = "LeftSignalInput";
    constexpr const char* HAZARD_LIGHTS_INPUT = "HazardLightsInput";
    constexpr const char* HEADLIGHTS_SWITCH_INPUT = "HeadightsSwitchInput";
    constexpr const char* FORWARD_SWITCH_DIGITAL = "ForwardSwitchDigital";
    constexpr const char* HORN_SWITCH_DIGITAL = "HornSwitchDigital";
    constexpr const char* FORWARD_DIGITAL = "ForwardDigital";
    constexpr const char* NEUTRAL_DIGITAL = "NeutralDigital";
    constexpr const char* REVERSE_DIGITAL = "ReverseDigital";
    constexpr const char* BRAKE_SWITCH_DIGITAL = "BrakeSwitchDigital";
    constexpr const char* HANDBRAKE_SWITCH_DIGITAL = "HandbrakeSwitchDigital";
    constexpr const char* MOTOR_RESET_DIGITAL = "MotorResetDigital";    
    constexpr const char* RACE_MODE_DIGITAL = "RaceModeDigital";
    constexpr const char* LAP_DIGITAL = "LapDigital";
    constexpr const char* ACCELERATION = "Acceleration";
    constexpr const char* REGEN_BRAKING = "RegenBraking";
    constexpr const char* RIGHT_SIGNAL_STATUS = "RightSignalStatus";
    constexpr const char* LEFT_SIGNAL_STATUS = "LeftSignalStatus";
    constexpr const char* DAYTIME_RUNNING_LIGHT_SIGNAL_STATUS = "DaytimeRunningLightSignalStatus";
    constexpr const char* HEADLIGHT_SIGNAL_STATUS = "HeadlightSignalStatus";
    constexpr const char* BRAKE_LIGHT_SIGNAL_STATUS = "BrakeLightSignalStatus";
    constexpr const char* HORN_SIGNAL_STATUS = "HornSignalStatus";

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
    constexpr const char* MAXIMUM_CELL_VOLTAGE = "MaximumCellVoltage";
    constexpr const char* MINIMUM_CELL_VOLTAGE = "MinimumCellVoltage";
    constexpr const char* MAXIMUM_PACK_VOLTAGE = "MaximumPackVoltage";
    constexpr const char* MINIMUM_PACK_VOLTAGE = "MinimumPackVoltage";

    /**
     * Mppt keys
     */
    constexpr const char* MPPT = "MPPT";
    constexpr const char* MPPT0_CH0_ARRAY_VOLTAGE = "Mppt0Ch0ArrayVoltage";
    constexpr const char* MPPT0_CH0_ARRAY_CURRENT = "Mppt0Ch0ArrayCurrent";
    constexpr const char* MPPT0_CH0_BATTERY_VOLTAGE = "Mppt0Ch0BatteryVoltage";
    constexpr const char* MPPT0_CH0_UNIT_TEMPERATURE = "Mppt0Ch0UnitTemperature";
    constexpr const char* MPPT0_CH1_ARRAY_VOLTAGE = "Mppt0Ch1ArrayVoltage";
    constexpr const char* MPPT0_CH1_ARRAY_CURRENT = "Mppt0Ch1ArrayCurrent";
    constexpr const char* MPPT0_CH1_BATTERY_VOLTAGE = "Mppt0Ch1BatteryVoltage";
    constexpr const char* MPPT0_CH1_UNIT_TEMPERATURE = "Mppt0Ch1UnitTemperature";
    constexpr const char* MPPT1_CH0_ARRAY_VOLTAGE = "Mppt1Ch0ArrayVoltage";
    constexpr const char* MPPT1_CH0_ARRAY_CURRENT = "Mppt1Ch0ArrayCurrent";
    constexpr const char* MPPT1_CH0_BATTERY_VOLTAGE = "Mppt1Ch0BatteryVoltage";
    constexpr const char* MPPT1_CH0_UNIT_TEMPERATURE = "Mppt1Ch0UnitTemperature";
    constexpr const char* MPPT1_CH1_ARRAY_VOLTAGE = "Mppt1Ch1ArrayVoltage";
    constexpr const char* MPPT1_CH1_ARRAY_CURRENT = "Mppt1Ch1ArrayCurrent";
    constexpr const char* MPPT1_CH1_BATTERY_VOLTAGE = "Mppt1Ch1BatteryVoltage";
    constexpr const char* MPPT1_CH1_UNIT_TEMPERATURE = "Mppt1Ch1UnitTemperature";
    constexpr const char* MPPT2_CH0_ARRAY_VOLTAGE = "Mppt2Ch0ArrayVoltage";
    constexpr const char* MPPT2_CH0_ARRAY_CURRENT = "Mppt2Ch0ArrayCurrent";
    constexpr const char* MPPT2_CH0_BATTERY_VOLTAGE = "Mppt2Ch0BatteryVoltage";
    constexpr const char* MPPT2_CH0_UNIT_TEMPERATURE = "Mppt2Ch0UnitTemperature";
    constexpr const char* MPPT2_CH1_ARRAY_VOLTAGE = "Mppt2Ch1ArrayVoltage";
    constexpr const char* MPPT2_CH1_ARRAY_CURRENT = "Mppt2Ch1ArrayCurrent";
    constexpr const char* MPPT2_CH1_BATTERY_VOLTAGE = "Mppt2Ch1BatteryVoltage";
    constexpr const char* MPPT2_CH1_UNIT_TEMPERATURE = "Mppt2Ch1UnitTemperature";
    constexpr const char* MPPT3_CH0_ARRAY_VOLTAGE = "Mppt3Ch0ArrayVoltage";
    constexpr const char* MPPT3_CH0_ARRAY_CURRENT = "Mppt3Ch0ArrayCurrent";
    constexpr const char* MPPT3_CH0_BATTERY_VOLTAGE = "Mppt3Ch0BatteryVoltage";
    constexpr const char* MPPT3_CH0_UNIT_TEMPERATURE = "Mppt3Ch0UnitTemperature";
    constexpr const char* MPPT3_CH1_ARRAY_VOLTAGE = "Mppt3Ch1ArrayVoltage";
    constexpr const char* MPPT3_CH1_ARRAY_CURRENT = "Mppt3Ch1ArrayCurrent";
    constexpr const char* MPPT3_CH1_BATTERY_VOLTAGE = "Mppt3Ch1BatteryVoltage";
    constexpr const char* MPPT3_CH1_UNIT_TEMPERATURE = "Mppt3Ch1UnitTemperature";

    /**
     * Mbms keys
     */
    constexpr const char* MBMS = "MBMS";
    constexpr const char* HEARTBEAT = "Heartbeat";
    constexpr const char* COMMON_CONTACTOR_COMMAND = "CommonContactorCommand";
    constexpr const char* MOTOR_CONTACTOR_COMMAND = "MotorContactorCommand";
    constexpr const char* ARRAY_CONTACTOR_COMMAND = "ArrayContactorCommand";
    constexpr const char* LV_CONTACTOR_COMMAND = "LvContactorCommand";
    constexpr const char* CHARGE_CONTACTOR_COMMAND = "ChargeContactorCommand";
    constexpr const char* AUXILIARY_BATTERY_VOLTAGE = "AuxiliaryBatteryVoltage";
    constexpr const char* STROBE_BMS_LIGHT = "StrobeBmsLight";
    constexpr const char* CHARGE_ENABLE = "ChargeEnable";
    constexpr const char* CHARGE_SAFETY = "ChargeSafety";
    constexpr const char* DISCHARGE_ENABLE = "DischargeEnable";
    constexpr const char* ORION_CAN_RECEIVED_RECENTLY = "OrionCanReceivedRecently";
    constexpr const char* DISCHARGE_SHOULD_TRIP = "DischargeShouldTrip";
    constexpr const char* CHARGE_SHOULD_TRIP = "ChargeShouldTrip";
    constexpr const char* STARTUP_STATE = "StartupState";
    constexpr const char* SYSTEM_STATE = "SystemState";
    constexpr const char* MAIN_POWER_SWITCH = "MainPowerSwitch";
    constexpr const char* EXTERNAL_SHUTDOWN = "ExternalShutdown";
    constexpr const char* EN1 = "En1";
    constexpr const char* DCDC_FAULT = "DcdcFault";
    constexpr const char* THREE_A_OC = "ThreeAOc";
    constexpr const char* DCDC_ON = "DcdcOn";
    constexpr const char* CHG_FAULT = "ChgFault";
    constexpr const char* CHG_ON = "ChgOn";
    constexpr const char* CHG_LV_EN = "ChgLvEn";
    constexpr const char* ABATT_DISABLE = "AbattDisable";
    constexpr const char* KEY = "Key";
    constexpr const char* HIGH_CELL_VOLTAGE_TRIP = "HighCellVoltageTrip";
    constexpr const char* LOW_CELL_VOLTAGE_TRIP = "LowCellVoltageTrip";
    constexpr const char* COMMON_HIGH_CURRENT_TRIP = "CommonHighCurrentTrip";
    constexpr const char* MOTOR_HIGH_CURRENT_TRIP = "MotorHighCurrentTrip";
    constexpr const char* ARRAY_HIGH_CURRENT_TRIP = "ArrayHighCurrentTrip";
    constexpr const char* LV_HIGH_CURRENT_TRIP = "LvHighCurrentTrip";
    constexpr const char* CHARGE_HIGH_CURRENT_TRIP = "ChargeHighCurrentTrip";
    constexpr const char* PROTECTION_TRIP = "ProtectionTrip";
    constexpr const char* ORION_MESSAGE_TIMEOUT_TRIP = "OrionMessageTimeoutTrip";
    constexpr const char* CONTACTOR_DISCONNECTED_UNEXPECTEDLY_TRIP = "ContactorDisconnectedUnexpectedlyTrip";
    constexpr const char* CONTACTOR_CONNECTED_UNEXPECTEDLY_TRIP = "ContactorConnectedUnexpectedlyTrip";
    constexpr const char* COMMON_HEARTBEAT_DEAD_TRIP = "CommonHeartbeatDeadTrip";
    constexpr const char* MOTOR_HEARTBEAT_DEAD_TRIP = "MotorHeartbeatDeadTrip";
    constexpr const char* ARRAY_HEARTBEAT_DEAD_TRIP = "ArrayHeartbeatDeadTrip";
    constexpr const char* LV_HEARTBEAT_DEAD_TRIP = "LvHeartbeatDeadTrip";
    constexpr const char* CHARGE_HEARTBEAT_DEAD_TRIP = "ChargeHeartbeatDeadTrip";
    constexpr const char* MPS_DISABLED_TRIP = "MpsDisabledTrip";
    constexpr const char* ESD_ENABLED_TRIP = "EsdEnabledTrip";
    constexpr const char* HIGH_TEMPERATURE_TRIP = "HighTemperatureTrip";
    constexpr const char* LOW_TEMPERATURE_TRIP = "LowTemperatureTrip";
    constexpr const char* HIGH_CELL_VOLTAGE_WARNING = "HighCellVoltageWarning";
    constexpr const char* LOW_CELL_VOLTAGE_WARNING = "LowCellVoltageWarning";
    constexpr const char* COMMON_HIGH_CURRENT_WARNING = "CommonHighCurrentWarning";
    constexpr const char* MOTOR_HIGH_CURRENT_WARNING = "MotorHighCurrentWarning";
    constexpr const char* ARRAY_HIGH_CURRENT_WARNING = "ArrayHighCurrentWarning";
    constexpr const char* LV_HIGH_CURRENT_WARNING = "LvHighCurrentWarning";
    constexpr const char* CHARGE_HIGH_CURRENT_WARNING = "ChargeHighCurrentWarning";
    constexpr const char* HIGH_TEMPERATURE_WARNING = "HighTemperatureWarning";
    constexpr const char* LOW_TEMPERATURE_WARNING = "LowTemperatureWarning";
    constexpr const char* CAN_OC_12V_WARNING = "CanOc12VWarning";

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

    /**
     * Contactor Keys
     */
    constexpr const char* CONTACTOR = "Contactor";
    constexpr const char* COMMON_HEARTBEAT = "CommonHeartbeat";
    constexpr const char* MOTOR_HEARTBEAT = "MotorHeartbeat";
    constexpr const char* ARRAY_HEARTBEAT = "ArrayHeartbeat";
    constexpr const char* LV_HEARTBEAT = "LvHeartbeat";
    constexpr const char* CHARGE_HEARTBEAT = "ChargeHeartbeat";

    constexpr const char* COMMON_PRECHARGER_CLOSED = "CommonPrechargerClosed";
    constexpr const char* COMMON_PRECHARGER_CLOSING = "CommonPrechargerClosing";
    constexpr const char* COMMON_PRECHARGER_ERROR = "CommonPrechargerError";
    constexpr const char* COMMON_CONTACTOR_CLOSED = "CommonContactorClosed";
    constexpr const char* COMMON_CONTACTOR_CLOSING = "CommonContactorClosing";
    constexpr const char* COMMON_CONTACTOR_ERROR = "CommonContactorError";
    constexpr const char* COMMON_LINE_CURRENT = "CommonLineCurrent";
    constexpr const char* COMMON_CHARGE_CURRENT = "CommonChargeCurrent";
    constexpr const char* COMMON_CONTACTOR_OPENING_ERROR = "CommonContactorOpeningError";

    constexpr const char* MOTOR_PRECHARGER_CLOSED = "MotorPrechargerClosed";
    constexpr const char* MOTOR_PRECHARGER_CLOSING = "MotorPrechargerClosing";
    constexpr const char* MOTOR_PRECHARGER_ERROR = "MotorPrechargerError";
    constexpr const char* MOTOR_CONTACTOR_CLOSED = "MotorContactorClosed";
    constexpr const char* MOTOR_CONTACTOR_CLOSING = "MotorContactorClosing";
    constexpr const char* MOTOR_CONTACTOR_ERROR = "MotorContactorError";
    constexpr const char* MOTOR_LINE_CURRENT = "MotorLineCurrent";
    constexpr const char* MOTOR_CHARGE_CURRENT = "MotorChargeCurrent";
    constexpr const char* MOTOR_BPS_ERROR = "MotorBPSError";

    constexpr const char* ARRAY_PRECHARGER_CLOSED = "ArrayPrechargerClosed";
    constexpr const char* ARRAY_PRECHARGER_CLOSING = "ArrayPrechargerClosing";
    constexpr const char* ARRAY_PRECHARGER_ERROR = "ArrayPrechargerError";
    constexpr const char* ARRAY_CONTACTOR_CLOSED = "ArrayContactorClosed";
    constexpr const char* ARRAY_CONTACTOR_CLOSING = "ArrayContactorClosing";
    constexpr const char* ARRAY_CONTACTOR_ERROR = "ArrayContactorError";
    constexpr const char* ARRAY_LINE_CURRENT = "ArrayLineCurrent";
    constexpr const char* ARRAY_CHARGE_CURRENT = "ArrayChargeCurrent";
    constexpr const char* ARRAY_BPS_ERROR = "ArrayBPSError";

    constexpr const char* LV_PRECHARGER_CLOSED = "LvPrechargerClosed";
    constexpr const char* LV_PRECHARGER_CLOSING = "LvPrechargerClosing";
    constexpr const char* LV_PRECHARGER_ERROR = "LvPrechargerError";
    constexpr const char* LV_CONTACTOR_CLOSED = "LvContactorClosed";
    constexpr const char* LV_CONTACTOR_CLOSING = "LvContactorClosing";
    constexpr const char* LV_CONTACTOR_ERROR = "LvContactorError";
    constexpr const char* LV_LINE_CURRENT = "LvLineCurrent";
    constexpr const char* LV_CHARGE_CURRENT = "LvChargeCurrent";
    constexpr const char* LV_BPS_ERROR = "LvBpsError";

    constexpr const char* CHARGE_PRECHARGER_CLOSED = "ChargePrechargerClosed";
    constexpr const char* CHARGE_PRECHARGER_CLOSING = "ChargePrechargerClosing";
    constexpr const char* CHARGE_PRECHARGER_ERROR = "ChargePrechargerError";
    constexpr const char* CHARGE_CONTACTOR_CLOSED = "ChargeContactorClosed";
    constexpr const char* CHARGE_CONTACTOR_CLOSING = "ChargeContactorClosing";
    constexpr const char* CHARGE_CONTACTOR_ERROR = "ChargeContactorError";
    constexpr const char* CHARGE_LINE_CURRENT = "ChargeLineCurrent";
    constexpr const char* CHARGE_CHARGE_CURRENT = "ChargeChargeCurrent";
    constexpr const char* CHARGE_BPS_ERROR = "ChargeBPSError";

    
}

#endif // JSONDEFINITIONS_H
