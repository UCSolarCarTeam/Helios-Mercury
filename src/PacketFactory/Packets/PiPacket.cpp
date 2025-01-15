#include "PiPacket.h"
#include "../../Config/JsonDefinitions.h"
#include <QDebug>

PiPacket::PiPacket() {
    wiegandData_ = 0;
}

void PiPacket::populatePacket(const QByteArray& data) {
    if(!data.isEmpty() && data.toLongLong() != 0) {
        wiegandData_ = data;  // Use the setter to store Wiegand data
    }
}

QJsonObject PiPacket::toJson() {
    QJsonObject json;

    json[JsonDefinitions::RFID] = getDataAsLongLong();

    return json;
}

QByteArray PiPacket::getData() const {
    return wiegandData_;
}

qlonglong PiPacket::getDataAsLongLong() const {
    return wiegandData_.toLongLong();
}
