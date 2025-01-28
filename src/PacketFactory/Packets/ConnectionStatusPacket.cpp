#include "ConnectionStatusPacket.h"
#include "../../Config/JsonDefinitions.h"
#include <QMqttClient>

ConnectionStatusPacket::ConnectionStatusPacket(MessageTransmitter* transmitter, SerialReceiver* receiver)
    : messageTransmitter_(transmitter), serialReceiver_(receiver) {
    setAWSState(false);
    setEmbeddedState(false);
}


void ConnectionStatusPacket::populatePacket(const QByteArray& data) {
    Q_UNUSED(data);

    if (messageTransmitter_) {
        qDebug() << "MessageTransmitter is valid.";
        setAWSState(true);
    } else {
        qDebug() << "MessageTransmitter is null.";
        setAWSState(false);
    }

    if (serialReceiver_) {
        qDebug() << "SerialReceiver is valid and port is open.";
        setEmbeddedState(true);
    } else {
        qDebug() << "SerialReceiver is null or port is not open.";
        setEmbeddedState(false);
    }
}


QJsonObject ConnectionStatusPacket::toJson() {
    QJsonObject json;
    json[JsonDefinitions::AWS_STATUS] = AWSState_;
    json[JsonDefinitions::EMBEDDED_STATUS] = EmbeddedState_;
    return json;
}
