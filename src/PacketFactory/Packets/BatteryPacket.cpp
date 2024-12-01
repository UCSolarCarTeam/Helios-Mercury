#include "BatteryPacket.h"
#include "../../Config/JsonDefinitions.h"

namespace {
    const int BMU_ALIVE_OFFSET = 1;

    const int BMS_RELAY_STATUS_OFFSET = 2;
    const unsigned char DISCHARGE_RELAY_ENABLED_MASK = 0x01;
    const unsigned char CHARGE_RELAY_ENABLED_MASK = 0x02;
    const unsigned char CHARGER_SAFETY_RELAY_ENABLED_MASK = 0x04;
    const unsigned char MALFUNCTION_INDICATOR_ACTIVE_MASK = 0x08;
    const unsigned char MULTI_PURPOSE_INPUT_SIGNAL_STATUS_MASK = 0x10;
    const unsigned char ALWAYS_ON_SIGNAL_STATUS_MASK = 0x20;
    const unsigned char IS_READY_SIGNAL_STATUS_MASK = 0x40;
    const unsigned char IS_CHARGING_SIGNAL_STATUS_MASK = 0x80;

    const int POPULATED_CELLS_OFFSET = 3;
    const int INPUT_12V_OFFSET = 4;
    const int FAN_VOLTAGE_OFFSET = 8;
    const int PACK_CURRENT_OFFSET = 12;
    const int PACK_VOLTAGE_OFFSET = 16;
    const int PACK_STATE_OF_CHARGE_OFFSET = 20;
    const int PACK_AMPHOURS_OFFSET = 24;
    const int PACK_DEPTH_OF_DISCHARGE_OFFSET = 28;
    const int HIGH_TEMPERATURE_OFFSET = 32;
    const int HIGH_THERMISTOR_ID_OFFSET = 33;
    const int LOW_TEMPERATURE_OFFSET = 34;
    const int LOW_THERMISTOR_ID_OFFSET = 35;
    const int AVERAGE_TEMPERATURE_OFFSET = 36;
    const int INTERNAL_TEMPERATURE_OFFSET = 37;
    const int FAN_SPEED_OFFSET = 38;
    const int REQUESTED_FAN_SPEED_OFFSET = 39;
    const int LOW_CELL_VOLTAGE_OFFSET = 40;
    const int LOW_CELL_VOLTAGE_ID_OFFSET = 42;
    const int HIGH_CELL_VOLTAGE_OFFSET = 43;
    const int HIGH_CELL_VOLTAGE_ID_OFFSET = 45;
    const int AVERAGE_CELL_VOLTAGE_OFFSET = 46;   
}

BatteryPacket::BatteryPacket() {
    bmuAlive_ = false;

    dischargeRelayEnabled_ = false;
    chargeRelayEnabled_ = false;
    chargerSafetyRelayEnabled_ = false;
    malfunctionIndicatorActive_ = false;
    multiPurposeInputSignalStatus_ = false;
    alwaysOnSignalStatus_ = false;
    isReadySignalStatus_ = false;
    isChargingSignalStatus_ = false;

    populatedCells_ = 0;
    input12V_ = 0;
    fanVoltage_ = 0;
    packCurrent_ = 0;
    packVoltage_ = 0;
    packStateOfCharge_ = 0;
    packAmphours_ = 0;
    packDepthOfDischarge_ = 0;
    highTemperature_ = 0;
    highThermistorId_ = 0;
    lowTemperature_ = 0;
    lowThermistorId_ = 0;
    averageTemperature_ = 0;
    internalTemperature_ = 0;
    fanSpeed_ = 0;
    requestedFanSpeed_ = 0;
    lowCellVoltage_ = 0;
    lowCellVoltageId_ = 0;
    highCellVoltage_ = 0;
    highCellVoltageId_ = 0;
    averageCellVoltage_ = 0;
}

void BatteryPacket::populatePacket(const QByteArray& data) {
    bmuAlive_ = getValue<unsigned char>(data, BMU_ALIVE_OFFSET);

    unsigned char bmsRelayStatus = getValue<unsigned char>(data, BMS_RELAY_STATUS_OFFSET);
    dischargeRelayEnabled_ = bmsRelayStatus & DISCHARGE_RELAY_ENABLED_MASK;
    chargeRelayEnabled_ = bmsRelayStatus & CHARGE_RELAY_ENABLED_MASK;
    chargerSafetyRelayEnabled_ = bmsRelayStatus & CHARGER_SAFETY_RELAY_ENABLED_MASK;
    malfunctionIndicatorActive_ = bmsRelayStatus & MALFUNCTION_INDICATOR_ACTIVE_MASK;
    multiPurposeInputSignalStatus_ = bmsRelayStatus & MULTI_PURPOSE_INPUT_SIGNAL_STATUS_MASK;
    alwaysOnSignalStatus_ = bmsRelayStatus & ALWAYS_ON_SIGNAL_STATUS_MASK;
    isReadySignalStatus_ = bmsRelayStatus & IS_READY_SIGNAL_STATUS_MASK;
    isChargingSignalStatus_ = bmsRelayStatus & IS_CHARGING_SIGNAL_STATUS_MASK;

    populatedCells_ = getValue<unsigned char>(data, POPULATED_CELLS_OFFSET);
    input12V_ = getValue<float>(data, INPUT_12V_OFFSET);
    fanVoltage_ = getValue<float>(data, FAN_VOLTAGE_OFFSET);
    packCurrent_ = getValue<float>(data, PACK_CURRENT_OFFSET);
    packVoltage_ = getValue<float>(data, PACK_VOLTAGE_OFFSET);
    packStateOfCharge_ = getValue<float>(data, PACK_STATE_OF_CHARGE_OFFSET);
    packAmphours_ = getValue<float>(data, PACK_AMPHOURS_OFFSET);
    packDepthOfDischarge_ = getValue<float>(data, PACK_DEPTH_OF_DISCHARGE_OFFSET);
    highTemperature_ = getValue<unsigned char>(data, HIGH_TEMPERATURE_OFFSET);
    highThermistorId_ = getValue<unsigned char>(data, HIGH_THERMISTOR_ID_OFFSET);
    lowTemperature_ = getValue<unsigned char>(data, LOW_TEMPERATURE_OFFSET);
    lowThermistorId_ = getValue<unsigned char>(data, LOW_THERMISTOR_ID_OFFSET);
    averageTemperature_ = getValue<unsigned char>(data, AVERAGE_TEMPERATURE_OFFSET);
    internalTemperature_ = getValue<unsigned char>(data, INTERNAL_TEMPERATURE_OFFSET);
    fanSpeed_ = getValue<unsigned char>(data, FAN_SPEED_OFFSET);
    requestedFanSpeed_ = getValue<unsigned char>(data, REQUESTED_FAN_SPEED_OFFSET);

    lowCellVoltage_ = getValue<unsigned short>(data, LOW_CELL_VOLTAGE_OFFSET);
    lowCellVoltageId_ = getValue<unsigned char>(data, LOW_CELL_VOLTAGE_ID_OFFSET);
    highCellVoltage_ = getValue<unsigned short>(data, HIGH_CELL_VOLTAGE_OFFSET);
    highCellVoltageId_ = getValue<unsigned char>(data, HIGH_CELL_VOLTAGE_ID_OFFSET);
    averageCellVoltage_ = getValue<unsigned short>(data, AVERAGE_CELL_VOLTAGE_OFFSET);
}

QJsonObject BatteryPacket::toJson() {
    QJsonObject json;

    json[JsonDefinitions::BMU_ALIVE] = bmuAlive_;

    json[JsonDefinitions::DISCHARGE_RELAY_ENABLED] = dischargeRelayEnabled_;
    json[JsonDefinitions::CHARGE_RELAY_ENABLED] = chargeRelayEnabled_;
    json[JsonDefinitions::CHARGER_SAFETY_ENABLED] = chargerSafetyRelayEnabled_;
    json[JsonDefinitions::MALFUNCTION_INDICATOR_ACTIVE] = malfunctionIndicatorActive_;
    json[JsonDefinitions::MULTI_PURPOSE_INPUT_SIGNAL_STATUS] = multiPurposeInputSignalStatus_;
    json[JsonDefinitions::ALWAYS_ON_SIGNAL_STATUS] = alwaysOnSignalStatus_;
    json[JsonDefinitions::IS_READY_SIGNAL_STATUS] = isReadySignalStatus_;
    json[JsonDefinitions::IS_CHARGING_SIGNAL_STATUS] = isChargingSignalStatus_;

    json[JsonDefinitions::POPULATED_CELLS] = populatedCells_;
    json[JsonDefinitions::INPUT_12V] = input12V_;
    json[JsonDefinitions::FAN_VOLTAGE] = fanVoltage_;
    json[JsonDefinitions::PACK_CURRENT] = packCurrent_;
    json[JsonDefinitions::PACK_VOLTAGE] = packVoltage_;
    json[JsonDefinitions::PACK_STATE_OF_CHARGE] = packStateOfCharge_;
    json[JsonDefinitions::PACK_AMPHOURS] = packAmphours_;
    json[JsonDefinitions::PACK_DEPTH_OF_DISCHARGE] = packDepthOfDischarge_;
    json[JsonDefinitions::HIGH_TEMPERATURE] = highTemperature_;
    json[JsonDefinitions::HIGH_THERMISTOR_ID] = highThermistorId_;
    json[JsonDefinitions::LOW_TEMPERATURE] = lowTemperature_;
    json[JsonDefinitions::LOW_THERMISTOR_ID] = lowThermistorId_;
    json[JsonDefinitions::AVERAGE_TEMPERATURE] = averageTemperature_;
    json[JsonDefinitions::INTERNAL_TEMPERATURE] = internalTemperature_;
    json[JsonDefinitions::FAN_SPEED] = fanSpeed_;
    json[JsonDefinitions::REQUESTED_FAN_SPEED] = requestedFanSpeed_;

    json[JsonDefinitions::LOW_CELL_VOLTAGE] = lowCellVoltage_;
    json[JsonDefinitions::LOW_CELL_VOLTAGE_ID] = lowCellVoltageId_;
    json[JsonDefinitions::HIGH_CELL_VOLTAGE] = highCellVoltage_;
    json[JsonDefinitions::HIGH_CELL_VOLTAGE_ID] = highCellVoltageId_;
    json[JsonDefinitions::AVERAGE_CELL_VOLTAGE] = averageCellVoltage_;

    return json;
}