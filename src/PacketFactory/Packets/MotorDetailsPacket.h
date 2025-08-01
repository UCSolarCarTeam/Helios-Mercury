#ifndef MOTORDETAILSPACKET_H
#define MOTORDETAILSPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class MotorDetailsPacket : public IPacket {
    Q_OBJECT
    
    // ID Info (0x400/0x420)
    DEFINE_PROPERTY(unsigned int, TritiumId)
    DEFINE_PROPERTY(unsigned int, SerialNumber)
    
    // Status (0x401/0x421)
    DEFINE_PROPERTY(unsigned short, LimitFlags)
    DEFINE_PROPERTY(unsigned short, ErrorFlags)
    DEFINE_PROPERTY(unsigned short, ActiveMotor)
    DEFINE_PROPERTY(unsigned char, TxErrorCount)
    DEFINE_PROPERTY(unsigned char, RxErrorCount)
    
    // Bus Measurement (0x402/0x422)
    DEFINE_PROPERTY(unsigned int, BusVoltage)
    DEFINE_PROPERTY(unsigned int, BusCurrent)
    
    // Velocity Measurement (0x403/0x423)
    DEFINE_PROPERTY(unsigned int, MotorVelocity)
    DEFINE_PROPERTY(unsigned int, VehicleVelocity)
    
    // Phase Current Measurement (0x404/0x424)
    DEFINE_PROPERTY(unsigned int, PhaseCurrentB)
    DEFINE_PROPERTY(unsigned int, PhaseCurrentC)
    
    // Motor Voltage Vector Measurement (0x405/0x425)
    DEFINE_PROPERTY(unsigned int, Vq)
    DEFINE_PROPERTY(unsigned int, Vd)
    
    // Motor Current Vector Measurement (0x406/0x426)
    DEFINE_PROPERTY(unsigned int, Iq)
    DEFINE_PROPERTY(unsigned int, Id)
    
    // Motor Back EMF Measurement/Prediction (0x407/0x427)
    DEFINE_PROPERTY(unsigned int, BEMFq)
    DEFINE_PROPERTY(unsigned int, BEMFd)
    
    // Voltage Rail 15V Measurement (0x408/0x428)
    DEFINE_PROPERTY(unsigned int, Supply15V)
    DEFINE_PROPERTY(unsigned int, ReservedSupply15V)
    
    // Voltage Rail 3V3/1V9 Measurement (0x409/0x429)
    DEFINE_PROPERTY(unsigned int, Supply1V9)
    DEFINE_PROPERTY(unsigned int, Supply3V3)
    
    // Reserved 0A (0x40A/0x42A)
    DEFINE_PROPERTY(unsigned int, Reserved0A0)
    DEFINE_PROPERTY(unsigned int, Reserved0A1)
    
    // Heatsink/Motor Temp Measurement (0x40B/0x42B)
    DEFINE_PROPERTY(unsigned int, MotorTemp)
    DEFINE_PROPERTY(unsigned int, HeatsinkTemp)
    
    // DSP Board Temp Measurement (0x40C/0x42C)
    DEFINE_PROPERTY(unsigned int, DspBoardTemp)
    DEFINE_PROPERTY(unsigned int, ReservedDspBoardTemp)
    
    // Reserved 0D (0x40D/0x42D)
    DEFINE_PROPERTY(unsigned int, Reserved0D0)
    DEFINE_PROPERTY(unsigned int, Reserved0D1)
    
    // Odometer/Bus Ah Measurement (0x40E/0x42E)
    DEFINE_PROPERTY(unsigned int, Odometer)
    DEFINE_PROPERTY(unsigned int, DCBusAh)
    
    // Slip Speed Measurement (0x417/0x437)
    DEFINE_PROPERTY(unsigned int, SlipSpeed)
    DEFINE_PROPERTY(unsigned int, ReservedSlipSpeed)
    
    // Motor selection (0 = Left, 1 = Right)
    DEFINE_PROPERTY(unsigned char, MotorId)

public:
    MotorDetailsPacket();
    QJsonObject toJson() override;

protected:
    void initializeIdActionMap() override;
};

#endif // MOTORDETAILSPACKET_H
