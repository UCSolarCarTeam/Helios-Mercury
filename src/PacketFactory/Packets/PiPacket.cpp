#include "PiPacket.h"
#include "../../Config/JsonDefinitions.h"

PiPacket::PiPacket() {
    setAWSState(false);
    setEmbeddedState(false);
    setRfid("Unscanned");
    setDriverName("Unknown");
}

void PiPacket::populateTelemetry(const bool state) {
    setAWSState(true);
}

void PiPacket::populateEmbedded(const bool state) {
    setEmbeddedState(true);
}

QJsonObject PiPacket::toJson() {
    QJsonObject json;

    json[JsonDefinitions::RFID] = RfidData().toLongLong();
    json[JsonDefinitions::TELEMETRY_CONNECTION] = AWSState();
    json[JsonDefinitions::EMBEDDED_CONNECTION] = EmbeddedState();
    json[JsonDefinitions::RFID] = Rfid_;

    return json;
}
