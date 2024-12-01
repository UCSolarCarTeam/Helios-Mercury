#ifndef PROXIMITYSENSORSPACKET_H
#define PROXIMITYSENSORSPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"
#include <QObject>

class ProximitySensorsPacket : public QObject, public IPacket {
    Q_OBJECT
    DEFINE_PROPERTY(unsigned short, ProximitySensor1)
    DEFINE_PROPERTY(unsigned short, ProximitySensor2)
    DEFINE_PROPERTY(unsigned short, ProximitySensor3)
    DEFINE_PROPERTY(unsigned short, ProximitySensor4)

public:
    ProximitySensorsPacket();
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;
};

#endif // PROXIMITYSENSORSPACKET_H
