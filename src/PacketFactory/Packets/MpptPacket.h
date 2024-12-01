#ifndef MPPTPACKET_H
#define MPPTPACKET_H

#include "../IPacket.h"

class MpptPacket : public IPacket {
public:
    MpptPacket();
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;

private:
    unsigned char channelNumber_;
    unsigned char mpptStatus_;

    unsigned short arrayVoltage_;
    unsigned short arrayCurrent_;
    unsigned short batteryVoltage_;
    unsigned short temperature_;
};

#endif // MPPTPACKET_H