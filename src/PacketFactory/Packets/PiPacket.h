#ifndef PIPACKET_H
#define PIPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"
#include <QByteArray>

class PiPacket : public IPacket {
    Q_OBJECT
    DEFINE_PROPERTY(QByteArray, RfidData)

public:
    PiPacket();
    void populatePacket(const QByteArray& data) override;
    void populateRfid(const QByteArray& data);
    QJsonObject toJson() override;
};

#endif // PIPACKET_H
