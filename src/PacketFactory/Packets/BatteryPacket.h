#ifndef BATTERYPACKET_H
#define BATTERYPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class BatteryPacket : public IPacket {
    Q_OBJECT
    // BMU Heartbeat 
    DEFINE_PROPERTY(unsigned char, BmuAlive)

    // Startup Info
    DEFINE_PROPERTY(bool, DischargeRelayEnabled)
    DEFINE_PROPERTY(bool, ChargeRelayEnabled)
    DEFINE_PROPERTY(bool, ChargerSafetyEnabled)
    DEFINE_PROPERTY(bool, MalfunctionIndicatorActive)
    DEFINE_PROPERTY(bool, MultiPurposeInputSignalStatus)
    DEFINE_PROPERTY(bool, AlwaysOnSignalStatus)
    DEFINE_PROPERTY(bool, IsReadySignalStatus)
    DEFINE_PROPERTY(bool, IsChargingSignalStatus)
    DEFINE_PROPERTY(unsigned char, PopulatedCells)
    DEFINE_PROPERTY(float, Input12V)
    DEFINE_PROPERTY(float, FanVoltage)

    // Pack Info 
    DEFINE_PROPERTY(float, PackCurrent)
    DEFINE_PROPERTY(float, PackVoltage)
    DEFINE_PROPERTY(float, PackStateOfCharge)
    DEFINE_PROPERTY(float, PackAmphours)
    DEFINE_PROPERTY(float, PackDepthOfDischarge)

    // Temp Info 
    DEFINE_PROPERTY(unsigned char, HighTemperature)
    DEFINE_PROPERTY(unsigned char, HighThermistorId)
    DEFINE_PROPERTY(unsigned char, LowTemperature)
    DEFINE_PROPERTY(unsigned char, LowThermistorId)
    DEFINE_PROPERTY(unsigned char, AverageTemperature)
    DEFINE_PROPERTY(unsigned char, InternalTemperature)
    DEFINE_PROPERTY(unsigned char, FanSpeed)
    DEFINE_PROPERTY(unsigned char, RequestedFanSpeed)

    // Cell Voltages
    DEFINE_PROPERTY(unsigned short, LowCellVoltage)
    DEFINE_PROPERTY(unsigned char, LowCellVoltageId)
    DEFINE_PROPERTY(unsigned short, HighCellVoltage)
    DEFINE_PROPERTY(unsigned char, HighCellVoltageId)
    DEFINE_PROPERTY(unsigned short, AverageCellVoltage)

    // Max Min Voltages
    DEFINE_PROPERTY(unsigned short, MaximumCellVoltage)
    DEFINE_PROPERTY(unsigned short, MinimumCellVoltage)
    DEFINE_PROPERTY(unsigned short, MaximumPackVoltage)
    DEFINE_PROPERTY(unsigned short, MinimumPackVoltage)

public:
    BatteryPacket();
    QJsonObject toJson() override;

protected:
    void initializeIdActionMap() override;
};

#endif // BATTERYPACKET_H
