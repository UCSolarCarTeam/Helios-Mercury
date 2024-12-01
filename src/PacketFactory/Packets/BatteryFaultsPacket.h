#ifndef BATTERYFAULTSPACKET_H
#define BATTERYFAULTSPACKET_H

#include "../IPacket.h"

class BatteryFaultsPacket : public IPacket {
public:
    BatteryFaultsPacket();
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;

private:
    bool internalCommunicationFault_;
    bool internalConverversionFault_;
    bool weakCellFault_;
    bool lowCellVoltageFault_;
    bool openWiringFault_;
    bool currentSensorFault_;
    bool packVoltageSensorFault_;
    bool weakPackFault_;
    bool voltageRedundancyFault_;
    bool fanMonitorFault_;
    bool thermistorFault_;
    bool canbusCommunicationFault_;
    bool alwaysOnSupplyFault_;
    bool highVoltageIsolationFault_;
    bool powerSupply12VFault_;
    bool chargeLimitEnforcementFault_;
    bool dischargeLimitEnforcementFault_;
    bool chargerSafetyRelayFault_;
    bool internalMemoryFault_;
    bool internalThermistorFault_;
    bool internalLogicFault_;

    bool dclReducedDueToLowSoc_;
    bool dclReducedDueToHighCellResistance_;
    bool dclReducedDueToTemperature_;
    bool dclReducedDueToLowCellVoltage_;
    bool dclReducedDueToLowPackVoltage_;
    bool dclAndCclReducedDueToVoltageFailsafe_;
    bool dclAndCclReducedDueToCommunicationFailsafe_;
    bool cclReducedDueToHighSoc_;
    bool cclReducedDueToHighCellResistance_;
    bool cclReducedDueToTemperature_;
    bool cclReducedDueToHighCellVoltage_;
    bool cclReducedDueToHighPackVoltage_;
    bool cclReducedDueToChargerLatch_;
    bool cclReducedDueToAlternateCurrentLimit_;
};

#endif // BATTERYFAULTSPACKET_H