#include "MpptPacket.h"
#include "../../Config/JsonDefinitions.h"

namespace {
    const int STATUS_AND_CHANNEL_NUMBER_OFFSET = 1;
    const unsigned char CHANNEL_NUMBER_MASK = 0x03;
    const unsigned char MPPT_STATUS_MASK = 0x80;

    const int ARRAY_VOLTAGE_OFFSET = 2;
    const int ARRAY_CURRENT_OFFSET = 4;
    const int BATTERY_VOLTAGE_OFFSET = 6;
    const int TEMPERATURE_OFFSET = 8;
}

MpptPacket::MpptPacket() {
    setChannelNumber(0);
    setMpptStatus(0);

    setArrayVoltage(0);
    setArrayCurrent(0);
    setBatteryVoltage(0);
    setTemperature(0);
}

// void MpptPacket::populatePacket(const QByteArray& data) {
//     unsigned char statusAndChannelNumber = getValue<unsigned char>(data, STATUS_AND_CHANNEL_NUMBER_OFFSET);
//     setMpptStatus(statusAndChannelNumber & MPPT_STATUS_MASK);
//     setChannelNumber(statusAndChannelNumber & CHANNEL_NUMBER_MASK);

//     setArrayVoltage(getValue<unsigned short>(data, ARRAY_VOLTAGE_OFFSET));
//     setArrayCurrent(getValue<unsigned short>(data, ARRAY_CURRENT_OFFSET));
//     setBatteryVoltage(getValue<unsigned short>(data, BATTERY_VOLTAGE_OFFSET));
//     setTemperature(getValue<unsigned short>(data, TEMPERATURE_OFFSET));
// }

QJsonObject MpptPacket::toJson() {
    QJsonObject json;
    
    json[JsonDefinitions::CHANNEL_NUMBER] = ChannelNumber_;
    json[JsonDefinitions::IS_ALIVE] = MpptStatus_;
    json[JsonDefinitions::ARRAY_VOLTAGE] = ArrayVoltage_;
    json[JsonDefinitions::ARRAY_CURRENT] = ArrayCurrent_;
    json[JsonDefinitions::BATTERY_VOLTAGE] = BatteryVoltage_;
    json[JsonDefinitions::TEMPERATURE] = Temperature_;

    return json;
}
