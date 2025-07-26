#ifndef MPPTPACKET_H
#define MPPTPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class MpptPacket : public IPacket {
    Q_OBJECT

    // MPPT 0 Channel 0
    DEFINE_PROPERTY(unsigned short, Mppt0Ch0ArrayVoltage)
    DEFINE_PROPERTY(unsigned short, Mppt0Ch0ArrayCurrent)
    DEFINE_PROPERTY(unsigned short, Mppt0Ch0BatteryVoltage)
    DEFINE_PROPERTY(unsigned short, Mppt0Ch0UnitTemperature)

    // MPPT 0 Channel 1
    DEFINE_PROPERTY(unsigned short, Mppt0Ch1ArrayVoltage)
    DEFINE_PROPERTY(unsigned short, Mppt0Ch1ArrayCurrent)
    DEFINE_PROPERTY(unsigned short, Mppt0Ch1BatteryVoltage)
    DEFINE_PROPERTY(unsigned short, Mppt0Ch1UnitTemperature)

    // MPPT 1 Channel 0
    DEFINE_PROPERTY(unsigned short, Mppt1Ch0ArrayVoltage)
    DEFINE_PROPERTY(unsigned short, Mppt1Ch0ArrayCurrent)
    DEFINE_PROPERTY(unsigned short, Mppt1Ch0BatteryVoltage)
    DEFINE_PROPERTY(unsigned short, Mppt1Ch0UnitTemperature)

    // MPPT 1 Channel 1
    DEFINE_PROPERTY(unsigned short, Mppt1Ch1ArrayVoltage)
    DEFINE_PROPERTY(unsigned short, Mppt1Ch1ArrayCurrent)
    DEFINE_PROPERTY(unsigned short, Mppt1Ch1BatteryVoltage)
    DEFINE_PROPERTY(unsigned short, Mppt1Ch1UnitTemperature)

    // MPPT 2 Channel 0
    DEFINE_PROPERTY(unsigned short, Mppt2Ch0ArrayVoltage)
    DEFINE_PROPERTY(unsigned short, Mppt2Ch0ArrayCurrent)
    DEFINE_PROPERTY(unsigned short, Mppt2Ch0BatteryVoltage)
    DEFINE_PROPERTY(unsigned short, Mppt2Ch0UnitTemperature)

    // MPPT 2 Channel 1
    DEFINE_PROPERTY(unsigned short, Mppt2Ch1ArrayVoltage)
    DEFINE_PROPERTY(unsigned short, Mppt2Ch1ArrayCurrent)
    DEFINE_PROPERTY(unsigned short, Mppt2Ch1BatteryVoltage)
    DEFINE_PROPERTY(unsigned short, Mppt2Ch1UnitTemperature)

    // MPPT 3 Channel 0
    DEFINE_PROPERTY(unsigned short, Mppt3Ch0ArrayVoltage)
    DEFINE_PROPERTY(unsigned short, Mppt3Ch0ArrayCurrent)
    DEFINE_PROPERTY(unsigned short, Mppt3Ch0BatteryVoltage)
    DEFINE_PROPERTY(unsigned short, Mppt3Ch0UnitTemperature)

    // MPPT 3 Channel 1
    DEFINE_PROPERTY(unsigned short, Mppt3Ch1ArrayVoltage)
    DEFINE_PROPERTY(unsigned short, Mppt3Ch1ArrayCurrent)
    DEFINE_PROPERTY(unsigned short, Mppt3Ch1BatteryVoltage)
    DEFINE_PROPERTY(unsigned short, Mppt3Ch1UnitTemperature)

public:
    MpptPacket();
    QJsonObject toJson() override;

protected:
    void initializeIdActionMap() override;
};

#endif // MPPTPACKET_H