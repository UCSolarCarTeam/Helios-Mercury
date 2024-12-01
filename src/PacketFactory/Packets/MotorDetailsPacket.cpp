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
    controlValue_ = 0;

    controlMode_ = false;
    motorMode_ = false;
    softwareEnable_ = false;
    debugMode_ = false;

    currentMotorTorque_ = 0;
    currentRpmValue_ = 0;
    motorTemperature_ = 0;
    inverterPeakCurrent_ = 0;
    currentMotorPower_ = 0;
    absuluteAngle_ = 0;

    motorAboutToStall_ = false;
    delayInReadingTempSensor_ = false;
    delayInReadingPosSensor_ = false;
    inverter1TempVeryHigh_ = false;
    inverter2TempVeryHigh_ = false;
    inverter3TempVeryHigh_ = false;
    inverter4TempVeryHigh_ = false;
    inverter5TempVeryHigh_ = false;
    inverter6TempVeryHigh_ = false;
    cpuTemperatureVeryHigh_ = false;
    hallTemperatureVeryHigh_ = false;
    dclinkTemperatureVeryHigh_ = false;
    delayInDclinkCommunication_ = false;
    inverter1OverCurrentWarning_ = false;
    inverter2OverCurrentWarning_ = false;
    inverter3OverCurrentWarning_ = false;
    inverter4OverCurrentWarning_ = false;
    inverter5OverCurrentWarning_ = false;
    inverter6OverCurrentWarning_ = false;
    dcOvervoltageWarning_ = false;
    dcUndervoltageWarning_ = false;
    canCommsTimeout_ = false;
    inverter1faultWarning_ = false;
    inverter2faultWarning_ = false;
    inverter3faultWarning_ = false;
    inverter4faultWarning_ = false;
    inverter5faultWarning_ = false;
    inverter6faultWarning_ = false;
    canSendWarning_ = false;
    lostFramesOnCanBusWarning_ = false;
    overspeedWarning_ = false;
    cpuOverload_ = false;
    torqueLimited_ = false;
    startAtHighRpm_ = false;

    initError_ = false;
    settingsNotFound_ = false;
    motorStalled_ = false;
    controllerDataReadingTimeout_ = false;
    invalidHallSensorSequence_ = false;
    invalidHallSector_ = false;
    errorReadingTempSensor_ = false;
    positionSensorReadingError_ = false;
    errorReadingEncoder_ = false;
    zeroPositionOffsetNotSet_ = false;
    hwEnableNotSet_ = false;
    inverter1TempTooHigh_ = false;
    inverter2TempTooHigh_ = false;
    inverter3TempTooHigh_ = false;
    inverter4TempTooHigh_ = false;
    inverter5TempTooHigh_ = false;
    inverter6TempTooHigh_ = false;
    cpuTemperatureTooHigh_ = false;
    hallTemperatureTooHigh_ = false;
    dclinkTemperatureTooHigh_ = false;
    errorInDclinkCommunication_ = false;
    inverter1OvercurrentError_ = false;
    inverter2OvercurrentError_ = false;
    inverter3OvercurrentError_ = false;
    inverter4OvercurrentError_ = false;
    inverter5OvercurrentError_ = false;
    inverter6OvercurrentError_ = false;
    dcOvervoltageError_ = false;
    dcUndervoltageError_ = false;
    doubleCanIdOnBus_ = false;
    canCommsTimeoutError_ = false;
    inverter1FaultError_ = false;
    inverter2FaultError_ = false;
    inverter3FaultError_ = false;
    inverter4FaultError_ = false;
    inverter5FaultError_ = false;
    inverter6FaultError_ = false;
    canSendError_ = false;
    lostFramesOnCanBusError_ = false;
    overspeedError_ = false;
    cpuOverloaded_ = false;
}

void MotorDetailsPacket::populatePacket(const QByteArray& data) {
    controlValue_ = getValue<short>(data, CONTROL_VALUE_OFFSET);

    unsigned char controlBits = getValue<unsigned char>(data, CONTROL_BITS_OFFSET);
    controlMode_ = controlBits & CONTROL_MODE_MASK;
    motorMode_ = controlBits & MOTOR_MODE_MASK;
    softwareEnable_ = controlBits & SOFTWARE_ENABLE_MASK;
    debugMode_ = controlBits & DEBUG_MODE_MASK;

    currentMotorTorque_ = getValue<short>(data, CURRENT_MOTOR_TORQUE_OFFSET);
    currentRpmValue_ = getValue<short>(data, CURRENT_RPM_VALUE_OFFSET);
    motorTemperature_ = getValue<char>(data, MOTOR_TEMPERATURE_OFFSET);
    inverterPeakCurrent_ = getValue<short>(data, INVERTER_PEAK_CURRENT_OFFSET);
    currentMotorPower_ = getValue<short>(data, CURRENT_MOTOR_POWER_OFFSET);
    absuluteAngle_ = getValue<unsigned short>(data, ABSOLUTE_ANGLE_OFFSET);

    unsigned short warningCode1 = getValue<unsigned short>(data, WARNING_CODE_1_OFFSET);
    motorAboutToStall_ = warningCode1 & MOTOR_ABOUT_TO_STALL_MASK;
    delayInReadingTempSensor_ = warningCode1 & DELAY_IN_READING_TEMP_SENSOR_MASK;
    delayInReadingPosSensor_ = warningCode1 & DELAY_IN_READING_POS_SENSOR_MASK;
    inverter1TempVeryHigh_ = warningCode1 & INVERTER_1_TEMP_VERY_HIGH_MASK;
    inverter2TempVeryHigh_ = warningCode1 & INVERTER_2_TEMP_VERY_HIGH_MASK;
    inverter3TempVeryHigh_ = warningCode1 & INVERTER_3_TEMP_VERY_HIGH_MASK;
    inverter4TempVeryHigh_ = warningCode1 & INVERTER_4_TEMP_VERY_HIGH_MASK;
    inverter5TempVeryHigh_ = warningCode1 & INVERTER_5_TEMP_VERY_HIGH_MASK;

    unsigned short warningCode2 = getValue<unsigned short>(data, WARNING_CODE_2_OFFSET);
    inverter6TempVeryHigh_ = warningCode2 & INVERTER_6_TEMP_VERY_HIGH_MASK;
    cpuTemperatureVeryHigh_ = warningCode2 & CPU_TEMPERATURE_VERY_HIGH_MASK;
    hallTemperatureVeryHigh_ = warningCode2 & HALL_TEMPERATURE_VERY_HIGH_MASK;
    dclinkTemperatureVeryHigh_ = warningCode2 & DCLINK_TEMPERATURE_VERY_HIGH_MASK;
    delayInDclinkCommunication_ = warningCode2 & DELAY_IN_DCLINK_COMMUNICATION_MASK;
    inverter1OverCurrentWarning_ = warningCode2 & INVERTER_1_OVERCURRENT_WARNING_MASK;
    inverter2OverCurrentWarning_ = warningCode2 & INVERTER_2_OVERCURRENT_WARNING_MASK;
    inverter3OverCurrentWarning_ = warningCode2 & INVERTER_3_OVERCURRENT_WARNING_MASK;

    unsigned short warningCode3 = getValue<unsigned short>(data, WARNING_CODE_3_OFFSET);
    inverter4OverCurrentWarning_ = warningCode3 & INVERTER_4_OVERCURRENT_WARNING_MASK;
    inverter5OverCurrentWarning_ = warningCode3 & INVERTER_5_OVERCURRENT_WARNING_MASK;
    inverter6OverCurrentWarning_ = warningCode3 & INVERTER_6_OVERCURRENT_WARNING_MASK;
    dcOvervoltageWarning_ = warningCode3 & DC_OVERVOLTAGE_WARNING_MASK;
    dcUndervoltageWarning_ = warningCode3 & DC_UNDERVOLTAGE_WARNING_MASK;
    canCommsTimeout_ = warningCode3 & CAN_COMMS_TIMEOUT_MASK;
    inverter1faultWarning_ = warningCode3 & INVERTER_1_FAULT_WARNING_MASK;
    inverter2faultWarning_ = warningCode3 & INVERTER_2_FAULT_WARNING_MASK;

    unsigned short warningCode4 = getValue<unsigned short>(data, WARNING_CODE_4_OFFSET);
    inverter3faultWarning_ = warningCode4 & INVERTER_3_FAULT_WARNING_MASK;
    inverter4faultWarning_ = warningCode4 & INVERTER_4_FAULT_WARNING_MASK;
    inverter5faultWarning_ = warningCode4 & INVERTER_5_FAULT_WARNING_MASK;
    inverter6faultWarning_ = warningCode4 & INVERTER_6_FAULT_WARNING_MASK;
    canSendWarning_ = warningCode4 & CAN_SEND_WARNING_MASK;
    lostFramesOnCanBusWarning_ = warningCode4 & LOST_FRAMES_ON_CAN_BUS_WARNING_MASK;
    overspeedWarning_ = warningCode4 & OVERSPEED_WARNING_MASK;
    cpuOverload_ = warningCode4 & CPU_OVERLOAD_MASK;

    unsigned char warningCode5 = getValue<unsigned char>(data, WARNING_CODE_5_OFFSET);
    torqueLimited_ = warningCode5 & TORQUE_LIMITED_MASK;
    startAtHighRpm_ = warningCode5 & START_AT_HIGH_RPM_MASK;

    unsigned short errorCode1 = getValue<unsigned short>(data, ERROR_CODE_1_OFFSET);
    initError_ = errorCode1 & INIT_ERROR_MASK;
    settingsNotFound_ = errorCode1 & SETTINGS_NOT_FOUND_MASK;
    motorStalled_ = errorCode1 & MOTOR_STALLED_MASK;
    controllerDataReadingTimeout_ = errorCode1 & CONTROLLER_DATA_READING_TIMEOUT_MASK;
    invalidHallSensorSequence_ = errorCode1 & INVALID_HALL_SENSOR_SEQUENCE_MASK;
    invalidHallSector_ = errorCode1 & INVALID_HALL_SECTOR_MASK;
    errorReadingTempSensor_ = errorCode1 & ERROR_READING_TEMP_SENSOR_MASK;
    positionSensorReadingError_ = errorCode1 & POSITION_SENSOR_READING_ERROR_MASK;

    unsigned short errorCode2 = getValue<unsigned short>(data, ERROR_CODE_2_OFFSET);
    errorReadingEncoder_ = errorCode2 & ERROR_READING_ENCODER_MASK;
    zeroPositionOffsetNotSet_ = errorCode2 & ZERO_POSITION_OFFSET_NOT_SET_MASK;
    hwEnableNotSet_ = errorCode2 & HW_ENABLE_NOT_SET_MASK;
    inverter1TempTooHigh_ = errorCode2 & INVERTER_1_TEMP_TOO_HIGH_MASK;
    inverter2TempTooHigh_ = errorCode2 & INVERTER_2_TEMP_TOO_HIGH_MASK;
    inverter3TempTooHigh_ = errorCode2 & INVERTER_3_TEMP_TOO_HIGH_MASK;
    inverter4TempTooHigh_ = errorCode2 & INVERTER_4_TEMP_TOO_HIGH_MASK;
    inverter5TempTooHigh_ = errorCode2 & INVERTER_5_TEMP_TOO_HIGH_MASK;

    unsigned short errorCode3 = getValue<unsigned short>(data, ERROR_CODE_3_OFFSET);
    inverter6TempTooHigh_ = errorCode3 & INVERTER_6_TEMP_TOO_HIGH_MASK;
    cpuTemperatureTooHigh_ = errorCode3 & CPU_TEMPERATURE_TOO_HIGH_MASK;
    hallTemperatureTooHigh_ = errorCode3 & HALL_TEMPERATURE_TOO_HIGH_MASK;
    dclinkTemperatureTooHigh_ = errorCode3 & DCLINK_TEMPERATURE_TOO_HIGH_MASK;
    errorInDclinkCommunication_ = errorCode3 & ERROR_IN_DCLINK_COMMUNICATION_MASK;
    inverter1OvercurrentError_ = errorCode3 & INVERTER_1_OVERCURRENT_ERROR_MASK;
    inverter2OvercurrentError_ = errorCode3 & INVERTER_2_OVERCURRENT_ERROR_MASK;
    inverter3OvercurrentError_ = errorCode3 & INVERTER_3_OVERCURRENT_ERROR_MASK;

    unsigned short errorCode4 = getValue<unsigned short>(data, ERROR_CODE_4_OFFSET);
    inverter4OvercurrentError_ = errorCode4 & INVERTER_4_OVERCURRENT_ERROR_MASK;
    inverter5OvercurrentError_ = errorCode4 & INVERTER_5_OVERCURRENT_ERROR_MASK;
    inverter6OvercurrentError_ = errorCode4 & INVERTER_6_OVERCURRENT_ERROR_MASK;
    dcOvervoltageError_ = errorCode4 & DC_OVERVOLTAGE_ERROR_MASK;
    dcUndervoltageError_ = errorCode4 & DC_UNDERVOLTAGE_ERROR_MASK;
    doubleCanIdOnBus_ = errorCode4 & DOUBLE_CAN_ID_ON_BUS_MASK;
    canCommsTimeoutError_ = errorCode4 & CAN_COMMS_TIMEOUT_ERROR_MASK;
    inverter1FaultError_ = errorCode4 & INVERTER_1_FAULT_ERROR_MASK;
    inverter2FaultError_ = errorCode4 & INVERTER_2_FAULT_ERROR_MASK;
    inverter3FaultError_ = errorCode4 & INVERTER_3_FAULT_ERROR_MASK;
    inverter4FaultError_ = errorCode4 & INVERTER_4_FAULT_ERROR_MASK;
    inverter5FaultError_ = errorCode4 & INVERTER_5_FAULT_ERROR_MASK;
    inverter6FaultError_ = errorCode4 & INVERTER_6_FAULT_ERROR_MASK;
    canSendError_ = errorCode4 & CAN_SEND_ERROR_MASK;
    lostFramesOnCanBusError_ = errorCode4 & LOST_FRAMES_ON_CAN_BUS_ERROR_MASK;
    overspeedError_ = errorCode4 & OVERSPEED_ERROR_MASK;

    unsigned char errorCode5 = getValue<unsigned char>(data, ERROR_CODE_5_OFFSET);
    cpuOverloaded_ = errorCode5 & CPU_OVERLOADED_MASK;
}

QJsonObject MotorDetailsPacket::toJson() {
    QJsonObject json;
    
    json[JsonDefinitions::CONTROL_VALUE] = controlValue_;

    json[JsonDefinitions::CONTROL_MODE] = controlMode_;
    json[JsonDefinitions::MOTOR_MODE] = motorMode_;
    json[JsonDefinitions::SOFTWARE_ENABLE] = softwareEnable_;
    json[JsonDefinitions::DEBUG_MODE] = debugMode_;

    json[JsonDefinitions::CURRENT_MOTOR_TORQUE] = currentMotorTorque_;
    json[JsonDefinitions::CURRENT_RPM_VALUE] = currentRpmValue_;
    json[JsonDefinitions::MOTOR_TEMPERATURE] = motorTemperature_;
    json[JsonDefinitions::INVERTER_PEAK_CURRENT] = inverterPeakCurrent_;
    json[JsonDefinitions::CURRENT_MOTOR_POWER] = currentMotorPower_;
    json[JsonDefinitions::ABSOLUTE_ANGLE] = absuluteAngle_;

    json[JsonDefinitions::MOTOR_ABOUT_TO_STALL] = motorAboutToStall_;
    json[JsonDefinitions::DELAY_IN_READING_TEMP_SENSOR] = delayInReadingTempSensor_;
    json[JsonDefinitions::DELAY_IN_READING_POS_SENSOR] = delayInReadingPosSensor_;
    json[JsonDefinitions::INVERTER1_TEMP_VERY_HIGH] = inverter1TempVeryHigh_;
    json[JsonDefinitions::INVERTER2_TEMP_VERY_HIGH] = inverter2TempVeryHigh_;
    json[JsonDefinitions::INVERTER3_TEMP_VERY_HIGH] = inverter3TempVeryHigh_;
    json[JsonDefinitions::INVERTER4_TEMP_VERY_HIGH] = inverter4TempVeryHigh_;
    json[JsonDefinitions::INVERTER5_TEMP_VERY_HIGH] = inverter5TempVeryHigh_;
    json[JsonDefinitions::INVERTER6_TEMP_VERY_HIGH] = inverter6TempVeryHigh_;
    json[JsonDefinitions::CPU_TEMPERATURE_VERY_HIGH] = cpuTemperatureVeryHigh_;
    json[JsonDefinitions::HALL_TEMPERATURE_VERY_HIGH] = hallTemperatureVeryHigh_;
    json[JsonDefinitions::DCLINK_TEMPERATURE_VERY_HIGH] = dclinkTemperatureVeryHigh_;
    json[JsonDefinitions::DELAY_IN_DCLINK_COMMUNICATION] = delayInDclinkCommunication_;
    json[JsonDefinitions::INVERTER1_OVER_CURRENT_WARNING] = inverter1OverCurrentWarning_;
    json[JsonDefinitions::INVERTER2_OVER_CURRENT_WARNING] = inverter2OverCurrentWarning_;
    json[JsonDefinitions::INVERTER3_OVER_CURRENT_WARNING] = inverter3OverCurrentWarning_;
    json[JsonDefinitions::INVERTER4_OVER_CURRENT_WARNING] = inverter4OverCurrentWarning_;
    json[JsonDefinitions::INVERTER5_OVER_CURRENT_WARNING] = inverter5OverCurrentWarning_;
    json[JsonDefinitions::INVERTER6_OVER_CURRENT_WARNING] = inverter6OverCurrentWarning_;
    json[JsonDefinitions::DC_OVERVOLTAGE_WARNING] = dcOvervoltageWarning_;
    json[JsonDefinitions::DC_UNDERVOLTAGE_WARNING] = dcUndervoltageWarning_;
    json[JsonDefinitions::CAN_COMMS_TIMEOUT_WARNING] = canCommsTimeout_;
    json[JsonDefinitions::INVERTER1_FAULT_WARNING] = inverter1faultWarning_;
    json[JsonDefinitions::INVERTER2_FAULT_WARNING] = inverter2faultWarning_;
    json[JsonDefinitions::INVERTER3_FAULT_WARNING] = inverter3faultWarning_;
    json[JsonDefinitions::INVERTER4_FAULT_WARNING] = inverter4faultWarning_;
    json[JsonDefinitions::INVERTER5_FAULT_WARNING] = inverter5faultWarning_;
    json[JsonDefinitions::INVERTER6_FAULT_WARNING] = inverter6faultWarning_;
    json[JsonDefinitions::CAN_SEND_WARNING] = canSendWarning_;
    json[JsonDefinitions::LOST_FRAMES_ON_CAN_BUS_WARNING] = lostFramesOnCanBusWarning_;
    json[JsonDefinitions::OVERSPEED_WARNING] = overspeedWarning_;
    json[JsonDefinitions::CPU_OVERLOAD] = cpuOverload_;
    json[JsonDefinitions::TORQUE_LIMITED] = torqueLimited_;
    json[JsonDefinitions::START_AT_HIGH_RPM] = startAtHighRpm_;

    json[JsonDefinitions::INIT_ERROR] = initError_;
    json[JsonDefinitions::SETTINGS_NOT_FOUND] = settingsNotFound_;
    json[JsonDefinitions::MOTOR_STALLED] = motorStalled_;
    json[JsonDefinitions::CONTROLLER_DATA_READING_TIMEOUT] = controllerDataReadingTimeout_;
    json[JsonDefinitions::INVALID_HALL_SENSOR_SEQUENCE] = invalidHallSensorSequence_;
    json[JsonDefinitions::INVALID_HALL_SECTOR] = invalidHallSector_;
    json[JsonDefinitions::ERROR_READING_TEMP_SENSOR] = errorReadingTempSensor_;
    json[JsonDefinitions::POSITION_SENSOR_READING_ERROR] = positionSensorReadingError_;
    json[JsonDefinitions::ERROR_READING_ENCODER] = errorReadingEncoder_;
    json[JsonDefinitions::ZERO_POSITION_OFFSET_NOT_SET] = zeroPositionOffsetNotSet_;
    json[JsonDefinitions::HW_ENABLE_NOT_SET] = hwEnableNotSet_;
    json[JsonDefinitions::INVERTER1_TEMP_TOO_HIGH] = inverter1TempTooHigh_;
    json[JsonDefinitions::INVERTER2_TEMP_TOO_HIGH] = inverter2TempTooHigh_;
    json[JsonDefinitions::INVERTER3_TEMP_TOO_HIGH] = inverter3TempTooHigh_;
    json[JsonDefinitions::INVERTER4_TEMP_TOO_HIGH] = inverter4TempTooHigh_;
    json[JsonDefinitions::INVERTER5_TEMP_TOO_HIGH] = inverter5TempTooHigh_;
    json[JsonDefinitions::INVERTER6_TEMP_TOO_HIGH] = inverter6TempTooHigh_;
    json[JsonDefinitions::CPU_TEMP_TOO_HIGH] = cpuTemperatureTooHigh_;
    json[JsonDefinitions::HALL_TEMP_TOO_HIGH] = hallTemperatureTooHigh_;
    json[JsonDefinitions::DCLINK_TEMP_TOO_HIGH] = dclinkTemperatureTooHigh_;
    json[JsonDefinitions::ERROR_IN_DCLINK_COMMUNICATION] = errorInDclinkCommunication_;
    json[JsonDefinitions::INVERTER1_OVERCURRENT_ERROR] = inverter1OvercurrentError_;
    json[JsonDefinitions::INVERTER2_OVERCURRENT_ERROR] = inverter2OvercurrentError_;
    json[JsonDefinitions::INVERTER3_OVERCURRENT_ERROR] = inverter3OvercurrentError_;
    json[JsonDefinitions::INVERTER4_OVERCURRENT_ERROR] = inverter4OvercurrentError_;
    json[JsonDefinitions::INVERTER5_OVERCURRENT_ERROR] = inverter5OvercurrentError_;
    json[JsonDefinitions::INVERTER6_OVERCURRENT_ERROR] = inverter6OvercurrentError_;
    json[JsonDefinitions::DC_OVERVOLTAGE_ERROR] = dcOvervoltageError_;
    json[JsonDefinitions::DC_UNDERVOLTAGE_ERROR] = dcUndervoltageError_;
    json[JsonDefinitions::DOUBLE_CAN_ID_ON_BUS] = doubleCanIdOnBus_;
    json[JsonDefinitions::CAN_COMMS_TIMEOUT_ERROR] = canCommsTimeoutError_;
    json[JsonDefinitions::INVERTER1_FAULT_ERROR] = inverter1FaultError_;
    json[JsonDefinitions::INVERTER2_FAULT_ERROR] = inverter2FaultError_;
    json[JsonDefinitions::INVERTER3_FAULT_ERROR] = inverter3FaultError_;
    json[JsonDefinitions::INVERTER4_FAULT_ERROR] = inverter4FaultError_;
    json[JsonDefinitions::INVERTER5_FAULT_ERROR] = inverter5FaultError_;
    json[JsonDefinitions::INVERTER6_FAULT_ERROR] = inverter6FaultError_;
    json[JsonDefinitions::CAN_SEND_ERROR] = canSendError_;
    json[JsonDefinitions::LOST_FRAMES_ON_CAN_BUS_ERROR] = lostFramesOnCanBusError_;
    json[JsonDefinitions::OVERSPEED_ERROR] = overspeedError_;
    json[JsonDefinitions::CPU_OVERLOADED] = cpuOverloaded_;

    return json;
}