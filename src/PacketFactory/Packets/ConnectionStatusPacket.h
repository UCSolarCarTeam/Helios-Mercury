#ifndef CONNECTIONSTATUSPACKET_H
#define CONNECTIONSTATUSPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"
#include "../../MessageTransmitter/MessageTransmitter.h"

class ConnectionStatusPacket : public IPacket {
    Q_OBJECT
    DEFINE_PROPERTY(bool, EmbeddedState)
    DEFINE_PROPERTY(bool, AWSState)

public:
    ConnectionStatusPacket(MessageTransmitter* transmitter);
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;
    MessageTransmitter* messageTransmitter_ = nullptr;
};

#endif // CONNECTIONSTATUSPACKET_H
