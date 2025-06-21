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
}

QJsonObject MotorDetailsPacket::toJson() {
    QJsonObject json;
    
    // Motor identification
    json[JsonDefinitions::MOTOR_ID] = static_cast<qint64>(MotorId_);
    
    // ID Info
    json[JsonDefinitions::TRITIUM_ID] = static_cast<qint64>(TritiumId_);
    json[JsonDefinitions::SERIAL_NUMBER] = static_cast<qint64>(SerialNumber_);
    
    // Status
    json[JsonDefinitions::LIMIT_FLAGS] = static_cast<qint64>(LimitFlags_);
    json[JsonDefinitions::ERROR_FLAGS] = static_cast<qint64>(ErrorFlags_);
    json[JsonDefinitions::ACTIVE_MOTOR] = static_cast<qint64>(ActiveMotor_);
    json[JsonDefinitions::TX_ERROR_COUNT] = static_cast<qint64>(TxErrorCount_);
    json[JsonDefinitions::RX_ERROR_COUNT] = static_cast<qint64>(RxErrorCount_);
    
    // Bus Measurement
    json[JsonDefinitions::BUS_VOLTAGE] = static_cast<qint64>(BusVoltage_);
    json[JsonDefinitions::BUS_CURRENT] = static_cast<qint64>(BusCurrent_);
    
    // Velocity Measurement
    json[JsonDefinitions::MOTOR_VELOCITY] = static_cast<qint64>(MotorVelocity_);
    json[JsonDefinitions::VEHICLE_VELOCITY] = static_cast<qint64>(VehicleVelocity_);
    
    // Phase Current Measurement
    json[JsonDefinitions::PHASE_CURRENT_B] = static_cast<qint64>(PhaseCurrentB_);
    json[JsonDefinitions::PHASE_CURRENT_C] = static_cast<qint64>(PhaseCurrentC_);
    
    // Motor Voltage Vector Measurement
    json[JsonDefinitions::VQ] = static_cast<qint64>(Vq_);
    json[JsonDefinitions::VD] = static_cast<qint64>(Vd_);
    
    // Motor Current Vector Measurement
    json[JsonDefinitions::IQ] = static_cast<qint64>(Iq_);
    json[JsonDefinitions::ID] = static_cast<qint64>(Id_);
    
    // Motor Back EMF Measurement/Prediction
    json[JsonDefinitions::BEMF_Q] = static_cast<qint64>(BEMFq_);
    json[JsonDefinitions::BEMF_D] = static_cast<qint64>(BEMFd_);
    
    // Voltage Rail Measurements
    json[JsonDefinitions::SUPPLY_15V] = static_cast<qint64>(Supply15V_);
    json[JsonDefinitions::SUPPLY_1V9] = static_cast<qint64>(Supply1V9_);
    json[JsonDefinitions::SUPPLY_3V3] = static_cast<qint64>(Supply3V3_);
    
    // Temperature Measurements
    json[JsonDefinitions::MOTOR_TEMPERATURE] = static_cast<qint64>(MotorTemp_);
    json[JsonDefinitions::HEATSINK_TEMPERATURE] = static_cast<qint64>(HeatsinkTemp_);
    json[JsonDefinitions::DSP_BOARD_TEMPERATURE] = static_cast<qint64>(DspBoardTemp_);
    
    // Odometer and Bus Ah
    json[JsonDefinitions::ODOMETER] = static_cast<qint64>(Odometer_);
    json[JsonDefinitions::DC_BUS_AH] = static_cast<qint64>(DCBusAh_);
    
    // Slip Speed
    json[JsonDefinitions::SLIP_SPEED] = static_cast<qint64>(SlipSpeed_);
    
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
