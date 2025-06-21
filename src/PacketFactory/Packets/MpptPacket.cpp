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
    setMppt2Ch0ArrayVoltage(0);
    setMppt2Ch0ArrayCurrent(0); 
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

void MpptPacket::populatePacket(const QByteArray& data) {
}

QJsonObject MpptPacket::toJson() {
    QJsonObject json;

    // MPPT 0 Channel 0
    json[JsonDefinitions::MPPT0_CH0_ARRAY_VOLTAGE] = Mppt0Ch0ArrayVoltage_;
    json[JsonDefinitions::MPPT0_CH0_ARRAY_CURRENT] = Mppt0Ch0ArrayCurrent_;
    json[JsonDefinitions::MPPT0_CH0_BATTERY_VOLTAGE] = Mppt0Ch0BatteryVoltage_;
    json[JsonDefinitions::MPPT0_CH0_UNIT_TEMPERATURE] = Mppt0Ch0UnitTemperature_;

    // MPPT 0 Channel 1
    json[JsonDefinitions::MPPT0_CH1_ARRAY_VOLTAGE] = Mppt0Ch1ArrayVoltage_;
    json[JsonDefinitions::MPPT0_CH1_ARRAY_CURRENT] = Mppt0Ch1ArrayCurrent_;
    json[JsonDefinitions::MPPT0_CH1_BATTERY_VOLTAGE] = Mppt0Ch1BatteryVoltage_;
    json[JsonDefinitions::MPPT0_CH1_UNIT_TEMPERATURE] = Mppt0Ch1UnitTemperature_;

    // MPPT 1 Channel 0
    json[JsonDefinitions::MPPT1_CH0_ARRAY_VOLTAGE] = Mppt1Ch0ArrayVoltage_;
    json[JsonDefinitions::MPPT1_CH0_ARRAY_CURRENT] = Mppt1Ch0ArrayCurrent_;
    json[JsonDefinitions::MPPT1_CH0_BATTERY_VOLTAGE] = Mppt1Ch0BatteryVoltage_;
    json[JsonDefinitions::MPPT1_CH0_UNIT_TEMPERATURE] = Mppt1Ch0UnitTemperature_;

    // MPPT 1 Channel 1
    json[JsonDefinitions::MPPT1_CH1_ARRAY_VOLTAGE] = Mppt1Ch1ArrayVoltage_;
    json[JsonDefinitions::MPPT1_CH1_ARRAY_CURRENT] = Mppt1Ch1ArrayCurrent_;
    json[JsonDefinitions::MPPT1_CH1_BATTERY_VOLTAGE] = Mppt1Ch1BatteryVoltage_;
    json[JsonDefinitions::MPPT1_CH1_UNIT_TEMPERATURE] = Mppt1Ch1UnitTemperature_;

    // MPPT 2 Channel 0
    json[JsonDefinitions::MPPT2_CH0_ARRAY_VOLTAGE] = Mppt2Ch0ArrayVoltage_;
    json[JsonDefinitions::MPPT2_CH0_ARRAY_CURRENT] = Mppt2Ch0ArrayCurrent_;
    json[JsonDefinitions::MPPT2_CH0_BATTERY_VOLTAGE] = Mppt2Ch0BatteryVoltage_;
    json[JsonDefinitions::MPPT2_CH0_UNIT_TEMPERATURE] = Mppt2Ch0UnitTemperature_;

    // MPPT 2 Channel 1
    json[JsonDefinitions::MPPT2_CH1_ARRAY_VOLTAGE] = Mppt2Ch1ArrayVoltage_;
    json[JsonDefinitions::MPPT2_CH1_ARRAY_CURRENT] = Mppt2Ch1ArrayCurrent_;
    json[JsonDefinitions::MPPT2_CH1_BATTERY_VOLTAGE] = Mppt2Ch1BatteryVoltage_;
    json[JsonDefinitions::MPPT2_CH1_UNIT_TEMPERATURE] = Mppt2Ch1UnitTemperature_;

    // MPPT 3 Channel 0
    json[JsonDefinitions::MPPT3_CH0_ARRAY_VOLTAGE] = Mppt3Ch0ArrayVoltage_;
    json[JsonDefinitions::MPPT3_CH0_ARRAY_CURRENT] = Mppt3Ch0ArrayCurrent_;
    json[JsonDefinitions::MPPT3_CH0_BATTERY_VOLTAGE] = Mppt3Ch0BatteryVoltage_;
    json[JsonDefinitions::MPPT3_CH0_UNIT_TEMPERATURE] = Mppt3Ch0UnitTemperature_;

    // MPPT 3 Channel 1
    json[JsonDefinitions::MPPT3_CH1_ARRAY_VOLTAGE] = Mppt3Ch1ArrayVoltage_;
    json[JsonDefinitions::MPPT3_CH1_ARRAY_CURRENT] = Mppt3Ch1ArrayCurrent_;
    json[JsonDefinitions::MPPT3_CH1_BATTERY_VOLTAGE] = Mppt3Ch1BatteryVoltage_;
    json[JsonDefinitions::MPPT3_CH1_UNIT_TEMPERATURE] = Mppt3Ch1UnitTemperature_;

    return json;
}

void MpptPacket::initializeIdActionMap() {
    qDebug() << "Initializing MPPT Packet ID Action Map";

    // MPPT 0 Channel 0 - 0x600
    idActionMap[0x600] = [this](QByteArray payload) {
        setMppt0Ch0ArrayVoltage(getValue<unsigned short>(payload, 0)); // 10mV
        setMppt0Ch0ArrayCurrent(getValue<unsigned short>(payload, 2)); // 1mA
        setMppt0Ch0BatteryVoltage(getValue<unsigned short>(payload, 4)); // 10mV
        setMppt0Ch0UnitTemperature(getValue<unsigned short>(payload, 6)); // 10mC
    };

    // MPPT 0 Channel 1 - 0x601
    idActionMap[0x601] = [this](QByteArray payload) {
        setMppt0Ch1ArrayVoltage(getValue<unsigned short>(payload, 0)); // 10mV
        setMppt0Ch1ArrayCurrent(getValue<unsigned short>(payload, 2)); // 1mA
        setMppt0Ch1BatteryVoltage(getValue<unsigned short>(payload, 4)); // 10mV
        setMppt0Ch1UnitTemperature(getValue<unsigned short>(payload, 6)); // 10mC
    };

    // MPPT 1 Channel 0 - 0x602
    idActionMap[0x602] = [this](QByteArray payload) {
        setMppt1Ch0ArrayVoltage(getValue<unsigned short>(payload, 0)); // 10mV
        setMppt1Ch0ArrayCurrent(getValue<unsigned short>(payload, 2)); // 1mA
        setMppt1Ch0BatteryVoltage(getValue<unsigned short>(payload, 4)); // 10mV
        setMppt1Ch0UnitTemperature(getValue<unsigned short>(payload, 6)); // 10mC
    };

    // MPPT 1 Channel 1 - 0x603
    idActionMap[0x603] = [this](QByteArray payload) {
        setMppt1Ch1ArrayVoltage(getValue<unsigned short>(payload, 0)); // 10mV
        setMppt1Ch1ArrayCurrent(getValue<unsigned short>(payload, 2)); // 1mA
        setMppt1Ch1BatteryVoltage(getValue<unsigned short>(payload, 4)); // 10mV
        setMppt1Ch1UnitTemperature(getValue<unsigned short>(payload, 6)); // 10mC
    };

    // MPPT 2 Channel 0 - 0x604
    idActionMap[0x604] = [this](QByteArray payload) {
        setMppt2Ch0ArrayVoltage(getValue<unsigned short>(payload, 0)); // 10mV
        setMppt2Ch0ArrayCurrent(getValue<unsigned short>(payload, 2)); // 1mA
        setMppt2Ch0BatteryVoltage(getValue<unsigned short>(payload, 4)); // 10mV
        setMppt2Ch0UnitTemperature(getValue<unsigned short>(payload, 6)); // 10mC
    };

    // MPPT 2 Channel 1 - 0x605
    idActionMap[0x605] = [this](QByteArray payload) {
        setMppt2Ch1ArrayVoltage(getValue<unsigned short>(payload, 0)); // 10mV
        setMppt2Ch1ArrayCurrent(getValue<unsigned short>(payload, 2)); // 1mA
        setMppt2Ch1BatteryVoltage(getValue<unsigned short>(payload, 4)); // 10mV
        setMppt2Ch1UnitTemperature(getValue<unsigned short>(payload, 6)); // 10mC
    };

    // MPPT 3 Channel 0 - 0x606
    idActionMap[0x606] = [this](QByteArray payload) {
        setMppt3Ch0ArrayVoltage(getValue<unsigned short>(payload, 0)); // 10mV
        setMppt3Ch0ArrayCurrent(getValue<unsigned short>(payload, 2)); // 1mA
        setMppt3Ch0BatteryVoltage(getValue<unsigned short>(payload, 4)); // 10mV
        setMppt3Ch0UnitTemperature(getValue<unsigned short>(payload, 6)); // 10mC
    };

    // MPPT 3 Channel 1 - 0x607
    idActionMap[0x607] = [this](QByteArray payload) {
        setMppt3Ch1ArrayVoltage(getValue<unsigned short>(payload, 0)); // 10mV
        setMppt3Ch1ArrayCurrent(getValue<unsigned short>(payload, 2)); // 1mA
        setMppt3Ch1BatteryVoltage(getValue<unsigned short>(payload, 4)); // 10mV
        setMppt3Ch1UnitTemperature(getValue<unsigned short>(payload, 6)); // 10mC
    };
}
