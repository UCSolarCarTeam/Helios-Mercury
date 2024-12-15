#ifndef BATTERYPACKET_H
#define BATTERYPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class BatteryPacket : public IPacket {
    Q_OBJECT
    DEFINE_PROPERTY(unsigned char, BmuAlive)

    DEFINE_PROPERTY(bool, DischargeRelayEnabled)
    DEFINE_PROPERTY(bool, ChargeRelayEnabled)
    DEFINE_PROPERTY(bool, ChargerSafetyRelayEnabled)
    DEFINE_PROPERTY(bool, MalfunctionIndicatorActive)
    DEFINE_PROPERTY(bool, MultiPurposeInputSignalStatus)
    DEFINE_PROPERTY(bool, AlwaysOnSignalStatus)
    DEFINE_PROPERTY(bool, IsReadySignalStatus)
    DEFINE_PROPERTY(bool, IsChargingSignalStatus)

    DEFINE_PROPERTY(unsigned char, PopulatedCells)
    DEFINE_PROPERTY(float, Input12V)
    DEFINE_PROPERTY(float, FanVoltage)
    DEFINE_PROPERTY(float, PackCurrent)
    DEFINE_PROPERTY(float, PackVoltage)
    DEFINE_PROPERTY(float, PackStateOfCharge)
    DEFINE_PROPERTY(float, PackAmphours)
    DEFINE_PROPERTY(float, PackDepthOfDischarge)
    DEFINE_PROPERTY(unsigned char, HighTemperature)
    DEFINE_PROPERTY(unsigned char, HighThermistorId)
    DEFINE_PROPERTY(unsigned char, LowTemperature)
    DEFINE_PROPERTY(unsigned char, LowThermistorId)
    DEFINE_PROPERTY(unsigned char, AverageTemperature)
    DEFINE_PROPERTY(unsigned char, InternalTemperature)
    DEFINE_PROPERTY(unsigned char, FanSpeed)
    DEFINE_PROPERTY(unsigned char, RequestedFanSpeed)

    DEFINE_PROPERTY(unsigned short, LowCellVoltage)
    DEFINE_PROPERTY(unsigned char, LowCellVoltageId)
    DEFINE_PROPERTY(unsigned short, HighCellVoltage)
    DEFINE_PROPERTY(unsigned char, HighCellVoltageId)
    DEFINE_PROPERTY(unsigned short, AverageCellVoltage)

public:
    BatteryPacket();
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;
};

#endif // BATTERYPACKET_H