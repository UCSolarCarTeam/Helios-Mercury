#include "MotorDetailsPacket.h"
#include "../../Config/JsonDefinitions.h"

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
