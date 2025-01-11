#include "ConnectionStatusPacket.h"
#include "../../Config/JsonDefinitions.h"

ConnectionStatusPacket::ConnectionStatusPacket() {
    setAWSState(false);
    setEmbeddedState(false);
}

void ConnectionStatusPacket::populatePacket(const QByteArray& data) {

}

QJsonObject ConnectionStatusPacket::toJson() {
    QJsonObject json;

    json[JsonDefinitions::AWS_STATUS] = AWSState_;
    json[JsonDefinitions::EMBEDDED_STATUS] = EmbeddedState_;

    return json;
}
