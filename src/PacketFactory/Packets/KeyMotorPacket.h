#ifndef KEYMOTORPACKET_H
#define KEYMOTORPACKET_H

#include "../IPacket.h"

class KeyMotorPacket : public IPacket {
public:
    KeyMotorPacket();
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;

private:
    unsigned short motorSetpoint_;
    bool controlMode_;
    bool motorMode_;
    bool softwareEnable_;
    bool debugMode_;
};

#endif // KEYMOTORPACKET_H