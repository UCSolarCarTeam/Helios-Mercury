#ifndef KEYMOTOR_H
#define KEYMOTOR_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class KeyMotor : public IPacket {
    Q_OBJECT

    // Motor Drive Command
    DEFINE_PROPERTY(float, MotorVelocity)
    DEFINE_PROPERTY(float, MotorCurrent)

    // Motor Power Command
    DEFINE_PROPERTY(float, BusCurrentOut)

public:
    KeyMotor();
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;

protected:
    void initializeIdActionMap() override;
};

#endif // KEYMOTOR_H