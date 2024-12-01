#include "BatteryFaultsPacket.h"
#include "../../Config/JsonDefinitions.h"

namespace {
    const int ERROR_FLAGS_OFFSET = 1;
    const unsigned int INTERNAL_COMMUNICATION_FAULT_MASK = 0x00000001;
    const unsigned int INTERNAL_CONVERSION_FAULT_MASK = 0x00000002;
    const unsigned int WEAK_CELL_FAULT_MASK = 0x00000004;
    const unsigned int LOW_CELL_VOLTAGE_FAULT_MASK = 0x00000008;
    const unsigned int OPEN_WIRING_FAULT_MASK = 0x00000010;
    const unsigned int CURRENT_SENSOR_FAULT_MASK = 0x00000020;
    const unsigned int PACK_VOLTAGE_SENSOR_FAULT_MASK = 0x00000040;
    const unsigned int WEAK_PACK_FAULT_MASK = 0x00000080;
    const unsigned int VOLTAGE_REDUNDANCY_FAULT_MASK = 0x00000100;
    const unsigned int FAN_MONITOR_FAULT_MASK = 0x00000200;
    const unsigned int THERMISTOR_FAULT_MASK = 0x00000400;
    const unsigned int CANBUS_COMMUNICATION_FAULT_MASK = 0x00000800;
    const unsigned int ALWAYS_ON_SUPPLY_FAULT_MASK = 0x00001000;
    const unsigned int HIGH_VOLTAGE_ISOLATION_FAULT_MASK = 0x00002000;
    const unsigned int POWER_SUPPLY_12V_FAULT_MASK = 0x00004000;
    const unsigned int CHARGE_LIMIT_ENFORCEMENT_FAULT_MASK = 0x00008000;
    const unsigned int DISCHARGE_LIMIT_ENFORCEMENT_FAULT_MASK = 0x00010000;
    const unsigned int CHARGER_SAFETY_RELAY_FAULT_MASK = 0x00020000;
    const unsigned int INTERNAL_MEMORY_FAULT_MASK = 0x00040000;
    const unsigned int INTERNAL_THERMISTOR_FAULT_MASK = 0x00080000;
    const unsigned int INTERNAL_LOGIC_FAULT_MASK = 0x00100000;

    const int LIMIT_FLAGS_OFFSET = 5;
    const unsigned short DCL_REDUCED_DUE_TO_LOW_SOC_MASK = 0x0001;
    const unsigned short DCL_REDUCED_DUE_TO_HIGH_CELL_RESISTANCE_MASK = 0x0002;
    const unsigned short DCL_REDUCED_DUE_TO_TEMPERATURE_MASK = 0x0004;
    const unsigned short DCL_REDUCED_DUE_TO_LOW_CELL_VOLTAGE_MASK = 0x0008;
    const unsigned short DCL_REDUCED_DUE_TO_LOW_PACK_VOLTAGE_MASK = 0x0010;
    const unsigned short DCL_AND_CCL_REDUCED_DUE_TO_VOLTAGE_FAILSAFE_MASK = 0x0040;
    const unsigned short DCL_AND_CCL_REDUCED_DUE_TO_COMMUNICATION_FAILSAFE_MASK = 0x0080;
    const unsigned short CCL_REDUCED_DUE_TO_HIGH_SOC_MASK = 0x0200;
    const unsigned short CCL_REDUCED_DUE_TO_HIGH_CELL_RESISTANCE_MASK = 0x0400;
    const unsigned short CCL_REDUCED_DUE_TO_TEMPERATURE_MASK = 0x0800;
    const unsigned short CCL_REDUCED_DUE_TO_HIGH_CELL_VOLTAGE_MASK = 0x1000;
    const unsigned short CCL_REDUCED_DUE_TO_HIGH_PACK_VOLTAGE_MASK = 0x2000;
    const unsigned short CCL_REDUCED_DUE_TO_CHARGER_LATCH_MASK = 0x4000;
    const unsigned short CCL_REDUCED_DUE_TO_ALTERNATE_CURRENT_LIMIT_MASK = 0x8000;
}

BatteryFaultsPacket::BatteryFaultsPacket() {
    internalCommunicationFault_ = false;
    internalConverversionFault_ = false;
    weakCellFault_ = false;
    lowCellVoltageFault_ = false;
    openWiringFault_ = false;
    currentSensorFault_ = false;
    packVoltageSensorFault_ = false;
    weakPackFault_ = false;
    voltageRedundancyFault_ = false;
    fanMonitorFault_ = false;
    thermistorFault_ = false;
    canbusCommunicationFault_ = false;
    alwaysOnSupplyFault_ = false;
    highVoltageIsolationFault_ = false;
    powerSupply12VFault_ = false;
    chargeLimitEnforcementFault_ = false;
    dischargeLimitEnforcementFault_ = false;
    chargerSafetyRelayFault_ = false;
    internalMemoryFault_ = false;
    internalThermistorFault_ = false;
    internalLogicFault_ = false;

    dclReducedDueToLowSoc_ = false;
    dclReducedDueToHighCellResistance_ = false;
    dclReducedDueToTemperature_ = false;
    dclReducedDueToLowCellVoltage_ = false;
    dclReducedDueToLowPackVoltage_ = false;
    dclAndCclReducedDueToVoltageFailsafe_ = false;
    dclAndCclReducedDueToCommunicationFailsafe_ = false;
    cclReducedDueToHighSoc_ = false;
    cclReducedDueToHighCellResistance_ = false;
    cclReducedDueToTemperature_ = false;
    cclReducedDueToHighCellVoltage_ = false;
    cclReducedDueToHighPackVoltage_ = false;
    cclReducedDueToChargerLatch_ = false;
    cclReducedDueToAlternateCurrentLimit_ = false;
}

void BatteryFaultsPacket::populatePacket(const QByteArray& data) {
    unsigned int errorFlags = getValue<unsigned int>(data, ERROR_FLAGS_OFFSET);
    internalCommunicationFault_ = errorFlags & INTERNAL_COMMUNICATION_FAULT_MASK;
    internalConverversionFault_ = errorFlags & INTERNAL_CONVERSION_FAULT_MASK;
    weakCellFault_ = errorFlags & WEAK_CELL_FAULT_MASK;
    lowCellVoltageFault_ = errorFlags & LOW_CELL_VOLTAGE_FAULT_MASK;
    openWiringFault_ = errorFlags & OPEN_WIRING_FAULT_MASK;
    currentSensorFault_ = errorFlags & CURRENT_SENSOR_FAULT_MASK;
    packVoltageSensorFault_ = errorFlags & PACK_VOLTAGE_SENSOR_FAULT_MASK;
    weakPackFault_ = errorFlags & WEAK_PACK_FAULT_MASK;
    voltageRedundancyFault_ = errorFlags & VOLTAGE_REDUNDANCY_FAULT_MASK;
    fanMonitorFault_ = errorFlags & FAN_MONITOR_FAULT_MASK;
    thermistorFault_ = errorFlags & THERMISTOR_FAULT_MASK;
    canbusCommunicationFault_ = errorFlags & CANBUS_COMMUNICATION_FAULT_MASK;
    alwaysOnSupplyFault_ = errorFlags & ALWAYS_ON_SUPPLY_FAULT_MASK;
    highVoltageIsolationFault_ = errorFlags & HIGH_VOLTAGE_ISOLATION_FAULT_MASK;
    powerSupply12VFault_ = errorFlags & POWER_SUPPLY_12V_FAULT_MASK;
    chargeLimitEnforcementFault_ = errorFlags & CHARGE_LIMIT_ENFORCEMENT_FAULT_MASK;
    dischargeLimitEnforcementFault_ = errorFlags & DISCHARGE_LIMIT_ENFORCEMENT_FAULT_MASK;
    chargerSafetyRelayFault_ = errorFlags & CHARGER_SAFETY_RELAY_FAULT_MASK;
    internalMemoryFault_ = errorFlags & INTERNAL_MEMORY_FAULT_MASK;
    internalThermistorFault_ = errorFlags & INTERNAL_THERMISTOR_FAULT_MASK;
    internalLogicFault_ = errorFlags & INTERNAL_LOGIC_FAULT_MASK;

    unsigned short limitFlags = getValue<unsigned short>(data, LIMIT_FLAGS_OFFSET);
    dclReducedDueToLowSoc_ = limitFlags & DCL_REDUCED_DUE_TO_LOW_SOC_MASK;
    dclReducedDueToHighCellResistance_ = limitFlags & DCL_REDUCED_DUE_TO_HIGH_CELL_RESISTANCE_MASK;
    dclReducedDueToTemperature_ = limitFlags & DCL_REDUCED_DUE_TO_TEMPERATURE_MASK;
    dclReducedDueToLowCellVoltage_ = limitFlags & DCL_REDUCED_DUE_TO_LOW_CELL_VOLTAGE_MASK;
    dclReducedDueToLowPackVoltage_ = limitFlags & DCL_REDUCED_DUE_TO_LOW_PACK_VOLTAGE_MASK;
    dclAndCclReducedDueToVoltageFailsafe_ = limitFlags & DCL_AND_CCL_REDUCED_DUE_TO_VOLTAGE_FAILSAFE_MASK;
    dclAndCclReducedDueToCommunicationFailsafe_ = limitFlags & DCL_AND_CCL_REDUCED_DUE_TO_COMMUNICATION_FAILSAFE_MASK;
    cclReducedDueToHighSoc_ = limitFlags & CCL_REDUCED_DUE_TO_HIGH_SOC_MASK;
    cclReducedDueToHighCellResistance_ = limitFlags & CCL_REDUCED_DUE_TO_HIGH_CELL_RESISTANCE_MASK;
    cclReducedDueToTemperature_ = limitFlags & CCL_REDUCED_DUE_TO_TEMPERATURE_MASK;
    cclReducedDueToHighCellVoltage_ = limitFlags & CCL_REDUCED_DUE_TO_HIGH_CELL_VOLTAGE_MASK;
    cclReducedDueToHighPackVoltage_ = limitFlags & CCL_REDUCED_DUE_TO_HIGH_PACK_VOLTAGE_MASK;
    cclReducedDueToChargerLatch_ = limitFlags & CCL_REDUCED_DUE_TO_CHARGER_LATCH_MASK;
    cclReducedDueToAlternateCurrentLimit_ = limitFlags & CCL_REDUCED_DUE_TO_ALTERNATE_CURRENT_LIMIT_MASK;
}

QJsonObject BatteryFaultsPacket::toJson() {
    QJsonObject json;
    
    json[JsonDefinitions::INTERNAL_COMMUNICATION_FAULT] = internalCommunicationFault_;
    json[JsonDefinitions::INTERNAL_CONVERSION_FAULT] = internalConverversionFault_;
    json[JsonDefinitions::WEAK_CELL_FAULT] = weakCellFault_;
    json[JsonDefinitions::LOW_CELL_VOLTAGE_FAULT] = lowCellVoltageFault_;
    json[JsonDefinitions::OPEN_WIRING_FAULT] = openWiringFault_;
    json[JsonDefinitions::CURRENT_SENSOR_FAULT] = currentSensorFault_;
    json[JsonDefinitions::PACK_VOLTAGE_SENSOR_FAULT] = packVoltageSensorFault_;
    json[JsonDefinitions::WEAK_PACK_FAULT] = weakPackFault_;
    json[JsonDefinitions::VOLTAGE_REDUNDANCY_FAULT] = voltageRedundancyFault_;
    json[JsonDefinitions::FAN_MONITOR_FAULT] = fanMonitorFault_;
    json[JsonDefinitions::THERMISTOR_FAULT] = thermistorFault_;
    json[JsonDefinitions::CANBUS_COMMUNICATION_FAULT] = canbusCommunicationFault_;
    json[JsonDefinitions::ALWAYS_ON_SUPPLY_FAULT] = alwaysOnSupplyFault_;
    json[JsonDefinitions::HIGH_VOLTAGE_ISOLATION_FAULT] = highVoltageIsolationFault_;
    json[JsonDefinitions::POWER_SUPPLY_12V_FAULT] = powerSupply12VFault_;
    json[JsonDefinitions::CHARGE_LIMIT_ENFORCEMENT_FAULT] = chargeLimitEnforcementFault_;
    json[JsonDefinitions::DISCHARGE_LIMIT_ENFORCEMENT_FAULT] = dischargeLimitEnforcementFault_;
    json[JsonDefinitions::CHARGER_SAFETY_RELAY_FAULT] = chargerSafetyRelayFault_;
    json[JsonDefinitions::INTERNAL_MEMORY_FAULT] = internalMemoryFault_;
    json[JsonDefinitions::INTERNAL_THERMISTOR_FAULT] = internalThermistorFault_;
    json[JsonDefinitions::INTERNAL_LOGIC_FAULT] = internalLogicFault_;

    json[JsonDefinitions::DCL_REDUCED_DUE_TO_LOW_SOC] = dclReducedDueToLowSoc_;
    json[JsonDefinitions::DCL_REDUCED_DUE_TO_HIGH_CELL_RESISTANCE] = dclReducedDueToHighCellResistance_;
    json[JsonDefinitions::DCL_REDUCED_DUE_TO_TEMPERATURE] = dclReducedDueToTemperature_;
    json[JsonDefinitions::DCL_REDUCED_DUE_TO_LOW_CELL_VOLTAGE] = dclReducedDueToLowCellVoltage_;
    json[JsonDefinitions::DCL_REDUCED_DUE_TO_LOW_PACK_VOLTAGE] = dclReducedDueToLowPackVoltage_;
    json[JsonDefinitions::DCL_AND_CCL_REDUCED_DUE_TO_VOLTAGE_FAILSAFE] = dclAndCclReducedDueToVoltageFailsafe_;
    json[JsonDefinitions::DCL_AND_CCL_REDUCED_DUE_TO_COMMUNICATION_FAILSAFE] = dclAndCclReducedDueToCommunicationFailsafe_;
    json[JsonDefinitions::CCL_REDUCED_DUE_TO_HIGH_SOC] = cclReducedDueToHighSoc_;
    json[JsonDefinitions::CCL_REDUCED_DUE_TO_HIGH_CELL_RESISTANCE] = cclReducedDueToHighCellResistance_;
    json[JsonDefinitions::CCL_REDUCED_DUE_TO_TEMPERATURE] = cclReducedDueToTemperature_;
    json[JsonDefinitions::CCL_REDUCED_DUE_TO_HIGH_CELL_VOLTAGE] = cclReducedDueToHighCellVoltage_;
    json[JsonDefinitions::CCL_REDUCED_DUE_TO_HIGH_PACK_VOLTAGE] = cclReducedDueToHighPackVoltage_;
    json[JsonDefinitions::CCL_REDUCED_DUE_TO_CHARGER_LATCH] = cclReducedDueToChargerLatch_;
    json[JsonDefinitions::CCL_REDUCED_DUE_TO_ALTERNATE_CURRENT_LIMIT] = cclReducedDueToAlternateCurrentLimit_;
    
    return json;
}