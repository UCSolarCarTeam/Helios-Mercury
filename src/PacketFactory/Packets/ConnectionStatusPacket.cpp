#include "ConnectionStatusPacket.h"
#include "../../Config/JsonDefinitions.h"
#include <QMqttClient>

ConnectionStatusPacket::ConnectionStatusPacket(MessageTransmitter* transmitter)
    : messageTransmitter_(transmitter) {
    setAWSState(false);
    setEmbeddedState(false);
}


void ConnectionStatusPacket::populatePacket(const QByteArray& data) {
    qDebug() << "Data size in populatePacket:" << data.size();
    if (messageTransmitter_) {
        qDebug() << "MessageTransmitter is valid.";
        setAWSState(true);
    } else {
        qDebug() << "MessageTransmitter is null.";
        setAWSState(false);
    }

    if (data.size() != 0) {
        setEmbeddedState(true);
        EmbeddedState_ = true;
    } else {
        setEmbeddedState(false);
        EmbeddedState_ = false;
    }
}


QJsonObject ConnectionStatusPacket::toJson() {
    QJsonObject json;
    json[JsonDefinitions::AWS_STATUS] = AWSState();
    json[JsonDefinitions::EMBEDDED_STATUS] = EmbeddedState();
    return json;
}
