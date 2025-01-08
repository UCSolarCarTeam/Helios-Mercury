#include "MotorDetailsPacket.h"
#include "../../Config/JsonDefinitions.h"

namespace {
    const int CONTROL_VALUE_OFFSET = 1;

    const int CONTROL_BITS_OFFSET = 3;
    const char CONTROL_MODE_MASK = 0x01;
    const char MOTOR_MODE_MASK = 0x02;
    const char SOFTWARE_ENABLE_MASK = 0x04;
    const char DEBUG_MODE_MASK = 0x08;

    const int CURRENT_MOTOR_TORQUE_OFFSET = 4;
    const int CURRENT_RPM_VALUE_OFFSET = 6;
    const int MOTOR_TEMPERATURE_OFFSET = 8;
    const int INVERTER_PEAK_CURRENT_OFFSET = 9;
    const int CURRENT_MOTOR_POWER_OFFSET = 11;
    const int ABSOLUTE_ANGLE_OFFSET = 13;

    const int WARNING_CODE_1_OFFSET = 15;
    const short MOTOR_ABOUT_TO_STALL_MASK = 0x0001;
    const short DELAY_IN_READING_TEMP_SENSOR_MASK = 0x0002;
    const short DELAY_IN_READING_POS_SENSOR_MASK = 0x0004;
    const short INVERTER_1_TEMP_VERY_HIGH_MASK = 0x0008;
    const short INVERTER_2_TEMP_VERY_HIGH_MASK = 0x0010;
    const short INVERTER_3_TEMP_VERY_HIGH_MASK = 0x0020;
    const short INVERTER_4_TEMP_VERY_HIGH_MASK = 0x0040;
    const short INVERTER_5_TEMP_VERY_HIGH_MASK = 0x0080;

    const int WARNING_CODE_2_OFFSET = 17;
    const short INVERTER_6_TEMP_VERY_HIGH_MASK = 0x0001;
    const short CPU_TEMPERATURE_VERY_HIGH_MASK = 0x0002;
    const short HALL_TEMPERATURE_VERY_HIGH_MASK = 0x0004;
    const short DCLINK_TEMPERATURE_VERY_HIGH_MASK = 0x0008;
    const short DELAY_IN_DCLINK_COMMUNICATION_MASK = 0x0010;
    const short INVERTER_1_OVERCURRENT_WARNING_MASK = 0x0020;
    const short INVERTER_2_OVERCURRENT_WARNING_MASK = 0x0040;
    const short INVERTER_3_OVERCURRENT_WARNING_MASK = 0x0080;

    const int WARNING_CODE_3_OFFSET = 19;
    const short INVERTER_4_OVERCURRENT_WARNING_MASK = 0x0001;
    const short INVERTER_5_OVERCURRENT_WARNING_MASK = 0x0002;
    const short INVERTER_6_OVERCURRENT_WARNING_MASK = 0x0004;
    const short DC_OVERVOLTAGE_WARNING_MASK = 0x0008;
    const short DC_UNDERVOLTAGE_WARNING_MASK = 0x0010;
    const short CAN_COMMS_TIMEOUT_MASK = 0x0020;
    const short INVERTER_1_FAULT_WARNING_MASK = 0x0040;
    const short INVERTER_2_FAULT_WARNING_MASK = 0x0080;

    const int WARNING_CODE_4_OFFSET = 21;
    const short INVERTER_3_FAULT_WARNING_MASK = 0x0001;
    const short INVERTER_4_FAULT_WARNING_MASK = 0x0002;
    const short INVERTER_5_FAULT_WARNING_MASK = 0x0004;
    const short INVERTER_6_FAULT_WARNING_MASK = 0x0008;
    const short CAN_SEND_WARNING_MASK = 0x0010;
    const short LOST_FRAMES_ON_CAN_BUS_WARNING_MASK = 0x0020;
    const short OVERSPEED_WARNING_MASK = 0x0040;
    const short CPU_OVERLOAD_MASK = 0x0080;

    const int WARNING_CODE_5_OFFSET = 23;
    const char TORQUE_LIMITED_MASK = 0x01;
    const char START_AT_HIGH_RPM_MASK = 0x02;

    const int ERROR_CODE_1_OFFSET = 24;
    const short INIT_ERROR_MASK = 0x0001;
    const short SETTINGS_NOT_FOUND_MASK = 0x0002;
    const short MOTOR_STALLED_MASK = 0x0004;
    const short CONTROLLER_DATA_READING_TIMEOUT_MASK = 0x0008;
    const short INVALID_HALL_SENSOR_SEQUENCE_MASK = 0x0010;
    const short INVALID_HALL_SECTOR_MASK = 0x0020;
    const short ERROR_READING_TEMP_SENSOR_MASK = 0x0040;
    const short POSITION_SENSOR_READING_ERROR_MASK = 0x0080;

    const int ERROR_CODE_2_OFFSET = 26;
    const short ERROR_READING_ENCODER_MASK = 0x0001;
    const short ZERO_POSITION_OFFSET_NOT_SET_MASK = 0x0002;
    const short HW_ENABLE_NOT_SET_MASK = 0x0004;
    const short INVERTER_1_TEMP_TOO_HIGH_MASK = 0x0008;
    const short INVERTER_2_TEMP_TOO_HIGH_MASK = 0x0010;
    const short INVERTER_3_TEMP_TOO_HIGH_MASK = 0x0020;
    const short INVERTER_4_TEMP_TOO_HIGH_MASK = 0x0040;
    const short INVERTER_5_TEMP_TOO_HIGH_MASK = 0x0080;

    const int ERROR_CODE_3_OFFSET = 28;
    const short INVERTER_6_TEMP_TOO_HIGH_MASK = 0x0001;
    const short CPU_TEMPERATURE_TOO_HIGH_MASK = 0x0002;
    const short HALL_TEMPERATURE_TOO_HIGH_MASK = 0x0004;
    const short DCLINK_TEMPERATURE_TOO_HIGH_MASK = 0x0008;
    const short ERROR_IN_DCLINK_COMMUNICATION_MASK = 0x0010;
    const short INVERTER_1_OVERCURRENT_ERROR_MASK = 0x0020;
    const short INVERTER_2_OVERCURRENT_ERROR_MASK = 0x0040;
    const short INVERTER_3_OVERCURRENT_ERROR_MASK = 0x0080;

    const int ERROR_CODE_4_OFFSET = 30;
    const short INVERTER_4_OVERCURRENT_ERROR_MASK = 0x0001;
    const short INVERTER_5_OVERCURRENT_ERROR_MASK = 0x0002;
    const short INVERTER_6_OVERCURRENT_ERROR_MASK = 0x0004;
    const short DC_OVERVOLTAGE_ERROR_MASK = 0x0008;
    const short DC_UNDERVOLTAGE_ERROR_MASK = 0x0010;
    const short DOUBLE_CAN_ID_ON_BUS_MASK = 0x0020;
    const short CAN_COMMS_TIMEOUT_ERROR_MASK = 0x0040;
    const short INVERTER_1_FAULT_ERROR_MASK = 0x0080;
    const short INVERTER_2_FAULT_ERROR_MASK = 0x0100;
    const short INVERTER_3_FAULT_ERROR_MASK = 0x0200;
    const short INVERTER_4_FAULT_ERROR_MASK = 0x0400;
    const short INVERTER_5_FAULT_ERROR_MASK = 0x0800;
    const short INVERTER_6_FAULT_ERROR_MASK = 0x1000;
    const short CAN_SEND_ERROR_MASK = 0x2000;
    const short LOST_FRAMES_ON_CAN_BUS_ERROR_MASK = 0x4000;
    const short OVERSPEED_ERROR_MASK = 0x8000;

    const int ERROR_CODE_5_OFFSET = 32;
    const char CPU_OVERLOADED_MASK = 0x01;
}

MotorDetailsPacket::MotorDetailsPacket() {
    setControlValue(0);

    setControlMode(false);
    setMotorMode(false);
    setSoftwareEnable(false);
    setDebugMode(false);

    setCurrentMotorTorque(0);
    setCurrentRpmValue(0);
    setMotorTemperature(0);
    setInverterPeakCurrent(0);
    setCurrentMotorPower(0);
    setAbsuluteAngle(0);

    setMotorAboutToStall(false);
    setDelayInReadingTempSensor(false);
    setDelayInReadingPosSensor(false);
    setInverter1TempVeryHigh(false);
    setInverter2TempVeryHigh(false);
    setInverter3TempVeryHigh(false);
    setInverter4TempVeryHigh(false);
    setInverter5TempVeryHigh(false);
    setInverter6TempVeryHigh(false);
    setCpuTemperatureVeryHigh(false);
    setHallTemperatureVeryHigh(false);
    setDclinkTemperatureVeryHigh(false);
    setDelayInDclinkCommunication(false);
    setInverter1OverCurrentWarning(false);
    setInverter2OverCurrentWarning(false);
    setInverter3OverCurrentWarning(false);
    setInverter4OverCurrentWarning(false);
    setInverter5OverCurrentWarning(false);
    setInverter6OverCurrentWarning(false);
    setDcOvervoltageWarning(false);
    setDcUndervoltageWarning(false);
    setCanCommsTimeout(false);
    setInverter1FaultWarning(false);
    setInverter2FaultWarning(false);
    setInverter3FaultWarning(false);
    setInverter4FaultWarning(false);
    setInverter5FaultWarning(false);
    setInverter6FaultWarning(false);
    setCanSendWarning(false);
    setLostFramesOnCanBusWarning(false);
    setOverspeedWarning(false);
    setCpuOverload(false);
    setTorqueLimited(false);
    setStartAtHighRpm(false);

    setInitError(false);
    setSettingsNotFound(false);
    setMotorStalled(false);
    setControllerDataReadingTimeout(false);
    setInvalidHallSensorSequence(false);
    setInvalidHallSector(false);
    setErrorReadingTempSensor(false);
    setPositionSensorReadingError(false);
    setErrorReadingEncoder(false);
    setZeroPositionOffsetNotSet(false);
    setHwEnableNotSet(false);
    setInverter1TempTooHigh(false);
    setInverter2TempTooHigh(false);
    setInverter3TempTooHigh(false);
    setInverter4TempTooHigh(false);
    setInverter5TempTooHigh(false);
    setInverter6TempTooHigh(false);
    setCpuTemperatureTooHigh(false);
    setHallTemperatureTooHigh(false);
    setDclinkTemperatureTooHigh(false);
    setErrorInDclinkCommunication(false);
    setInverter1OvercurrentError(false);
    setInverter2OvercurrentError(false);
    setInverter3OvercurrentError(false);
    setInverter4OvercurrentError(false);
    setInverter5OvercurrentError(false);
    setInverter6OvercurrentError(false);
    setDcOvervoltageError(false);
    setDcUndervoltageError(false);
    setDoubleCanIdOnBus(false);
    setCanCommsTimeoutError(false);
    setInverter1FaultError(false);
    setInverter2FaultError(false);
    setInverter3FaultError(false);
    setInverter4FaultError(false);
    setInverter5FaultError(false);
    setInverter6FaultError(false);
    setCanSendError(false);
    setLostFramesOnCanBusError(false);
    setOverspeedError(false);
    setCpuOverloaded(false);
}

void MotorDetailsPacket::populatePacket(const QByteArray& data) {
    setControlValue(getValue<short>(data, CONTROL_VALUE_OFFSET));

    unsigned char controlBits = getValue<unsigned char>(data, CONTROL_BITS_OFFSET);
    setControlMode(controlBits & CONTROL_MODE_MASK);
    setMotorMode(controlBits & MOTOR_MODE_MASK);
    setSoftwareEnable(controlBits & SOFTWARE_ENABLE_MASK);
    setDebugMode(controlBits & DEBUG_MODE_MASK);

    setCurrentMotorTorque(getValue<short>(data, CURRENT_MOTOR_TORQUE_OFFSET));
    setCurrentRpmValue(getValue<short>(data, CURRENT_RPM_VALUE_OFFSET));
    setMotorTemperature(getValue<char>(data, MOTOR_TEMPERATURE_OFFSET));
    setInverterPeakCurrent(getValue<short>(data, INVERTER_PEAK_CURRENT_OFFSET));
    setCurrentMotorPower(getValue<short>(data, CURRENT_MOTOR_POWER_OFFSET));
    setAbsuluteAngle(getValue<unsigned short>(data, ABSOLUTE_ANGLE_OFFSET));

    unsigned short warningCode1 = getValue<unsigned short>(data, WARNING_CODE_1_OFFSET);
    setMotorAboutToStall(warningCode1 & MOTOR_ABOUT_TO_STALL_MASK);
    setDelayInReadingTempSensor(warningCode1 & DELAY_IN_READING_TEMP_SENSOR_MASK);
    setDelayInReadingPosSensor(warningCode1 & DELAY_IN_READING_POS_SENSOR_MASK);
    setInverter1TempVeryHigh(warningCode1 & INVERTER_1_TEMP_VERY_HIGH_MASK);
    setInverter2TempVeryHigh(warningCode1 & INVERTER_2_TEMP_VERY_HIGH_MASK);
    setInverter3TempVeryHigh(warningCode1 & INVERTER_3_TEMP_VERY_HIGH_MASK);
    setInverter4TempVeryHigh(warningCode1 & INVERTER_4_TEMP_VERY_HIGH_MASK);
    setInverter5TempVeryHigh(warningCode1 & INVERTER_5_TEMP_VERY_HIGH_MASK);

    unsigned short warningCode2 = getValue<unsigned short>(data, WARNING_CODE_2_OFFSET);
    setInverter6TempVeryHigh(warningCode2 & INVERTER_6_TEMP_VERY_HIGH_MASK);
    setCpuTemperatureVeryHigh(warningCode2 & CPU_TEMPERATURE_VERY_HIGH_MASK);
    setHallTemperatureVeryHigh(warningCode2 & HALL_TEMPERATURE_VERY_HIGH_MASK);
    setDclinkTemperatureVeryHigh(warningCode2 & DCLINK_TEMPERATURE_VERY_HIGH_MASK);
    setDelayInDclinkCommunication(warningCode2 & DELAY_IN_DCLINK_COMMUNICATION_MASK);
    setInverter1OverCurrentWarning(warningCode2 & INVERTER_1_OVERCURRENT_WARNING_MASK);
    setInverter2OverCurrentWarning(warningCode2 & INVERTER_2_OVERCURRENT_WARNING_MASK);
    setInverter3OverCurrentWarning(warningCode2 & INVERTER_3_OVERCURRENT_WARNING_MASK);

    unsigned short warningCode3 = getValue<unsigned short>(data, WARNING_CODE_3_OFFSET);
    setInverter4OverCurrentWarning(warningCode3 & INVERTER_4_OVERCURRENT_WARNING_MASK);
    setInverter5OverCurrentWarning(warningCode3 & INVERTER_5_OVERCURRENT_WARNING_MASK);
    setInverter6OverCurrentWarning(warningCode3 & INVERTER_6_OVERCURRENT_WARNING_MASK);
    setDcOvervoltageWarning(warningCode3 & DC_OVERVOLTAGE_WARNING_MASK);
    setDcUndervoltageWarning(warningCode3 & DC_UNDERVOLTAGE_WARNING_MASK);
    setCanCommsTimeout(warningCode3 & CAN_COMMS_TIMEOUT_MASK);
    setInverter1FaultWarning(warningCode3 & INVERTER_1_FAULT_WARNING_MASK);
    setInverter2FaultWarning(warningCode3 & INVERTER_2_FAULT_WARNING_MASK);

    unsigned short warningCode4 = getValue<unsigned short>(data, WARNING_CODE_4_OFFSET);
    setInverter3FaultWarning(warningCode4 & INVERTER_3_FAULT_WARNING_MASK);
    setInverter4FaultWarning(warningCode4 & INVERTER_4_FAULT_WARNING_MASK);
    setInverter5FaultWarning(warningCode4 & INVERTER_5_FAULT_WARNING_MASK);
    setInverter6FaultWarning(warningCode4 & INVERTER_6_FAULT_WARNING_MASK);
    setCanSendWarning(warningCode4 & CAN_SEND_WARNING_MASK);
    setLostFramesOnCanBusWarning(warningCode4 & LOST_FRAMES_ON_CAN_BUS_WARNING_MASK);
    setOverspeedWarning(warningCode4 & OVERSPEED_WARNING_MASK);
    setCpuOverload(warningCode4 & CPU_OVERLOAD_MASK);

    unsigned char warningCode5 = getValue<unsigned char>(data, WARNING_CODE_5_OFFSET);
    setTorqueLimited(warningCode5 & TORQUE_LIMITED_MASK);
    setStartAtHighRpm(warningCode5 & START_AT_HIGH_RPM_MASK);

    unsigned short errorCode1 = getValue<unsigned short>(data, ERROR_CODE_1_OFFSET);
    setInitError(errorCode1 & INIT_ERROR_MASK);
    setSettingsNotFound(errorCode1 & SETTINGS_NOT_FOUND_MASK);
    setMotorStalled(errorCode1 & MOTOR_STALLED_MASK);
    setControllerDataReadingTimeout(errorCode1 & CONTROLLER_DATA_READING_TIMEOUT_MASK);
    setInvalidHallSensorSequence(errorCode1 & INVALID_HALL_SENSOR_SEQUENCE_MASK);
    setInvalidHallSector(errorCode1 & INVALID_HALL_SECTOR_MASK);
    setErrorReadingTempSensor(errorCode1 & ERROR_READING_TEMP_SENSOR_MASK);
    setPositionSensorReadingError(errorCode1 & POSITION_SENSOR_READING_ERROR_MASK);

    unsigned short errorCode2 = getValue<unsigned short>(data, ERROR_CODE_2_OFFSET);
    setErrorReadingEncoder(errorCode2 & ERROR_READING_ENCODER_MASK);
    setZeroPositionOffsetNotSet(errorCode2 & ZERO_POSITION_OFFSET_NOT_SET_MASK);
    setHwEnableNotSet(errorCode2 & HW_ENABLE_NOT_SET_MASK);
    setInverter1TempTooHigh(errorCode2 & INVERTER_1_TEMP_TOO_HIGH_MASK);
    setInverter2TempTooHigh(errorCode2 & INVERTER_2_TEMP_TOO_HIGH_MASK);
    setInverter3TempTooHigh(errorCode2 & INVERTER_3_TEMP_TOO_HIGH_MASK);
    setInverter4TempTooHigh(errorCode2 & INVERTER_4_TEMP_TOO_HIGH_MASK);
    setInverter5TempTooHigh(errorCode2 & INVERTER_5_TEMP_TOO_HIGH_MASK);

    unsigned short errorCode3 = getValue<unsigned short>(data, ERROR_CODE_3_OFFSET);
    setInverter6TempTooHigh(errorCode3 & INVERTER_6_TEMP_TOO_HIGH_MASK);
    setCpuTemperatureTooHigh(errorCode3 & CPU_TEMPERATURE_TOO_HIGH_MASK);
    setHallTemperatureTooHigh(errorCode3 & HALL_TEMPERATURE_TOO_HIGH_MASK);
    setDclinkTemperatureTooHigh(errorCode3 & DCLINK_TEMPERATURE_TOO_HIGH_MASK);
    setErrorInDclinkCommunication(errorCode3 & ERROR_IN_DCLINK_COMMUNICATION_MASK);
    setInverter1OvercurrentError(errorCode3 & INVERTER_1_OVERCURRENT_ERROR_MASK);
    setInverter2OvercurrentError(errorCode3 & INVERTER_2_OVERCURRENT_ERROR_MASK);
    setInverter3OvercurrentError(errorCode3 & INVERTER_3_OVERCURRENT_ERROR_MASK);

    unsigned short errorCode4 = getValue<unsigned short>(data, ERROR_CODE_4_OFFSET);
    setInverter4OvercurrentError(errorCode4 & INVERTER_4_OVERCURRENT_ERROR_MASK);
    setInverter5OvercurrentError(errorCode4 & INVERTER_5_OVERCURRENT_ERROR_MASK);
    setInverter6OvercurrentError(errorCode4 & INVERTER_6_OVERCURRENT_ERROR_MASK);
    setDcOvervoltageError(errorCode4 & DC_OVERVOLTAGE_ERROR_MASK);
    setDcUndervoltageError(errorCode4 & DC_UNDERVOLTAGE_ERROR_MASK);
    setDoubleCanIdOnBus(errorCode4 & DOUBLE_CAN_ID_ON_BUS_MASK);
    setCanCommsTimeoutError(errorCode4 & CAN_COMMS_TIMEOUT_ERROR_MASK);
    setInverter1FaultError(errorCode4 & INVERTER_1_FAULT_ERROR_MASK);
    setInverter2FaultError(errorCode4 & INVERTER_2_FAULT_ERROR_MASK);
    setInverter3FaultError(errorCode4 & INVERTER_3_FAULT_ERROR_MASK);
    setInverter4FaultError(errorCode4 & INVERTER_4_FAULT_ERROR_MASK);
    setInverter5FaultError(errorCode4 & INVERTER_5_FAULT_ERROR_MASK);
    setInverter6FaultError(errorCode4 & INVERTER_6_FAULT_ERROR_MASK);
    setCanSendError(errorCode4 & CAN_SEND_ERROR_MASK);
    setLostFramesOnCanBusError(errorCode4 & LOST_FRAMES_ON_CAN_BUS_ERROR_MASK);
    setOverspeedError(errorCode4 & OVERSPEED_ERROR_MASK);

    unsigned char errorCode5 = getValue<unsigned char>(data, ERROR_CODE_5_OFFSET);
    setCpuOverloaded(errorCode5 & CPU_OVERLOADED_MASK);
}

QJsonObject MotorDetailsPacket::toJson() {
    QJsonObject json;
    
    json[JsonDefinitions::CONTROL_VALUE] = ControlValue_;

    json[JsonDefinitions::CONTROL_MODE] = ControlMode_;
    json[JsonDefinitions::MOTOR_MODE] = MotorMode_;
    json[JsonDefinitions::SOFTWARE_ENABLE] = SoftwareEnable_;
    json[JsonDefinitions::DEBUG_MODE] = DebugMode_;

    json[JsonDefinitions::CURRENT_MOTOR_TORQUE] = CurrentMotorTorque_;
    json[JsonDefinitions::CURRENT_RPM_VALUE] = CurrentRpmValue_;
    json[JsonDefinitions::MOTOR_TEMPERATURE] = MotorTemperature_;
    json[JsonDefinitions::INVERTER_PEAK_CURRENT] = InverterPeakCurrent_;
    json[JsonDefinitions::CURRENT_MOTOR_POWER] = CurrentMotorPower_;
    json[JsonDefinitions::ABSOLUTE_ANGLE] = AbsuluteAngle_;

    // Warning Flags
    QJsonObject warnings;

    warnings[JsonDefinitions::MOTOR_ABOUT_TO_STALL] = MotorAboutToStall_;
    warnings[JsonDefinitions::DELAY_IN_READING_TEMP_SENSOR] = DelayInReadingTempSensor_;
    warnings[JsonDefinitions::DELAY_IN_READING_POS_SENSOR] = DelayInReadingPosSensor_;
    warnings[JsonDefinitions::INVERTER1_TEMP_VERY_HIGH] = Inverter1TempVeryHigh_;
    warnings[JsonDefinitions::INVERTER2_TEMP_VERY_HIGH] = Inverter2TempVeryHigh_;
    warnings[JsonDefinitions::INVERTER3_TEMP_VERY_HIGH] = Inverter3TempVeryHigh_;
    warnings[JsonDefinitions::INVERTER4_TEMP_VERY_HIGH] = Inverter4TempVeryHigh_;
    warnings[JsonDefinitions::INVERTER5_TEMP_VERY_HIGH] = Inverter5TempVeryHigh_;
    warnings[JsonDefinitions::INVERTER6_TEMP_VERY_HIGH] = Inverter6TempVeryHigh_;
    warnings[JsonDefinitions::CPU_TEMPERATURE_VERY_HIGH] = CpuTemperatureVeryHigh_;
    warnings[JsonDefinitions::HALL_TEMPERATURE_VERY_HIGH] = HallTemperatureVeryHigh_;
    warnings[JsonDefinitions::DCLINK_TEMPERATURE_VERY_HIGH] = DclinkTemperatureVeryHigh_;
    warnings[JsonDefinitions::DELAY_IN_DCLINK_COMMUNICATION] = DelayInDclinkCommunication_;
    warnings[JsonDefinitions::INVERTER1_OVER_CURRENT_WARNING] = Inverter1OverCurrentWarning_;
    warnings[JsonDefinitions::INVERTER2_OVER_CURRENT_WARNING] = Inverter2OverCurrentWarning_;
    warnings[JsonDefinitions::INVERTER3_OVER_CURRENT_WARNING] = Inverter3OverCurrentWarning_;
    warnings[JsonDefinitions::INVERTER4_OVER_CURRENT_WARNING] = Inverter4OverCurrentWarning_;
    warnings[JsonDefinitions::INVERTER5_OVER_CURRENT_WARNING] = Inverter5OverCurrentWarning_;
    warnings[JsonDefinitions::INVERTER6_OVER_CURRENT_WARNING] = Inverter6OverCurrentWarning_;
    warnings[JsonDefinitions::DC_OVERVOLTAGE_WARNING] = DcOvervoltageWarning_;
    warnings[JsonDefinitions::DC_UNDERVOLTAGE_WARNING] = DcUndervoltageWarning_;
    warnings[JsonDefinitions::CAN_COMMS_TIMEOUT_WARNING] = CanCommsTimeout_;
    warnings[JsonDefinitions::INVERTER1_FAULT_WARNING] = Inverter1FaultWarning_;
    warnings[JsonDefinitions::INVERTER2_FAULT_WARNING] = Inverter2FaultWarning_;
    warnings[JsonDefinitions::INVERTER3_FAULT_WARNING] = Inverter3FaultWarning_;
    warnings[JsonDefinitions::INVERTER4_FAULT_WARNING] = Inverter4FaultWarning_;
    warnings[JsonDefinitions::INVERTER5_FAULT_WARNING] = Inverter5FaultWarning_;
    warnings[JsonDefinitions::INVERTER6_FAULT_WARNING] = Inverter6FaultWarning_;
    warnings[JsonDefinitions::CAN_SEND_WARNING] = CanSendWarning_;
    warnings[JsonDefinitions::LOST_FRAMES_ON_CAN_BUS_WARNING] = LostFramesOnCanBusWarning_;
    warnings[JsonDefinitions::OVERSPEED_WARNING] = OverspeedWarning_;
    warnings[JsonDefinitions::CPU_OVERLOAD] = CpuOverload_;
    warnings[JsonDefinitions::TORQUE_LIMITED] = TorqueLimited_;
    warnings[JsonDefinitions::START_AT_HIGH_RPM] = StartAtHighRpm_;

    json[JsonDefinitions::MOTOR_WARNINGS] = warnings;

    // Error Flags
    QJsonObject errors;

    errors[JsonDefinitions::INIT_ERROR] = InitError_;
    errors[JsonDefinitions::SETTINGS_NOT_FOUND] = SettingsNotFound_;
    errors[JsonDefinitions::MOTOR_STALLED] = MotorStalled_;
    errors[JsonDefinitions::CONTROLLER_DATA_READING_TIMEOUT] = ControllerDataReadingTimeout_;
    errors[JsonDefinitions::INVALID_HALL_SENSOR_SEQUENCE] = InvalidHallSensorSequence_;
    errors[JsonDefinitions::INVALID_HALL_SECTOR] = InvalidHallSector_;
    errors[JsonDefinitions::ERROR_READING_TEMP_SENSOR] = ErrorReadingTempSensor_;
    errors[JsonDefinitions::POSITION_SENSOR_READING_ERROR] = PositionSensorReadingError_;
    errors[JsonDefinitions::ERROR_READING_ENCODER] = ErrorReadingEncoder_;
    errors[JsonDefinitions::ZERO_POSITION_OFFSET_NOT_SET] = ZeroPositionOffsetNotSet_;
    errors[JsonDefinitions::HW_ENABLE_NOT_SET] = HwEnableNotSet_;
    errors[JsonDefinitions::INVERTER1_TEMP_TOO_HIGH] = Inverter1TempTooHigh_;
    errors[JsonDefinitions::INVERTER2_TEMP_TOO_HIGH] = Inverter2TempTooHigh_;
    errors[JsonDefinitions::INVERTER3_TEMP_TOO_HIGH] = Inverter3TempTooHigh_;
    errors[JsonDefinitions::INVERTER4_TEMP_TOO_HIGH] = Inverter4TempTooHigh_;
    errors[JsonDefinitions::INVERTER5_TEMP_TOO_HIGH] = Inverter5TempTooHigh_;
    errors[JsonDefinitions::INVERTER6_TEMP_TOO_HIGH] = Inverter6TempTooHigh_;
    errors[JsonDefinitions::CPU_TEMP_TOO_HIGH] = CpuTemperatureTooHigh_;
    errors[JsonDefinitions::HALL_TEMP_TOO_HIGH] = HallTemperatureTooHigh_;
    errors[JsonDefinitions::DCLINK_TEMP_TOO_HIGH] = DclinkTemperatureTooHigh_;
    errors[JsonDefinitions::ERROR_IN_DCLINK_COMMUNICATION] = ErrorInDclinkCommunication_;
    errors[JsonDefinitions::INVERTER1_OVERCURRENT_ERROR] = Inverter1OvercurrentError_;
    errors[JsonDefinitions::INVERTER2_OVERCURRENT_ERROR] = Inverter2OvercurrentError_;
    errors[JsonDefinitions::INVERTER3_OVERCURRENT_ERROR] = Inverter3OvercurrentError_;
    errors[JsonDefinitions::INVERTER4_OVERCURRENT_ERROR] = Inverter4OvercurrentError_;
    errors[JsonDefinitions::INVERTER5_OVERCURRENT_ERROR] = Inverter5OvercurrentError_;
    errors[JsonDefinitions::INVERTER6_OVERCURRENT_ERROR] = Inverter6OvercurrentError_;
    errors[JsonDefinitions::DC_OVERVOLTAGE_ERROR] = DcOvervoltageError_;
    errors[JsonDefinitions::DC_UNDERVOLTAGE_ERROR] = DcUndervoltageError_;
    errors[JsonDefinitions::DOUBLE_CAN_ID_ON_BUS] = DoubleCanIdOnBus_;
    errors[JsonDefinitions::CAN_COMMS_TIMEOUT_ERROR] = CanCommsTimeoutError_;
    errors[JsonDefinitions::INVERTER1_FAULT_ERROR] = Inverter1FaultError_;
    errors[JsonDefinitions::INVERTER2_FAULT_ERROR] = Inverter2FaultError_;
    errors[JsonDefinitions::INVERTER3_FAULT_ERROR] = Inverter3FaultError_;
    errors[JsonDefinitions::INVERTER4_FAULT_ERROR] = Inverter4FaultError_;
    errors[JsonDefinitions::INVERTER5_FAULT_ERROR] = Inverter5FaultError_;
    errors[JsonDefinitions::INVERTER6_FAULT_ERROR] = Inverter6FaultError_;
    errors[JsonDefinitions::CAN_SEND_ERROR] = CanSendError_;
    errors[JsonDefinitions::LOST_FRAMES_ON_CAN_BUS_ERROR] = LostFramesOnCanBusError_;
    errors[JsonDefinitions::OVERSPEED_ERROR] = OverspeedError_;
    errors[JsonDefinitions::CPU_OVERLOADED] = CpuOverloaded_;

    json[JsonDefinitions::MOTOR_ERRORS] = errors;

    return json;
}