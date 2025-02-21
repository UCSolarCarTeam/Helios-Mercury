#include "PiPacket.h"
#include "../../Config/JsonDefinitions.h"
#include <QDebug>

PiPacket::PiPacket() {
    setRfidData(QByteArray());
}

void PiPacket::populatePacket(const QByteArray& data) {
}

void PiPacket::populateRfid(const QByteArray& data) {
    if(!data.isEmpty() && data.toLongLong() != 0) {
        setRfidData(data);
    }
}

QJsonObject PiPacket::toJson() {
    QJsonObject json;

    json[JsonDefinitions::RFID] = RfidData().toLongLong();

    return json;
}
