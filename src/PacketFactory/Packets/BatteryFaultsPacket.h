#ifndef BATTERYFAULTSPACKET_H
#define BATTERYFAULTSPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class BatteryFaultsPacket : public IPacket {
    Q_OBJECT

    // DTC flags  
    DEFINE_PROPERTY(bool, InternalCommunicationFault)
    DEFINE_PROPERTY(bool, InternalConversionFault)
    DEFINE_PROPERTY(bool, WeakCellFault)
    DEFINE_PROPERTY(bool, LowCellVoltageFault)
    DEFINE_PROPERTY(bool, OpenWiringFault)
    DEFINE_PROPERTY(bool, CurrentSensorFault)
    DEFINE_PROPERTY(bool, PackVoltageSensorFault)
    DEFINE_PROPERTY(bool, WeakPackFault)
    DEFINE_PROPERTY(bool, VoltageRedundancyFault)
    DEFINE_PROPERTY(bool, FanMonitorFault)
    DEFINE_PROPERTY(bool, ThermistorFault)
    DEFINE_PROPERTY(bool, CanbusCommunicationFault)
    DEFINE_PROPERTY(bool, AlwaysOnSupplyFault)
    DEFINE_PROPERTY(bool, HighVoltageIsolationFault)
    DEFINE_PROPERTY(bool, PowerSupply12VFault)
    DEFINE_PROPERTY(bool, ChargeLimitEnforcementFault)
    DEFINE_PROPERTY(bool, DischargeLimitEnforcementFault)
    DEFINE_PROPERTY(bool, ChargerSafetyRelayFault)
    DEFINE_PROPERTY(bool, InternalMemoryFault)
    DEFINE_PROPERTY(bool, InternalThermistorFault)
    DEFINE_PROPERTY(bool, InternalLogicFault)
    
    // Limit flags 
    DEFINE_PROPERTY(bool, DclReducedDueToLowSoc)
    DEFINE_PROPERTY(bool, DclReducedDueToHighCellResistance)
    DEFINE_PROPERTY(bool, DclReducedDueToTemperature)
    DEFINE_PROPERTY(bool, DclReducedDueToLowCellVoltage)
    DEFINE_PROPERTY(bool, DclReducedDueToLowPackVoltage)
    DEFINE_PROPERTY(bool, DclAndCclReducedDueToVoltageFailsafe)
    DEFINE_PROPERTY(bool, DclAndCclReducedDueToCommunicationFailsafe)
    DEFINE_PROPERTY(bool, CclReducedDueToHighSoc)
    DEFINE_PROPERTY(bool, CclReducedDueToHighCellResistance)
    DEFINE_PROPERTY(bool, CclReducedDueToTemperature)
    DEFINE_PROPERTY(bool, CclReducedDueToHighCellVoltage)
    DEFINE_PROPERTY(bool, CclReducedDueToHighPackVoltage)
    DEFINE_PROPERTY(bool, CclReducedDueToChargerLatch)
    DEFINE_PROPERTY(bool, CclReducedDueToAlternateCurrentLimit)

public:
    BatteryFaultsPacket();
    QJsonObject toJson() override;

protected:
    void initializeIdActionMap() override;
};

#endif // BATTERYFAULTSPACKET_H