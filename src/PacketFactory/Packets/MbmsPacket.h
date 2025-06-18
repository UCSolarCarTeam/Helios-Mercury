#ifndef MBMSPACKET_H
#define MBMSPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class MbmsPacket : public IPacket {
    Q_OBJECT
    
    // Base/Heartbeat
    DEFINE_PROPERTY(bool, Heartbeat)
    
    // Contactor Commands
    DEFINE_PROPERTY(bool, CommonContactorCommand)
    DEFINE_PROPERTY(bool, MotorContactorCommand)
    DEFINE_PROPERTY(bool, ArrayContactorCommand)
    DEFINE_PROPERTY(bool, LvContactorCommand)
    DEFINE_PROPERTY(bool, ChargeContactorCommand)
    
    // MBMS Status
    DEFINE_PROPERTY(unsigned short, AuxiliaryBatteryVoltage)
    DEFINE_PROPERTY(bool, StrobeBmsLight)
    DEFINE_PROPERTY(bool, ChargeEnable)
    DEFINE_PROPERTY(bool, ChargeSafety)
    DEFINE_PROPERTY(bool, DischargeEnable)
    DEFINE_PROPERTY(bool, OrionCanReceivedRecently)
    DEFINE_PROPERTY(bool, DischargeShouldTrip)
    DEFINE_PROPERTY(bool, ChargeShouldTrip)
    DEFINE_PROPERTY(unsigned char, StartupState)
    DEFINE_PROPERTY(unsigned char, SystemState)
    
    // Power Selection Status
    DEFINE_PROPERTY(bool, MainPowerSwitch)
    DEFINE_PROPERTY(bool, ExternalShutdown)
    DEFINE_PROPERTY(bool, En1)
    DEFINE_PROPERTY(bool, DcdcFault)
    DEFINE_PROPERTY(bool, ThreeAOc)
    DEFINE_PROPERTY(bool, DcdcOn)
    DEFINE_PROPERTY(bool, ChgFault)
    DEFINE_PROPERTY(bool, ChgOn)
    DEFINE_PROPERTY(bool, ChgLvEn)
    DEFINE_PROPERTY(bool, AbattDisable)
    DEFINE_PROPERTY(bool, Key)
    
    // MBMS Trip
    DEFINE_PROPERTY(bool, HighCellVoltageTrip)
    DEFINE_PROPERTY(bool, LowCellVoltageTrip)
    DEFINE_PROPERTY(bool, CommonHighCurrentTrip)
    DEFINE_PROPERTY(bool, MotorHighCurrentTrip)
    DEFINE_PROPERTY(bool, ArrayHighCurrentTrip)
    DEFINE_PROPERTY(bool, LvHighCurrentTrip)
    DEFINE_PROPERTY(bool, ChargeHighCurrentTrip)
    DEFINE_PROPERTY(bool, ProtectionTrip)
    DEFINE_PROPERTY(bool, OrionMessageTimeoutTrip)
    DEFINE_PROPERTY(bool, ContactorDisconnectedUnexpectedlyTrip)
    DEFINE_PROPERTY(bool, ContactorConnectedUnexpectedlyTrip)
    DEFINE_PROPERTY(bool, CommonHeartbeatDeadTrip)
    DEFINE_PROPERTY(bool, MotorHeartbeatDeadTrip)
    DEFINE_PROPERTY(bool, ArrayHeartbeatDeadTrip)
    DEFINE_PROPERTY(bool, LvHeartbeatDeadTrip)
    DEFINE_PROPERTY(bool, ChargeHeartbeatDeadTrip)
    DEFINE_PROPERTY(bool, MpsDisabledTrip)
    DEFINE_PROPERTY(bool, EsdEnabledTrip)
    DEFINE_PROPERTY(bool, HighTemperatureTrip)
    DEFINE_PROPERTY(bool, LowTemperatureTrip)
    
    // MBMS Soft Battery Limit Warning
    DEFINE_PROPERTY(bool, HighCellVoltageWarning)
    DEFINE_PROPERTY(bool, LowCellVoltageWarning)
    DEFINE_PROPERTY(bool, CommonHighCurrentWarning)
    DEFINE_PROPERTY(bool, MotorHighCurrentWarning)
    DEFINE_PROPERTY(bool, ArrayHighCurrentWarning)
    DEFINE_PROPERTY(bool, LvHighCurrentWarning)
    DEFINE_PROPERTY(bool, ChargeHighCurrentWarning)
    DEFINE_PROPERTY(bool, HighTemperatureWarning)
    DEFINE_PROPERTY(bool, LowTemperatureWarning)

public:
    MbmsPacket();
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;

protected:
    void initializeIdActionMap() override;
};

#endif // MBMSPACKET_H