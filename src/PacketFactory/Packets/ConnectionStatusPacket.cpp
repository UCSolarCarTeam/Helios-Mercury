#include "ConnectionStatusPacket.h"
#include "../../Config/JsonDefinitions.h"
#include "../../MessageTransmitter/MessageTransmitter.h"
#include <QMqttClient>

ConnectionStatusPacket::ConnectionStatusPacket() {
    setAWSState(false);
    setEmbeddedState(false);
}

void ConnectionStatusPacket::populatePacket(const QByteArray& data) {
    Q_UNUSED(data);

    // Access MessageTransmitter's MQTT client state
    MessageTransmitter messageTransmitter;
    setAWSState(messageTransmitter.getTelemetryClient()->state() == QMqttClient::Connected);


    // Example: Update EmbeddedState (requires SerialReceiver integration)
    // SerialReceiver& serialReceiver = SerialReceiver::instance(); // Assuming singleton pattern
    // setEmbeddedState(serialReceiver.isEmbeddedActive());
}

QJsonObject ConnectionStatusPacket::toJson() {
    QJsonObject json;
    json[JsonDefinitions::AWS_STATUS] = AWSState_;
    json[JsonDefinitions::EMBEDDED_STATUS] = EmbeddedState_;
    return json;
}
