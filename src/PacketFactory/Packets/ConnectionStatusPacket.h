#ifndef CONNECTIONSTATUSPACKET_H
#define CONNECTIONSTATUSPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class StatusPacket : public IPacket {
    Q_OBJECT
    DEFINE_PROPERTY(bool, EmbeddedState)
    DEFINE_PROPERTY(bool, AWSState)

public:
    StatusPacket();
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;
};

#endif // CONNECTIONSTATUSPACKET_H
