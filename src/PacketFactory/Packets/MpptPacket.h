#ifndef MPPTPACKET_H
#define MPPTPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class MpptPacket : public IPacket {
    Q_OBJECT
    // Channel 0 Properties 
    DEFINE_PROPERTY(quint16, Channel0ArrayVoltage)
    DEFINE_PROPERTY(quint16, Channel0ArrayCurrent)
    DEFINE_PROPERTY(quint16, Channel0BatteryVoltage)
    DEFINE_PROPERTY(quint16, Channel0Temperature)
    
    // Channel 1 Properties
    DEFINE_PROPERTY(quint16, Channel1ArrayVoltage)
    DEFINE_PROPERTY(quint16, Channel1ArrayCurrent)
    DEFINE_PROPERTY(quint16, Channel1BatteryVoltage)
    DEFINE_PROPERTY(quint16, Channel1Temperature)

public:
    MpptPacket();
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;

protected:
    void initializeIdActionMap() override;
};

#endif // MPPTPACKET_H