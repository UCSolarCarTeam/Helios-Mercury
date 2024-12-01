#include "MpptPacket.h"
#include "../../Config/JsonDefinitions.h"

namespace {
    const int STATUS_AND_CHANNEL_NUMBER_OFFSET = 1;
    const unsigned char CHANNEL_NUMBER_MASK = 0x03;
    const unsigned char MPPT_STATUS_MASK = 0x80;

    const int ARRAY_VOLTAGE_OFFSET = 3;
    const int ARRAY_CURRENT_OFFSET = 5;
    const int BATTERY_VOLTAGE_OFFSET = 7;
    const int TEMPERATURE_OFFSET = 9;

    const int CENTI_TO_ONES = 100;
    const int MILLI_TO_ONES = 1000;
}

MpptPacket::MpptPacket() {
    channelNumber_ = 0;
    mpptStatus_ = 0;

    arrayVoltage_ = 0;
    arrayCurrent_ = 0;
    batteryVoltage_ = 0;
    temperature_ = 0;
}

void MpptPacket::populatePacket(const QByteArray& data) {
    unsigned char statusAndChannelNumber = getValue<unsigned char>(data, STATUS_AND_CHANNEL_NUMBER_OFFSET);
    mpptStatus_ = statusAndChannelNumber & MPPT_STATUS_MASK;
    channelNumber_ = (statusAndChannelNumber & CHANNEL_NUMBER_MASK) >> 7;

    arrayVoltage_ = getValue<unsigned short>(data, ARRAY_VOLTAGE_OFFSET) / CENTI_TO_ONES;
    arrayCurrent_ = getValue<unsigned short>(data, ARRAY_CURRENT_OFFSET) / MILLI_TO_ONES;
    batteryVoltage_ = getValue<unsigned short>(data, BATTERY_VOLTAGE_OFFSET) / CENTI_TO_ONES;
    temperature_ = getValue<unsigned short>(data, TEMPERATURE_OFFSET) / CENTI_TO_ONES;
}

QJsonObject MpptPacket::toJson() {
    QJsonObject json;
    
    json[JsonDefinitions::CHANNEL_NUMBER] = channelNumber_;
    json[JsonDefinitions::IS_ALIVE] = mpptStatus_;
    json[JsonDefinitions::ARRAY_VOLTAGE] = arrayVoltage_;
    json[JsonDefinitions::ARRAY_CURRENT] = arrayCurrent_;
    json[JsonDefinitions::BATTERY_VOLTAGE] = batteryVoltage_;
    json[JsonDefinitions::TEMPERATURE] = temperature_;

    return json;
}