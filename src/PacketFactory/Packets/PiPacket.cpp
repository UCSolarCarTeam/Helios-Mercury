#include "PiPacket.h"
#include "../../Config/JsonDefinitions.h"

PiPacket::PiPacket() {
    setRfid("Unscanned");
    setDriverName("Unknown");
}

QJsonObject PiPacket::toJson() {
    QJsonObject json;

    json[JsonDefinitions::RFID] = Rfid_;

    return json;
}
