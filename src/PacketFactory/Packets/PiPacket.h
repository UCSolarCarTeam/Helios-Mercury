#ifndef PIPACKET_H
#define PIPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"
#include "../../MessageTransmitter/MessageTransmitter.h"
#include <QByteArray>

class PiPacket : public IPacket {
    Q_OBJECT
    DEFINE_PROPERTY(QByteArray, RfidData)
    DEFINE_PROPERTY(bool, EmbeddedState)
    DEFINE_PROPERTY(bool, AWSState)

public:
    PiPacket(MessageTransmitter* transmitter);
    void populatePacket(const QByteArray& data) override;
    void populateRfid(const QByteArray& data);
    void populateTelemetry(const bool state);
    void populateEmbedded(const bool state);
    QJsonObject toJson() override;
    MessageTransmitter* messageTransmitter_ = nullptr;
};

#endif // PIPACKET_H
