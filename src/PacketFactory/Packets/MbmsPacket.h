#ifndef MBMSPACKET_H
#define MBMSPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class MbmsPacket : public IPacket {
    Q_OBJECT
    DEFINE_PROPERTY(bool, CommonContactorState)
    DEFINE_PROPERTY(bool, MotorContactorState)
    DEFINE_PROPERTY(bool, ArrayContactorState)
    DEFINE_PROPERTY(bool, LvContactorState)
    DEFINE_PROPERTY(bool, ChargeContactorState)

    DEFINE_PROPERTY(bool, CommonContactorError)
    DEFINE_PROPERTY(bool, MotorContactorError)
    DEFINE_PROPERTY(bool, ArrayContactorError)
    DEFINE_PROPERTY(bool, LvContactorError)
    DEFINE_PROPERTY(bool, ChargeContactorError)

    DEFINE_PROPERTY(bool, StrobeBmsLight)
    DEFINE_PROPERTY(bool, AllowCharge)
    DEFINE_PROPERTY(bool, HighVoltageEnableState)
    DEFINE_PROPERTY(bool, AllowDischarge)
    DEFINE_PROPERTY(bool, OrionCanReceivedRecently)
    DEFINE_PROPERTY(bool, DischargeShouldTrip)
    DEFINE_PROPERTY(bool, ChargeShouldTrip)

    DEFINE_PROPERTY(unsigned short, AuxillaryBatteryVoltage)
    DEFINE_PROPERTY(unsigned short, MotorVoltage)
    DEFINE_PROPERTY(unsigned short, ArrayVoltage)
    DEFINE_PROPERTY(unsigned short, LvVoltage)
    DEFINE_PROPERTY(unsigned short, ChargeVoltage)
    DEFINE_PROPERTY(unsigned short, CommonCurrent)
    DEFINE_PROPERTY(unsigned short, MotorCurrent)
    DEFINE_PROPERTY(unsigned short, ArrayCurrent)
    DEFINE_PROPERTY(unsigned short, LvCurrent)
    DEFINE_PROPERTY(unsigned short, ChargeCurrent)

    DEFINE_PROPERTY(bool, HighCellVoltageTrip)
    DEFINE_PROPERTY(bool, LowCellVoltageTrip)
    DEFINE_PROPERTY(bool, HighCommonCurrentTrip)
    DEFINE_PROPERTY(bool, MotorHighTemperatureCurrentTrip)
    DEFINE_PROPERTY(bool, ArrayHighTemperatureCurrentTrip)
    DEFINE_PROPERTY(bool, LvHighTemperatureCurrentTrip)
    DEFINE_PROPERTY(bool, ChargeHighTemperatureCurrentTrip)
    DEFINE_PROPERTY(bool, ProtectionTrip)
    DEFINE_PROPERTY(bool, OrionMessageTimeoutTrip)
    DEFINE_PROPERTY(bool, ContactorDisconnectedUnexpectedlyTrip)

public:
    MbmsPacket();
    QJsonObject toJson() override;
};

#endif // MBMSPACKET_H
