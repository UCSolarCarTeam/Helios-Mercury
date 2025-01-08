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
    setBmuAlive(false);

    setDischargeRelayEnabled(false);
    setChargeRelayEnabled(false);
    setChargerSafetyRelayEnabled(false);
    setMalfunctionIndicatorActive(false);
    setMultiPurposeInputSignalStatus(false);
    setAlwaysOnSignalStatus(false);
    setIsReadySignalStatus(false);
    setIsChargingSignalStatus(false);

    setPopulatedCells(0);
    setInput12V(0);
    setFanVoltage(0);
    setPackCurrent(0);
    setPackVoltage(0);
    setPackStateOfCharge(0);
    setPackAmphours(0);
    setPackDepthOfDischarge(0);
    setHighTemperature(0);
    setHighThermistorId(0);
    setLowTemperature(0);
    setLowThermistorId(0);
    setAverageTemperature(0);
    setInternalTemperature(0);
    setFanSpeed(0);
    setRequestedFanSpeed(0);
    setLowCellVoltage(0);
    setLowCellVoltageId(0);
    setHighCellVoltage(0);
    setHighCellVoltageId(0);
    setAverageCellVoltage(0);
}

void BatteryPacket::populatePacket(const QByteArray& data) {
    setBmuAlive(getValue<unsigned char>(data, BMU_ALIVE_OFFSET));

    unsigned char bmsRelayStatus = getValue<unsigned char>(data, BMS_RELAY_STATUS_OFFSET);
    setDischargeRelayEnabled(bmsRelayStatus & DISCHARGE_RELAY_ENABLED_MASK);
    setChargeRelayEnabled(bmsRelayStatus & CHARGE_RELAY_ENABLED_MASK);
    setChargerSafetyRelayEnabled(bmsRelayStatus & CHARGER_SAFETY_RELAY_ENABLED_MASK);
    setMalfunctionIndicatorActive(bmsRelayStatus & MALFUNCTION_INDICATOR_ACTIVE_MASK);
    setMultiPurposeInputSignalStatus(bmsRelayStatus & MULTI_PURPOSE_INPUT_SIGNAL_STATUS_MASK);
    setAlwaysOnSignalStatus(bmsRelayStatus & ALWAYS_ON_SIGNAL_STATUS_MASK);
    setIsReadySignalStatus(bmsRelayStatus & IS_READY_SIGNAL_STATUS_MASK);
    setIsChargingSignalStatus(bmsRelayStatus & IS_CHARGING_SIGNAL_STATUS_MASK);

    setPopulatedCells(getValue<unsigned char>(data, POPULATED_CELLS_OFFSET));
    setInput12V(getValue<float>(data, INPUT_12V_OFFSET));
    setFanVoltage(getValue<float>(data, FAN_VOLTAGE_OFFSET));
    setPackCurrent(getValue<float>(data, PACK_CURRENT_OFFSET));
    setPackVoltage(getValue<float>(data, PACK_VOLTAGE_OFFSET));
    setPackStateOfCharge(getValue<float>(data, PACK_STATE_OF_CHARGE_OFFSET));
    setPackAmphours(getValue<float>(data, PACK_AMPHOURS_OFFSET));
    setPackDepthOfDischarge(getValue<float>(data, PACK_DEPTH_OF_DISCHARGE_OFFSET));
    setHighTemperature(getValue<unsigned char>(data, HIGH_TEMPERATURE_OFFSET));
    setHighThermistorId(getValue<unsigned char>(data, HIGH_THERMISTOR_ID_OFFSET));
    setLowTemperature(getValue<unsigned char>(data, LOW_TEMPERATURE_OFFSET));
    setLowThermistorId(getValue<unsigned char>(data, LOW_THERMISTOR_ID_OFFSET));
    setAverageTemperature(getValue<unsigned char>(data, AVERAGE_TEMPERATURE_OFFSET));
    setInternalTemperature(getValue<unsigned char>(data, INTERNAL_TEMPERATURE_OFFSET));
    setFanSpeed(getValue<unsigned char>(data, FAN_SPEED_OFFSET));
    setRequestedFanSpeed(getValue<unsigned char>(data, REQUESTED_FAN_SPEED_OFFSET));

    setLowCellVoltage(getValue<unsigned short>(data, LOW_CELL_VOLTAGE_OFFSET));
    setLowCellVoltageId(getValue<unsigned char>(data, LOW_CELL_VOLTAGE_ID_OFFSET));
    setHighCellVoltage(getValue<unsigned short>(data, HIGH_CELL_VOLTAGE_OFFSET));
    setHighCellVoltageId(getValue<unsigned char>(data, HIGH_CELL_VOLTAGE_ID_OFFSET));
    setAverageCellVoltage(getValue<unsigned short>(data, AVERAGE_CELL_VOLTAGE_OFFSET));
}

QJsonObject BatteryPacket::toJson() {
    QJsonObject json;

    json[JsonDefinitions::BMU_ALIVE] = BmuAlive_; 
    json[JsonDefinitions::DISCHARGE_RELAY_ENABLED] = DischargeRelayEnabled_;
    json[JsonDefinitions::CHARGE_RELAY_ENABLED] = ChargeRelayEnabled_;
    json[JsonDefinitions::CHARGER_SAFETY_ENABLED] = ChargerSafetyRelayEnabled_;
    json[JsonDefinitions::MALFUNCTION_INDICATOR_ACTIVE] = MalfunctionIndicatorActive_;
    json[JsonDefinitions::MULTI_PURPOSE_INPUT_SIGNAL_STATUS] = MultiPurposeInputSignalStatus_;
    json[JsonDefinitions::ALWAYS_ON_SIGNAL_STATUS] = AlwaysOnSignalStatus_;
    json[JsonDefinitions::IS_READY_SIGNAL_STATUS] = IsReadySignalStatus_;
    json[JsonDefinitions::IS_CHARGING_SIGNAL_STATUS] = IsChargingSignalStatus_;
    json[JsonDefinitions::HIGH_THERMISTOR_ID] = HighThermistorId_;
    json[JsonDefinitions::LOW_THERMISTOR_ID] = LowThermistorId_;

    //Battery Cell
    QJsonObject batteryCell;

    batteryCell[JsonDefinitions::POPULATED_CELLS] = PopulatedCells_;
    batteryCell[JsonDefinitions::LOW_CELL_VOLTAGE] = LowCellVoltage_;
    batteryCell[JsonDefinitions::LOW_CELL_VOLTAGE_ID] = LowCellVoltageId_;
    batteryCell[JsonDefinitions::HIGH_CELL_VOLTAGE] = HighCellVoltage_;
    batteryCell[JsonDefinitions::HIGH_CELL_VOLTAGE_ID] = HighCellVoltageId_;
    batteryCell[JsonDefinitions::AVERAGE_CELL_VOLTAGE] = AverageCellVoltage_;

    json[JsonDefinitions::BATTERY_CELL] = batteryCell;

    //Battery Fan
    QJsonObject batteryFan;
    
    batteryFan[JsonDefinitions::FAN_VOLTAGE] = FanVoltage_;
    batteryFan[JsonDefinitions::FAN_SPEED] = FanSpeed_;
    batteryFan[JsonDefinitions::REQUESTED_FAN_SPEED] = RequestedFanSpeed_;

    json[JsonDefinitions::BATTERY_FAN] = batteryFan;

    //Battery Pack
    QJsonObject batteryPack;

    batteryPack[JsonDefinitions::INPUT_12V] = Input12V_;
    batteryPack[JsonDefinitions::PACK_CURRENT] = PackCurrent_;
    batteryPack[JsonDefinitions::PACK_VOLTAGE] = PackVoltage_;
    batteryPack[JsonDefinitions::PACK_STATE_OF_CHARGE] = PackStateOfCharge_;
    batteryPack[JsonDefinitions::PACK_AMPHOURS] = PackAmphours_;
    batteryPack[JsonDefinitions::PACK_DEPTH_OF_DISCHARGE] = PackDepthOfDischarge_;

    json[JsonDefinitions::BATTERY_PACK] = batteryPack;

    //Battery Temperature
    QJsonObject batteryTemperature;

    batteryTemperature[JsonDefinitions::HIGH_TEMPERATURE] = HighTemperature_;
    batteryTemperature[JsonDefinitions::LOW_TEMPERATURE] = LowTemperature_;
    batteryTemperature[JsonDefinitions::AVERAGE_TEMPERATURE] = AverageTemperature_;
    batteryTemperature[JsonDefinitions::INTERNAL_TEMPERATURE] = InternalTemperature_;

    json[JsonDefinitions::BATTERY_TEMPERATURE] = batteryTemperature;


    return json;
}