#include "PiPacket.h"
#include "../../Config/JsonDefinitions.h"

PiPacket::PiPacket() {
    setRfid(NULL);
    setDriverName("Unknown");
    setLatency(-69);
    setIsCanConnected(false);
}

QJsonObject PiPacket::toJson() {
    QJsonObject json;

    json[JsonDefinitions::RFID] = Rfid_;

    return json;
}
