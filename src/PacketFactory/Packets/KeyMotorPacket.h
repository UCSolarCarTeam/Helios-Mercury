#ifndef KEYMOTOR_H
#define KEYMOTOR_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class KeyMotorPacket : public IPacket {
    Q_OBJECT

    // Motor Drive Command
    DEFINE_PROPERTY(float, KeyMotorVelocity)
    DEFINE_PROPERTY(float, MotorCurrent)

    // Motor Power Command
    DEFINE_PROPERTY(float, BusCurrentOut)

public:
    KeyMotorPacket();
    QJsonObject toJson() override;

protected:
    void initializeIdActionMap() override;
};

#endif // KEYMOTOR_H