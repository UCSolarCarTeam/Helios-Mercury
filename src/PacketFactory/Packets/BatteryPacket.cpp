#include "BatteryPacket.h"
#include "../../Config/JsonDefinitions.h"

BatteryPacket::BatteryPacket() {
    // BMU Heartbeat
    setBmuAlive(0);

    // Startup Info
    setDischargeRelayEnabled(false);
    setChargeRelayEnabled(false);
    setChargerSafetyEnabled(false);
    setMalfunctionIndicatorActive(false);
    setMultiPurposeInputSignalStatus(false);
    setAlwaysOnSignalStatus(false);
    setIsReadySignalStatus(false);
    setIsChargingSignalStatus(false);
    setPopulatedCells(0);
    setInput12V(0.0f);
    setFanVoltage(0.0f);

    // Pack Info
    setPackCurrent(0.0f);
    setPackVoltage(0.0f);
    setPackStateOfCharge(0.0f);
    setPackAmphours(0.0f);
    setPackDepthOfDischarge(0.0f);

    // Temp Info
    setHighTemperature(0);
    setHighThermistorId(0);
    setLowTemperature(0);
    setLowThermistorId(0);
    setAverageTemperature(0);
    setInternalTemperature(0);
    setFanSpeed(0);
    setRequestedFanSpeed(0);

    // Cell Voltages
    setLowCellVoltage(0);
    setLowCellVoltageId(0);
    setHighCellVoltage(0);
    setHighCellVoltageId(0);
    setAverageCellVoltage(0);

    // Max Min Voltages
    setMaximumCellVoltage(0);
    setMinimumCellVoltage(0);
    setMaximumPackVoltage(0);
    setMinimumPackVoltage(0);

    initializeIdActionMap();
}

QJsonObject BatteryPacket::toJson() {
    QJsonObject json;

    // BMU Heartbeat
    json[JsonDefinitions::BMU_ALIVE] = BmuAlive_;

    // Startup Info
    json[JsonDefinitions::DISCHARGE_RELAY_ENABLED] = DischargeRelayEnabled_;
    json[JsonDefinitions::CHARGE_RELAY_ENABLED] = ChargeRelayEnabled_;
    json[JsonDefinitions::CHARGER_SAFETY_ENABLED] = ChargerSafetyEnabled_;
    json[JsonDefinitions::MALFUNCTION_INDICATOR_ACTIVE] = MalfunctionIndicatorActive_;
    json[JsonDefinitions::MULTI_PURPOSE_INPUT_SIGNAL_STATUS] = MultiPurposeInputSignalStatus_;
    json[JsonDefinitions::ALWAYS_ON_SIGNAL_STATUS] = AlwaysOnSignalStatus_;
    json[JsonDefinitions::IS_READY_SIGNAL_STATUS] = IsReadySignalStatus_;
    json[JsonDefinitions::IS_CHARGING_SIGNAL_STATUS] = IsChargingSignalStatus_;
    json[JsonDefinitions::POPULATED_CELLS] = PopulatedCells_;
    json[JsonDefinitions::INPUT_12V] = Input12V_;
    json[JsonDefinitions::FAN_VOLTAGE] = FanVoltage_;

    // Pack Info
    json[JsonDefinitions::PACK_CURRENT] = PackCurrent_;
    json[JsonDefinitions::PACK_VOLTAGE] = PackVoltage_;
    json[JsonDefinitions::PACK_STATE_OF_CHARGE] = PackStateOfCharge_;
    json[JsonDefinitions::PACK_AMPHOURS] = PackAmphours_;
    json[JsonDefinitions::PACK_DEPTH_OF_DISCHARGE] = PackDepthOfDischarge_;

    // Temp Info
    json[JsonDefinitions::HIGH_TEMPERATURE] = HighTemperature_;
    json[JsonDefinitions::HIGH_THERMISTOR_ID] = HighThermistorId_;
    json[JsonDefinitions::LOW_TEMPERATURE] = LowTemperature_;
    json[JsonDefinitions::LOW_THERMISTOR_ID] = LowThermistorId_;
    json[JsonDefinitions::AVERAGE_TEMPERATURE] = AverageTemperature_;
    json[JsonDefinitions::INTERNAL_TEMPERATURE] = InternalTemperature_;
    json[JsonDefinitions::FAN_SPEED] = FanSpeed_;
    json[JsonDefinitions::REQUESTED_FAN_SPEED] = RequestedFanSpeed_;

    // Cell Voltages
    json[JsonDefinitions::LOW_CELL_VOLTAGE] = LowCellVoltage_;
    json[JsonDefinitions::LOW_CELL_VOLTAGE_ID] = LowCellVoltageId_;
    json[JsonDefinitions::HIGH_CELL_VOLTAGE] = HighCellVoltage_;
    json[JsonDefinitions::HIGH_CELL_VOLTAGE_ID] = HighCellVoltageId_;
    json[JsonDefinitions::AVERAGE_CELL_VOLTAGE] = AverageCellVoltage_;

    // Max Min Voltages
    json[JsonDefinitions::MAXIMUM_CELL_VOLTAGE] = MaximumCellVoltage_;
    json[JsonDefinitions::MINIMUM_CELL_VOLTAGE] = MinimumCellVoltage_;
    json[JsonDefinitions::MAXIMUM_PACK_VOLTAGE] = MaximumPackVoltage_;
    json[JsonDefinitions::MINIMUM_PACK_VOLTAGE] = MinimumPackVoltage_;

    return json;
}

void BatteryPacket::initializeIdActionMap() {
    qDebug() << "Initializing Battery Packet ID Action Map";

    // BMU Heartbeat (0x300)
    idActionMap[0x300] = [this](QByteArray payload) {
        setBmuAlive(getValue<unsigned char>(payload, 0));
    };

    // Startup Info (0x301)
    idActionMap[0x301] = [this](QByteArray payload) {
        unsigned char relayStatus = getValue<unsigned char>(payload, 0);
        setDischargeRelayEnabled(relayStatus & 0x01);
        setChargeRelayEnabled(relayStatus & 0x02);
        setChargerSafetyEnabled(relayStatus & 0x04);
        setMalfunctionIndicatorActive(relayStatus & 0x08);
        setMultiPurposeInputSignalStatus(relayStatus & 0x10);
        setAlwaysOnSignalStatus(relayStatus & 0x20);
        setIsReadySignalStatus(relayStatus & 0x40);
        setIsChargingSignalStatus(relayStatus & 0x80);

        setPopulatedCells(getValue<unsigned char>(payload, 1));
        setInput12V(getValue<unsigned short>(payload, 2) * 0.1f); // 0.1V
        setFanVoltage(getValue<unsigned short>(payload, 4) * 0.01f); // 0.01V
    };

    // Pack Info (0x302)
    idActionMap[0x302] = [this](QByteArray payload) {
        setPackCurrent(getValue<short>(payload, 0) * 0.1f); // 0.1A
        setPackVoltage(getValue<unsigned short>(payload, 2) * 0.1f); // 0.1V
        setPackStateOfCharge(getValue<unsigned char>(payload, 4) * 0.5f); // 0.5%
        setPackAmphours(getValue<unsigned short>(payload, 5) * 0.1f); // 0.1Ah
        setPackDepthOfDischarge(getValue<unsigned char>(payload, 7) * 0.5f); // 0.5%
    };

    // Temp Info (0x304)
    idActionMap[0x304] = [this](QByteArray payload) {
        setHighTemperature(getValue<char>(payload, 0)); // 1°C
        setHighThermistorId(getValue<unsigned char>(payload, 1));
        setLowTemperature(getValue<char>(payload, 2)); // 1°C
        setLowThermistorId(getValue<unsigned char>(payload, 3));
        setAverageTemperature(getValue<char>(payload, 4)); // 1°C
        setInternalTemperature(getValue<char>(payload, 5)); // 1°C
        setFanSpeed(getValue<unsigned char>(payload, 6));
        setRequestedFanSpeed(getValue<unsigned char>(payload, 7));
    };

    // Cell Voltages (0x305)
    idActionMap[0x305] = [this](QByteArray payload) {
        setLowCellVoltage(getValue<unsigned short>(payload, 0)); // 0.1mV
        setLowCellVoltageId(getValue<unsigned char>(payload, 2));
        setHighCellVoltage(getValue<unsigned short>(payload, 3)); // 0.1mV
        setHighCellVoltageId(getValue<unsigned char>(payload, 5));
        setAverageCellVoltage(getValue<unsigned short>(payload, 6)); // 0.1mV
    };

    // Max Min Voltages (0x30A)
    idActionMap[0x30A] = [this](QByteArray payload) {
        setMaximumCellVoltage(getValue<unsigned short>(payload, 0));
        setMinimumCellVoltage(getValue<unsigned short>(payload, 2));
        setMaximumPackVoltage(getValue<unsigned short>(payload, 4));
        setMinimumPackVoltage(getValue<unsigned short>(payload, 6));
    };
}
