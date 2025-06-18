#include "MotorDetailsPacket.h"
#include "../../Config/JsonDefinitions.h"

MotorDetailsPacket::MotorDetailsPacket() {
    // Initialize all properties to 0/false
    setTritiumId(0);
    setSerialNumber(0);
    
    setLimitFlags(0);
    setErrorFlags(0);
    setActiveMotor(0);
    setTxErrorCount(0);
    setRxErrorCount(0);
    
    setBusVoltage(0);
    setBusCurrent(0);
    
    setMotorVelocity(0);
    setVehicleVelocity(0);
    
    setPhaseCurrentB(0);
    setPhaseCurrentC(0);
    
    setVq(0);
    setVd(0);
    
    setIq(0);
    setId(0);
    
    setBEMFq(0);
    setBEMFd(0);
    
    setSupply15V(0);
    setReservedSupply15V(0);
    
    setSupply1V9(0);
    setSupply3V3(0);
    
    setReserved0A0(0);
    setReserved0A1(0);
    
    setMotorTemp(0);
    setHeatsinkTemp(0);
    
    setDspBoardTemp(0);
    setReservedDspBoardTemp(0);
    
    setReserved0D0(0);
    setReserved0D1(0);
    
    setOdometer(0);
    setDCBusAh(0);
    
    setSlipSpeed(0);
    setReservedSlipSpeed(0);
    
    setMotorId(0);
    
    initializeIdActionMap();
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
    
    // Motor identification
    json[JsonDefinitions::MOTOR_ID] = MotorId_;
    
    // ID Info
    json[JsonDefinitions::TRITIUM_ID] = TritiumId_;
    json[JsonDefinitions::SERIAL_NUMBER] = SerialNumber_;
    
    // Status
    json[JsonDefinitions::LIMIT_FLAGS] = LimitFlags_;
    json[JsonDefinitions::ERROR_FLAGS] = ErrorFlags_;
    json[JsonDefinitions::ACTIVE_MOTOR] = ActiveMotor_;
    json[JsonDefinitions::TX_ERROR_COUNT] = TxErrorCount_;
    json[JsonDefinitions::RX_ERROR_COUNT] = RxErrorCount_;
    
    // Bus Measurement
    json[JsonDefinitions::BUS_VOLTAGE] = BusVoltage_;
    json[JsonDefinitions::BUS_CURRENT] = BusCurrent_;
    
    // Velocity Measurement
    json[JsonDefinitions::MOTOR_VELOCITY] = MotorVelocity_;
    json[JsonDefinitions::VEHICLE_VELOCITY] = VehicleVelocity_;
    
    // Phase Current Measurement
    json[JsonDefinitions::PHASE_CURRENT_B] = PhaseCurrentB_;
    json[JsonDefinitions::PHASE_CURRENT_C] = PhaseCurrentC_;
    
    // Motor Voltage Vector Measurement
    json[JsonDefinitions::VQ] = Vq_;
    json[JsonDefinitions::VD] = Vd_;
    
    // Motor Current Vector Measurement
    json[JsonDefinitions::IQ] = Iq_;
    json[JsonDefinitions::ID] = Id_;
    
    // Motor Back EMF Measurement/Prediction
    json[JsonDefinitions::BEMF_Q] = BEMFq_;
    json[JsonDefinitions::BEMF_D] = BEMFd_;
    
    // Voltage Rail Measurements
    json[JsonDefinitions::SUPPLY_15V] = Supply15V_;
    json[JsonDefinitions::SUPPLY_1V9] = Supply1V9_;
    json[JsonDefinitions::SUPPLY_3V3] = Supply3V3_;
    
    // Temperature Measurements
    json[JsonDefinitions::MOTOR_TEMPERATURE] = MotorTemp_;
    json[JsonDefinitions::HEATSINK_TEMPERATURE] = HeatsinkTemp_;
    json[JsonDefinitions::DSP_BOARD_TEMPERATURE] = DspBoardTemp_;
    
    // Odometer and Bus Ah
    json[JsonDefinitions::ODOMETER] = Odometer_;
    json[JsonDefinitions::DC_BUS_AH] = DCBusAh_;
    
    // Slip Speed
    json[JsonDefinitions::SLIP_SPEED] = SlipSpeed_;
    
    return json;
}

void MotorDetailsPacket::initializeIdActionMap() {
    qDebug() << "Initializing Motor Details Packet ID Action Map";
    
    // Motor 0 (Left) - Base ID 0x400
    // ID Info (0x400)
    idActionMap[0x400] = {
        [this](QByteArray payload){
            setMotorId(0); // Left motor
            setTritiumId(getValue<unsigned int>(payload, 0));
            setSerialNumber(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Status (0x401)
    idActionMap[0x401] = {
        [this](QByteArray payload){
            setLimitFlags(getValue<unsigned short>(payload, 0));
            setErrorFlags(getValue<unsigned short>(payload, 2));
            setActiveMotor(getValue<unsigned short>(payload, 4));
            setTxErrorCount(getValue<unsigned char>(payload, 6));
            setRxErrorCount(getValue<unsigned char>(payload, 7));
        }
    };
    
    // Bus Measurement (0x402)
    idActionMap[0x402] = {
        [this](QByteArray payload){
            setBusVoltage(getValue<unsigned int>(payload, 0));
            setBusCurrent(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Velocity Measurement (0x403)
    idActionMap[0x403] = {
        [this](QByteArray payload){
            setMotorVelocity(getValue<unsigned int>(payload, 0));
            setVehicleVelocity(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Phase Current Measurement (0x404)
    idActionMap[0x404] = {
        [this](QByteArray payload){
            setPhaseCurrentB(getValue<unsigned int>(payload, 0));
            setPhaseCurrentC(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Motor Voltage Vector Measurement (0x405)
    idActionMap[0x405] = {
        [this](QByteArray payload){
            setVq(getValue<unsigned int>(payload, 0));
            setVd(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Motor Current Vector Measurement (0x406)
    idActionMap[0x406] = {
        [this](QByteArray payload){
            setIq(getValue<unsigned int>(payload, 0));
            setId(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Motor Back EMF Measurement/Prediction (0x407)
    idActionMap[0x407] = {
        [this](QByteArray payload){
            setBEMFq(getValue<unsigned int>(payload, 0));
            setBEMFd(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Voltage Rail 15V Measurement (0x408)
    idActionMap[0x408] = {
        [this](QByteArray payload){
            setSupply15V(getValue<unsigned int>(payload, 4));
            setReservedSupply15V(getValue<unsigned int>(payload, 0));
        }
    };
    
    // Voltage Rail 3V3/1V9 Measurement (0x409)
    idActionMap[0x409] = {
        [this](QByteArray payload){
            setSupply1V9(getValue<unsigned int>(payload, 0));
            setSupply3V3(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Reserved 0A (0x40A)
    idActionMap[0x40A] = {
        [this](QByteArray payload){
            setReserved0A0(getValue<unsigned int>(payload, 0));
            setReserved0A1(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Heatsink/Motor Temp Measurement (0x40B)
    idActionMap[0x40B] = {
        [this](QByteArray payload){
            setMotorTemp(getValue<unsigned int>(payload, 0));
            setHeatsinkTemp(getValue<unsigned int>(payload, 4));
        }
    };
    
    // DSP Board Temp Measurement (0x40C)
    idActionMap[0x40C] = {
        [this](QByteArray payload){
            setDspBoardTemp(getValue<unsigned int>(payload, 0));
            setReservedDspBoardTemp(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Reserved 0D (0x40D)
    idActionMap[0x40D] = {
        [this](QByteArray payload){
            setReserved0D0(getValue<unsigned int>(payload, 0));
            setReserved0D1(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Odometer/Bus Ah Measurement (0x40E)
    idActionMap[0x40E] = {
        [this](QByteArray payload){
            setOdometer(getValue<unsigned int>(payload, 0));
            setDCBusAh(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Slip Speed Measurement (0x417)
    idActionMap[0x417] = {
        [this](QByteArray payload){
            setSlipSpeed(getValue<unsigned int>(payload, 4));
            setReservedSlipSpeed(getValue<unsigned int>(payload, 0));
        }
    };
    
    // Motor 1 (Right) - Base ID 0x420
    // ID Info (0x420)
    idActionMap[0x420] = {
        [this](QByteArray payload){
            setMotorId(1); // Right motor
            setTritiumId(getValue<unsigned int>(payload, 0));
            setSerialNumber(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Status (0x421)
    idActionMap[0x421] = {
        [this](QByteArray payload){
            setLimitFlags(getValue<unsigned short>(payload, 0));
            setErrorFlags(getValue<unsigned short>(payload, 2));
            setActiveMotor(getValue<unsigned short>(payload, 4));
            setTxErrorCount(getValue<unsigned char>(payload, 6));
            setRxErrorCount(getValue<unsigned char>(payload, 7));
        }
    };
    
    // Bus Measurement (0x422)
    idActionMap[0x422] = {
        [this](QByteArray payload){
            setBusVoltage(getValue<unsigned int>(payload, 0));
            setBusCurrent(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Velocity Measurement (0x423)
    idActionMap[0x423] = {
        [this](QByteArray payload){
            setMotorVelocity(getValue<unsigned int>(payload, 0));
            setVehicleVelocity(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Phase Current Measurement (0x424)
    idActionMap[0x424] = {
        [this](QByteArray payload){
            setPhaseCurrentB(getValue<unsigned int>(payload, 0));
            setPhaseCurrentC(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Motor Voltage Vector Measurement (0x425)
    idActionMap[0x425] = {
        [this](QByteArray payload){
            setVq(getValue<unsigned int>(payload, 0));
            setVd(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Motor Current Vector Measurement (0x426)
    idActionMap[0x426] = {
        [this](QByteArray payload){
            setIq(getValue<unsigned int>(payload, 0));
            setId(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Motor Back EMF Measurement/Prediction (0x427)
    idActionMap[0x427] = {
        [this](QByteArray payload){
            setBEMFq(getValue<unsigned int>(payload, 0));
            setBEMFd(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Voltage Rail 15V Measurement (0x428)
    idActionMap[0x428] = {
        [this](QByteArray payload){
            setSupply15V(getValue<unsigned int>(payload, 4));
            setReservedSupply15V(getValue<unsigned int>(payload, 0));
        }
    };
    
    // Voltage Rail 3V3/1V9 Measurement (0x429)
    idActionMap[0x429] = {
        [this](QByteArray payload){
            setSupply1V9(getValue<unsigned int>(payload, 0));
            setSupply3V3(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Reserved 0A (0x42A)
    idActionMap[0x42A] = {
        [this](QByteArray payload){
            setReserved0A0(getValue<unsigned int>(payload, 0));
            setReserved0A1(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Heatsink/Motor Temp Measurement (0x42B)
    idActionMap[0x42B] = {
        [this](QByteArray payload){
            setMotorTemp(getValue<unsigned int>(payload, 0));
            setHeatsinkTemp(getValue<unsigned int>(payload, 4));
        }
    };
    
    // DSP Board Temp Measurement (0x42C)
    idActionMap[0x42C] = {
        [this](QByteArray payload){
            setDspBoardTemp(getValue<unsigned int>(payload, 0));
            setReservedDspBoardTemp(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Reserved 0D (0x42D)
    idActionMap[0x42D] = {
        [this](QByteArray payload){
            setReserved0D0(getValue<unsigned int>(payload, 0));
            setReserved0D1(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Odometer/Bus Ah Measurement (0x42E)
    idActionMap[0x42E] = {
        [this](QByteArray payload){
            setOdometer(getValue<unsigned int>(payload, 0));
            setDCBusAh(getValue<unsigned int>(payload, 4));
        }
    };
    
    // Slip Speed Measurement (0x437)
    idActionMap[0x437] = {
        [this](QByteArray payload){
            setSlipSpeed(getValue<unsigned int>(payload, 4));
            setReservedSlipSpeed(getValue<unsigned int>(payload, 0));
        }
    };
}
