#include "MpptPacket.h"
#include "../../Config/JsonDefinitions.h"

MpptPacket::MpptPacket() {
    // MPPT 0 Channel 0
    setMppt0Ch0ArrayVoltage(0); 
    setMppt0Ch0ArrayCurrent(0); 
    setMppt0Ch0BatteryVoltage(0); 
    setMppt0Ch0UnitTemperature(0);

    // MPPT 0 Channel 1
    setMppt0Ch1ArrayVoltage(0); 
    setMppt0Ch1ArrayCurrent(0); 
    setMppt0Ch1BatteryVoltage(0); 
    setMppt0Ch1UnitTemperature(0);

    // MPPT 1 Channel 0
    setMppt1Ch0ArrayVoltage(0); 
    setMppt1Ch0ArrayCurrent(0); 
    setMppt1Ch0BatteryVoltage(0); 
    setMppt1Ch0UnitTemperature(0);

    // MPPT 1 Channel 1
    setMppt1Ch1ArrayVoltage(0); 
    setMppt1Ch1ArrayCurrent(0); 
    setMppt1Ch1BatteryVoltage(0); 
    setMppt1Ch1UnitTemperature(0);

    // MPPT 2 Channel 0
    setMppt2Ch0ArrayVoltage(0); s
    etMppt2Ch0ArrayCurrent(0); 
    setMppt2Ch0BatteryVoltage(0); 
    setMppt2Ch0UnitTemperature(0);

    // MPPT 2 Channel 1
    setMppt2Ch1ArrayVoltage(0); 
    setMppt2Ch1ArrayCurrent(0); 
    setMppt2Ch1BatteryVoltage(0); 
    setMppt2Ch1UnitTemperature(0);

    // MPPT 3 Channel 0
    setMppt3Ch0ArrayVoltage(0); 
    setMppt3Ch0ArrayCurrent(0); 
    setMppt3Ch0BatteryVoltage(0); 
    setMppt3Ch0UnitTemperature(0);

    // MPPT 3 Channel 1
    setMppt3Ch1ArrayVoltage(0); 
    setMppt3Ch1ArrayCurrent(0); 
    setMppt3Ch1BatteryVoltage(0); 
    setMppt3Ch1UnitTemperature(0);
    initializeIdActionMap();
}

QJsonObject MpptPacket::toJson() {
    QJsonObject json;

    // MPPT 0 Channel 0
    json["Mppt0Ch0ArrayVoltage"] = Mppt0Ch0ArrayVoltage_;
    json["Mppt0Ch0ArrayCurrent"] = Mppt0Ch0ArrayCurrent_;
    json["Mppt0Ch0BatteryVoltage"] = Mppt0Ch0BatteryVoltage_;
    json["Mppt0Ch0UnitTemperature"] = Mppt0Ch0UnitTemperature_;

    // MPPT 1 Channel 0
    json["Mppt0Ch1ArrayVoltage"] = Mppt0Ch1ArrayVoltage_;
    json["Mppt0Ch1ArrayCurrent"] = Mppt0Ch1ArrayCurrent_;
    json["Mppt0Ch1BatteryVoltage"] = Mppt0Ch1BatteryVoltage_;
    json["Mppt0Ch1UnitTemperature"] = Mppt0Ch1UnitTemperature_;

    // MPPT 2 Channel 0
    json["Mppt1Ch0ArrayVoltage"] = Mppt1Ch0ArrayVoltage_;
    json["Mppt1Ch0ArrayCurrent"] = Mppt1Ch0ArrayCurrent_;
    json["Mppt1Ch0BatteryVoltage"] = Mppt1Ch0BatteryVoltage_;
    json["Mppt1Ch0UnitTemperature"] = Mppt1Ch0UnitTemperature_;

    // MPPT 3 Channel 0
    json["Mppt1Ch1ArrayVoltage"] = Mppt1Ch1ArrayVoltage_;
    json["Mppt1Ch1ArrayCurrent"] = Mppt1Ch1ArrayCurrent_;
    json["Mppt1Ch1BatteryVoltage"] = Mppt1Ch1BatteryVoltage_;
    json["Mppt1Ch1UnitTemperature"] = Mppt1Ch1UnitTemperature_;

    // MPPT 0 Channel 1
    json["Mppt2Ch0ArrayVoltage"] = Mppt2Ch0ArrayVoltage_;
    json["Mppt2Ch0ArrayCurrent"] = Mppt2Ch0ArrayCurrent_;
    json["Mppt2Ch0BatteryVoltage"] = Mppt2Ch0BatteryVoltage_;
    json["Mppt2Ch0UnitTemperature"] = Mppt2Ch0UnitTemperature_;

    // MPPT 1 Channel 1
    json["Mppt2Ch1ArrayVoltage"] = Mppt2Ch1ArrayVoltage_;
    json["Mppt2Ch1ArrayCurrent"] = Mppt2Ch1ArrayCurrent_;
    json["Mppt2Ch1BatteryVoltage"] = Mppt2Ch1BatteryVoltage_;
    json["Mppt2Ch1UnitTemperature"] = Mppt2Ch1UnitTemperature_;

    // MPPT 2 Channel 1
    json["Mppt3Ch0ArrayVoltage"] = Mppt3Ch0ArrayVoltage_;
    json["Mppt3Ch0ArrayCurrent"] = Mppt3Ch0ArrayCurrent_;
    json["Mppt3Ch0BatteryVoltage"] = Mppt3Ch0BatteryVoltage_;
    json["Mppt3Ch0UnitTemperature"] = Mppt3Ch0UnitTemperature_;

    // MPPT 3 Channel 1
    json["Mppt3Ch1ArrayVoltage"] = Mppt3Ch1ArrayVoltage_;
    json["Mppt3Ch1ArrayCurrent"] = Mppt3Ch1ArrayCurrent_;
    json["Mppt3Ch1BatteryVoltage"] = Mppt3Ch1BatteryVoltage_;
    json["Mppt3Ch1UnitTemperature"] = Mppt3Ch1UnitTemperature_;

    return json;
}

void MpptPacket::initializeIdActionMap() {
    qDebug() << "Initializing MPPT Packet ID Action Map";

    // MPPT 0 Channel 0 - 0x600
    idActionMap[0x600] = [this](QByteArray payload) {
        unsigned short mppt0channel0 = getValue<unsigned short>(payload, 0);
        setMppt0Ch0ArrayVoltage((data >> 0)  & 0xFFFF);
        setMppt0Ch0ArrayCurrent((data >> 16) & 0xFFFF);
        setMppt0Ch0BatteryVoltage((data >> 32) & 0xFFFF);
        setMppt0Ch0UnitTemperature((data >> 48) & 0xFFFF)
    };
    
    // MPPT 1 Channel 0 - 0x601
    idActionMap[0x601] = [this](QByteArray payload) {
        unsigned short mppt0channel0 = getValue<unsigned short>(payload, 0);
        setMppt1Ch0ArrayVoltage((data >> 0)  & 0xFFFF);
        setMppt1Ch0ArrayCurrent((data >> 16) & 0xFFFF);
        setMppt1Ch0BatteryVoltage((data >> 32) & 0xFFFF);
        setMppt1Ch0UnitTemperature((data >> 48) & 0xFFFF)
    };

    // MPPT 2 Channel 0 - 0z602
    idActionMap[0x602] = [this](QByteArray payload) {
        unsigned short mppt0channel0 = getValue<unsigned short>(payload, 0);
        setMppt2Ch0ArrayVoltage((data >> 0)  & 0xFFFF);
        setMppt2Ch0ArrayCurrent((data >> 16) & 0xFFFF);
        setMppt2Ch0BatteryVoltage((data >> 32) & 0xFFFF);
        setMppt2Ch0UnitTemperature((data >> 48) & 0xFFFF)
    };

    // MPPT 3 Channel 0 - 0x603
    idActionMap[0x603] = [this](QByteArray payload) {
        unsigned short mppt0channel0 = getValue<unsigned short>(payload, 0);
        setMppt3Ch0ArrayVoltage((data >> 0)  & 0xFFFF);
        setMppt3Ch0ArrayCurrent((data >> 16) & 0xFFFF);
        setMppt3Ch0BatteryVoltage((data >> 32) & 0xFFFF);
        setMppt3Ch0UnitTemperature((data >> 48) & 0xFFFF)
    };

    // MPPT 0 Channel 1 - 0x604
    idActionMap[0x604] = [this](QByteArray payload) {
        unsigned short mppt0channel0 = getValue<unsigned short>(payload, 0);
        setMppt0Ch1ArrayVoltage((data >> 0)  & 0xFFFF);
        setMppt0Ch1ArrayCurrent((data >> 16) & 0xFFFF);
        setMppt0Ch1BatteryVoltage((data >> 32) & 0xFFFF);
        setMppt0Ch1UnitTemperature((data >> 48) & 0xFFFF)
    };

    // MPPT 1 Channel 1 - 0x605
    idActionMap[0x605] = [this](QByteArray payload) {
        unsigned short mppt0channel0 = getValue<unsigned short>(payload, 0);
        setMppt1Ch1ArrayVoltage((data >> 0)  & 0xFFFF);
        setMppt1Ch1ArrayCurrent((data >> 16) & 0xFFFF);
        setMppt1Ch1BatteryVoltage((data >> 32) & 0xFFFF);
        setMppt1Ch1UnitTemperature((data >> 48) & 0xFFFF)
    };

    // MPPT 2 Channel 1 - 0x606
    idActionMap[0x606] = [this](QByteArray payload) {
        unsigned short mppt0channel0 = getValue<unsigned short>(payload, 0);
        setMppt2Ch1ArrayVoltage((data >> 0)  & 0xFFFF);
        setMppt2Ch1ArrayCurrent((data >> 16) & 0xFFFF);
        setMppt2Ch1BatteryVoltage((data >> 32) & 0xFFFF);
        setMppt2Ch1UnitTemperature((data >> 48) & 0xFFFF)
    };

    // MPPT 3 Channel 1 - 0x607
    idActionMap[0x607] = [this](QByteArray payload) {
        unsigned short mppt0channel0 = getValue<unsigned short>(payload, 0);
        setMppt3Ch1ArrayVoltage((data >> 0)  & 0xFFFF);
        setMppt3Ch1ArrayCurrent((data >> 16) & 0xFFFF);
        setMppt3Ch1BatteryVoltage((data >> 32) & 0xFFFF);
        setMppt3Ch1UnitTemperature((data >> 48) & 0xFFFF)
    };
}
