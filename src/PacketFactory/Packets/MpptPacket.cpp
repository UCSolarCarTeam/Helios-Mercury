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
    // Initialize all properties to 0
    setChannel0ArrayVoltage(0);
    setChannel0ArrayCurrent(0);
    setChannel0BatteryVoltage(0);
    setChannel0Temperature(0);
    
    setChannel1ArrayVoltage(0);
    setChannel1ArrayCurrent(0);
    setChannel1BatteryVoltage(0);
    setChannel1Temperature(0);
    
    initializeIdActionMap();
}

void MpptPacket::populatePacket(const QByteArray& data) {
    // unsigned char statusAndChannelNumber = getValue<unsigned char>(data, STATUS_AND_CHANNEL_NUMBER_OFFSET);
    // setMpptStatus(statusAndChannelNumber & MPPT_STATUS_MASK);
    // setChannelNumber(statusAndChannelNumber & CHANNEL_NUMBER_MASK);

    // setArrayVoltage(getValue<unsigned short>(data, ARRAY_VOLTAGE_OFFSET));
    // setArrayCurrent(getValue<unsigned short>(data, ARRAY_CURRENT_OFFSET));
    // setBatteryVoltage(getValue<unsigned short>(data, BATTERY_VOLTAGE_OFFSET));
    // setTemperature(getValue<unsigned short>(data, TEMPERATURE_OFFSET));
}

QJsonObject MpptPacket::toJson() {
    QJsonObject json;
    
    QJsonObject channel0;
    channel0["ArrayVoltage"] = static_cast<qint64>(Channel0ArrayVoltage_);
    channel0["ArrayCurrent"] = static_cast<qint64>(Channel0ArrayCurrent_);
    channel0["BatteryVoltage"] = static_cast<qint64>(Channel0BatteryVoltage_);
    channel0["Temperature"] = static_cast<qint64>(Channel0Temperature_);
    
    QJsonObject channel1;
    channel1["ArrayVoltage"] = static_cast<qint64>(Channel1ArrayVoltage_);
    channel1["ArrayCurrent"] = static_cast<qint64>(Channel1ArrayCurrent_);
    channel1["BatteryVoltage"] = static_cast<qint64>(Channel1BatteryVoltage_);
    channel1["Temperature"] = static_cast<qint64>(Channel1Temperature_);
    
    json["channel0"] = channel0;
    json["channel1"] = channel1;
    
    return json;
}

void MpptPacket::initializeIdActionMap() {
    qDebug() << "Initializing MPPT Packet ID Action Map";
    
    // Channel 0 Messages (All MPPT units)
    idActionMap[0x600] = [this](QByteArray payload) {  // MPPT0 Channel0
        setChannel0ArrayVoltage(getValue<quint16>(payload, 0));
        setChannel0ArrayCurrent(getValue<quint16>(payload, 2));
        setChannel0BatteryVoltage(getValue<quint16>(payload, 4));
        setChannel0Temperature(getValue<quint16>(payload, 6));
    };
    
    idActionMap[0x602] = [this](QByteArray payload) {  // MPPT1 Channel0
        setChannel0ArrayVoltage(getValue<quint16>(payload, 0));
        setChannel0ArrayCurrent(getValue<quint16>(payload, 2));
        setChannel0BatteryVoltage(getValue<quint16>(payload, 4));
        setChannel0Temperature(getValue<quint16>(payload, 6));
    };
    
    idActionMap[0x604] = [this](QByteArray payload) {  // MPPT2 Channel0
        setChannel0ArrayVoltage(getValue<quint16>(payload, 0));
        setChannel0ArrayCurrent(getValue<quint16>(payload, 2));
        setChannel0BatteryVoltage(getValue<quint16>(payload, 4));
        setChannel0Temperature(getValue<quint16>(payload, 6));
    };
    
    idActionMap[0x606] = [this](QByteArray payload) {  // MPPT3 Channel0
        setChannel0ArrayVoltage(getValue<quint16>(payload, 0));
        setChannel0ArrayCurrent(getValue<quint16>(payload, 2));
        setChannel0BatteryVoltage(getValue<quint16>(payload, 4));
        setChannel0Temperature(getValue<quint16>(payload, 6));
    };
    
    // Channel 1 Messages (All MPPT units)
    idActionMap[0x601] = [this](QByteArray payload) {  // MPPT0 Channel1
        setChannel1ArrayVoltage(getValue<quint16>(payload, 0));
        setChannel1ArrayCurrent(getValue<quint16>(payload, 2));
        setChannel1BatteryVoltage(getValue<quint16>(payload, 4));
        setChannel1Temperature(getValue<quint16>(payload, 6));
    };
    
    idActionMap[0x603] = [this](QByteArray payload) {  // MPPT1 Channel1
        setChannel1ArrayVoltage(getValue<quint16>(payload, 0));
        setChannel1ArrayCurrent(getValue<quint16>(payload, 2));
        setChannel1BatteryVoltage(getValue<quint16>(payload, 4));
        setChannel1Temperature(getValue<quint16>(payload, 6));
    };
    
    idActionMap[0x605] = [this](QByteArray payload) {  // MPPT2 Channel1
        setChannel1ArrayVoltage(getValue<quint16>(payload, 0));
        setChannel1ArrayCurrent(getValue<quint16>(payload, 2));
        setChannel1BatteryVoltage(getValue<quint16>(payload, 4));
        setChannel1Temperature(getValue<quint16>(payload, 6));
    };
    
    idActionMap[0x607] = [this](QByteArray payload) {  // MPPT3 Channel1
        setChannel1ArrayVoltage(getValue<quint16>(payload, 0));
        setChannel1ArrayCurrent(getValue<quint16>(payload, 2));
        setChannel1BatteryVoltage(getValue<quint16>(payload, 4));
        setChannel1Temperature(getValue<quint16>(payload, 6));
    };
}
