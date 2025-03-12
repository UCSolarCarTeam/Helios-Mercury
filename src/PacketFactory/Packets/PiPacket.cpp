#include "PiPacket.h"
#include "../../Config/JsonDefinitions.h"
#include <QDebug>

PiPacket::PiPacket() {
    setRfidData(QByteArray());
    setAWSState(false);
    setEmbeddedState(false);
}

void PiPacket::populatePacket(const QByteArray& data) {
}

void PiPacket::populateRfid(const QByteArray& data) {
    if(!data.isEmpty() && data.toLongLong() != 0) {
        setRfidData(data);
    }
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

    return json;
}
