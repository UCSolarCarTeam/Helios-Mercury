#ifndef KEYMOTORPACKET_H
#define KEYMOTORPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class KeyMotorPacket : public IPacket {
    Q_OBJECT
    DEFINE_PROPERTY(unsigned short, MotorSetpoint)
    DEFINE_PROPERTY(bool, ControlMode)
    DEFINE_PROPERTY(bool, MotorMode)
    DEFINE_PROPERTY(bool, SoftwareEnable)
    DEFINE_PROPERTY(bool, DebugMode)
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