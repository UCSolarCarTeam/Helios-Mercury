#ifndef PROXIMITYSENSORSPACKET_H
#define PROXIMITYSENSORSPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class ProximitySensorsPacket : public IPacket {
    Q_OBJECT
    DEFINE_PROPERTY(unsigned short, ProximitySensor1)
    DEFINE_PROPERTY(unsigned short, ProximitySensor2)
    DEFINE_PROPERTY(unsigned short, ProximitySensor3)
    DEFINE_PROPERTY(unsigned short, ProximitySensor4)

public:
    ProximitySensorsPacket();
    QJsonObject toJson() override;

protected:
    void initializeIdActionMap() override;

};

#endif // PROXIMITYSENSORSPACKET_H
