#ifndef MOTORPACKET_H
#define MOTORPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class MotorPacket : public IPacket {
    Q_OBJECT
    DEFINE_PROPERTY(uint32_t, TritiumId)
    DEFINE_PROPERTY(unsigned int, SerialNumber)

    DEFINE_PROPERTY(unsigned short, LimitFlags)
    DEFINE_PROPERTY(unsigned short, ErrorFlags)
    DEFINE_PROPERTY(unsigned short, ActiveMotor)
    DEFINE_PROPERTY(unsigned char, TxErrorCount)
    DEFINE_PROPERTY(unsigned char, RxErrorCount)

    DEFINE_PROPERTY(unsigned int, BusVoltage)
    DEFINE_PROPERTY(unsigned int, BusCurrent)

    DEFINE_PROPERTY(unsigned int, MotorVelocity)
    DEFINE_PROPERTY(unsigned int, VehicleVelocity)

    DEFINE_PROPERTY(unsigned int, PhaseCurrentB)
    DEFINE_PROPERTY(unsigned int, PhaseCurrentC)

    DEFINE_PROPERTY(unsigned int, Vq)
    DEFINE_PROPERTY(unsigned int, Vd)

    DEFINE_PROPERTY(unsigned int, Iq)
    DEFINE_PROPERTY(unsigned int, Id)

    DEFINE_PROPERTY(unsigned int, Bemfq)
    DEFINE_PROPERTY(unsigned int, Bemfd)

    DEFINE_PROPERTY(unsigned int, Supply15V)
    DEFINE_PROPERTY(unsigned int, ReservedSupply15V)

    DEFINE_PROPERTY(unsigned int, Supply1V9)
    DEFINE_PROPERTY(unsigned int, Supply3V3)

    DEFINE_PROPERTY(unsigned int, Reserved0A0)
    DEFINE_PROPERTY(unsigned int, Reserved0A1)

    DEFINE_PROPERTY(unsigned int, MotorTemp)
    DEFINE_PROPERTY(unsigned int, HeatsinkTemp)

    DEFINE_PROPERTY(unsigned int, DspBoardTemp)
    DEFINE_PROPERTY(unsigned int, ReservedDspBoardTemp)

    DEFINE_PROPERTY(unsigned int, Reserved0D0)
    DEFINE_PROPERTY(unsigned int, Reserved0D1)

    DEFINE_PROPERTY(unsigned int, Odometer)
    DEFINE_PROPERTY(unsigned int, DcBusAh)

    DEFINE_PROPERTY(unsigned int, SlipSpeed)
    DEFINE_PROPERTY(unsigned int, ReservedSlipSpeed)

public:
    MotorPacket();
    QJsonObject toJson() override;

protected:
    void initializeIdActionMap() override;
};

#endif // MOTORPACKET_H
