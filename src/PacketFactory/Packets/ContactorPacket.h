#ifndef CONTACTORPACKET_H
#define CONTACTORPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class ContactorPacket : public IPacket {
    Q_OBJECT

    // Heartbeats 
    DEFINE_PROPERTY(bool, CommonHeartbeat)
    DEFINE_PROPERTY(bool, MotorHeartbeat)
    DEFINE_PROPERTY(bool, ArrayHeartbeat)
    DEFINE_PROPERTY(bool, LvHeartbeat)
    DEFINE_PROPERTY(bool, ChargeHeartbeat)

    // Common Board Status
    DEFINE_PROPERTY(bool, CommonPrechargerClosed)
    DEFINE_PROPERTY(bool, CommonPrechargerClosing)
    DEFINE_PROPERTY(bool, CommonPrechargerError)
    DEFINE_PROPERTY(bool, CommonContactorClosed)
    DEFINE_PROPERTY(bool, CommonContactorClosing)
    DEFINE_PROPERTY(bool, CommonContactorError)
    DEFINE_PROPERTY(quint16, CommonLineCurrent)
    DEFINE_PROPERTY(quint16, CommonChargeCurrent)
    DEFINE_PROPERTY(bool, CommonContactorOpeningError)

    // Motor Board Status
    DEFINE_PROPERTY(bool, MotorPrechargerClosed)
    DEFINE_PROPERTY(bool, MotorPrechargerClosing)
    DEFINE_PROPERTY(bool, MotorPrechargerError)
    DEFINE_PROPERTY(bool, MotorContactorClosed)
    DEFINE_PROPERTY(bool, MotorContactorClosing)
    DEFINE_PROPERTY(bool, MotorContactorError)
    DEFINE_PROPERTY(quint16, MotorLineCurrent) 
    DEFINE_PROPERTY(quint16, MotorChargeCurrent) 
    DEFINE_PROPERTY(bool, MotorBPSError)

    // Array Board Status
    DEFINE_PROPERTY(bool, ArrayPrechargerClosed)
    DEFINE_PROPERTY(bool, ArrayPrechargerClosing)
    DEFINE_PROPERTY(bool, ArrayPrechargerError)
    DEFINE_PROPERTY(bool, ArrayContactorClosed)
    DEFINE_PROPERTY(bool, ArrayContactorClosing)
    DEFINE_PROPERTY(bool, ArrayContactorError)
    DEFINE_PROPERTY(quint16, ArrayLineCurrent) 
    DEFINE_PROPERTY(quint16, ArrayChargeCurrent) 
    DEFINE_PROPERTY(bool, ArrayBPSError)

    // LV Board Status
    DEFINE_PROPERTY(bool, LvPrechargerClosed)
    DEFINE_PROPERTY(bool, LvPrechargerClosing)
    DEFINE_PROPERTY(bool, LvPrechargerError)
    DEFINE_PROPERTY(bool, LvContactorClosed)
    DEFINE_PROPERTY(bool, LvContactorClosing)
    DEFINE_PROPERTY(bool, LvContactorError)
    DEFINE_PROPERTY(quint16, LvLineCurrent)    
    DEFINE_PROPERTY(quint16, LvChargeCurrent)  
    DEFINE_PROPERTY(bool, LvBpsError)

    // Charge Board Status
    DEFINE_PROPERTY(bool, ChargePrechargerClosed)
    DEFINE_PROPERTY(bool, ChargePrechargerClosing)
    DEFINE_PROPERTY(bool, ChargePrechargerError)
    DEFINE_PROPERTY(bool, ChargeContactorClosed)
    DEFINE_PROPERTY(bool, ChargeContactorClosing)
    DEFINE_PROPERTY(bool, ChargeContactorError)
    DEFINE_PROPERTY(quint16, ChargeLineCurrent)
    DEFINE_PROPERTY(quint16, ChargeChargeCurrent)
    DEFINE_PROPERTY(bool, ChargeBPSError)

public:
    ContactorPacket();
    QJsonObject toJson() override;

protected:
    void initializeIdActionMap() override;
};

#endif // CONTACTORPACKET_H