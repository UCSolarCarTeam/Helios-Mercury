#ifndef MPPTPACKET_H
#define MPPTPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class MpptPacket : public IPacket {
    Q_OBJECT
    DEFINE_PROPERTY(unsigned char, ChannelNumber)
    DEFINE_PROPERTY(unsigned char, MpptStatus)

    DEFINE_PROPERTY(unsigned short, ArrayVoltage)
    DEFINE_PROPERTY(unsigned short, ArrayCurrent)
    DEFINE_PROPERTY(unsigned short, BatteryVoltage)
    DEFINE_PROPERTY(unsigned short, Temperature)
    
public:
    MpptPacket();
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;
};

#endif // MPPTPACKET_H