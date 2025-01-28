#ifndef CONNECTIONSTATUSPACKET_H
#define CONNECTIONSTATUSPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"
#include "../../MessageTransmitter/MessageTransmitter.h"
#include "../../Receivers/SerialReceiver.h"

class ConnectionStatusPacket : public IPacket {
    Q_OBJECT
    DEFINE_PROPERTY(bool, EmbeddedState)
    DEFINE_PROPERTY(bool, AWSState)

public:
    ConnectionStatusPacket(MessageTransmitter* transmitter, SerialReceiver* receiver);
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;
    SerialReceiver* serialReceiver_ = nullptr;
    MessageTransmitter* messageTransmitter_ = nullptr;
};

#endif // CONNECTIONSTATUSPACKET_H
