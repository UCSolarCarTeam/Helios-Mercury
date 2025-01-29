#include "ConnectionStatusPacket.h"
#include "../../Config/JsonDefinitions.h"
#include <QMqttClient>

ConnectionStatusPacket::ConnectionStatusPacket(MessageTransmitter* transmitter)
    : messageTransmitter_(transmitter) {
    setAWSState(false);
    setEmbeddedState(false);
}


void ConnectionStatusPacket::populatePacket(const QByteArray& data) {
    if (messageTransmitter_) {
        setAWSState(true);
    } else {
        setAWSState(false);
    }
    // qDebug() << "MESSAGE TRANSMITTER: " << messageTransmitter_;
    // qDebug() << "IS CONNECTED: " << messageTransmitter_->isTelemetryConnected();

    if (data.size() != 0) {
        setEmbeddedState(true);
    } else {
        setEmbeddedState(false);
    }
}


QJsonObject ConnectionStatusPacket::toJson() {
    QJsonObject json;
    json[JsonDefinitions::AWS_STATUS] = AWSState();
    json[JsonDefinitions::EMBEDDED_STATUS] = EmbeddedState();
    return json;
}
