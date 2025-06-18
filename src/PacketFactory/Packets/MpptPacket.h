#ifndef MPPTPACKET_H
#define MPPTPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class MpptPacket : public IPacket {
    Q_OBJECT
    // Channel 0 properties
    DEFINE_PROPERTY(unsigned short, Channel0ArrayVoltage)
    DEFINE_PROPERTY(unsigned short, Channel0ArrayCurrent)
    DEFINE_PROPERTY(unsigned short, Channel0BatteryVoltage)
    DEFINE_PROPERTY(unsigned short, Channel0Temperature)
    
    // Channel 1 properties
    DEFINE_PROPERTY(unsigned short, Channel1ArrayVoltage)
    DEFINE_PROPERTY(unsigned short, Channel1ArrayCurrent)
    DEFINE_PROPERTY(unsigned short, Channel1BatteryVoltage)
    DEFINE_PROPERTY(unsigned short, Channel1Temperature)

public:
    MpptPacket();
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;

protected:
    void initializeIdActionMap() override;
};

#endif // MPPTPACKET_H