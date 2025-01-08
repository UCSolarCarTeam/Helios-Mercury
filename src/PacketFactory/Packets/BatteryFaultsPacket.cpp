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
    setInternalCommunicationFault(false);
    setInternalConverversionFault(false);
    setWeakCellFault(false);
    setLowCellVoltageFault(false);
    setOpenWiringFault(false);
    setCurrentSensorFault(false);
    setPackVoltageSensorFault(false);
    setWeakPackFault(false);
    setVoltageRedundancyFault(false);
    setFanMonitorFault(false);
    setThermistorFault(false);
    setCanbusCommunicationFault(false);
    setAlwaysOnSupplyFault(false);
    setHighVoltageIsolationFault(false);
    setPowerSupply12VFault(false);
    setChargeLimitEnforcementFault(false);
    setDischargeLimitEnforcementFault(false);
    setChargerSafetyRelayFault(false);
    setInternalMemoryFault(false);
    setInternalThermistorFault(false);
    setInternalLogicFault(false);

    setDclReducedDueToLowSoc(false);
    setDclReducedDueToHighCellResistance(false);
    setDclReducedDueToTemperature(false);
    setDclReducedDueToLowCellVoltage(false);
    setDclReducedDueToLowPackVoltage(false);
    setDclAndCclReducedDueToVoltageFailsafe(false);
    setDclAndCclReducedDueToCommunicationFailsafe(false);
    setCclReducedDueToHighSoc(false);
    setCclReducedDueToHighCellResistance(false);
    setCclReducedDueToTemperature(false);
    setCclReducedDueToHighCellVoltage(false);
    setCclReducedDueToHighPackVoltage(false);
    setCclReducedDueToChargerLatch(false);
    setCclReducedDueToAlternateCurrentLimit(false);
}

void BatteryFaultsPacket::populatePacket(const QByteArray& data) {
    unsigned int errorFlags = getValue<unsigned int>(data, ERROR_FLAGS_OFFSET);
    setInternalCommunicationFault(errorFlags & INTERNAL_COMMUNICATION_FAULT_MASK);
    setInternalConverversionFault(errorFlags & INTERNAL_CONVERSION_FAULT_MASK);
    setWeakCellFault(errorFlags & WEAK_CELL_FAULT_MASK);
    setLowCellVoltageFault(errorFlags & LOW_CELL_VOLTAGE_FAULT_MASK);
    setOpenWiringFault(errorFlags & OPEN_WIRING_FAULT_MASK);
    setCurrentSensorFault(errorFlags & CURRENT_SENSOR_FAULT_MASK);
    setPackVoltageSensorFault(errorFlags & PACK_VOLTAGE_SENSOR_FAULT_MASK);
    setWeakPackFault(errorFlags & WEAK_PACK_FAULT_MASK);
    setVoltageRedundancyFault(errorFlags & VOLTAGE_REDUNDANCY_FAULT_MASK);
    setFanMonitorFault(errorFlags & FAN_MONITOR_FAULT_MASK);
    setThermistorFault(errorFlags & THERMISTOR_FAULT_MASK);
    setCanbusCommunicationFault(errorFlags & CANBUS_COMMUNICATION_FAULT_MASK);
    setAlwaysOnSupplyFault(errorFlags & ALWAYS_ON_SUPPLY_FAULT_MASK);
    setHighVoltageIsolationFault(errorFlags & HIGH_VOLTAGE_ISOLATION_FAULT_MASK);
    setPowerSupply12VFault(errorFlags & POWER_SUPPLY_12V_FAULT_MASK);
    setChargeLimitEnforcementFault(errorFlags & CHARGE_LIMIT_ENFORCEMENT_FAULT_MASK);
    setDischargeLimitEnforcementFault(errorFlags & DISCHARGE_LIMIT_ENFORCEMENT_FAULT_MASK);
    setChargerSafetyRelayFault(errorFlags & CHARGER_SAFETY_RELAY_FAULT_MASK);
    setInternalMemoryFault(errorFlags & INTERNAL_MEMORY_FAULT_MASK);
    setInternalThermistorFault(errorFlags & INTERNAL_THERMISTOR_FAULT_MASK);
    setInternalLogicFault(errorFlags & INTERNAL_LOGIC_FAULT_MASK);

    unsigned short limitFlags = getValue<unsigned short>(data, LIMIT_FLAGS_OFFSET);
    setDclReducedDueToLowSoc(limitFlags & DCL_REDUCED_DUE_TO_LOW_SOC_MASK);
    setDclReducedDueToHighCellResistance(limitFlags & DCL_REDUCED_DUE_TO_HIGH_CELL_RESISTANCE_MASK);
    setDclReducedDueToTemperature(limitFlags & DCL_REDUCED_DUE_TO_TEMPERATURE_MASK);
    setDclReducedDueToLowCellVoltage(limitFlags & DCL_REDUCED_DUE_TO_LOW_CELL_VOLTAGE_MASK);
    setDclReducedDueToLowPackVoltage(limitFlags & DCL_REDUCED_DUE_TO_LOW_PACK_VOLTAGE_MASK);
    setDclAndCclReducedDueToVoltageFailsafe(limitFlags & DCL_AND_CCL_REDUCED_DUE_TO_VOLTAGE_FAILSAFE_MASK);
    setDclAndCclReducedDueToCommunicationFailsafe(limitFlags & DCL_AND_CCL_REDUCED_DUE_TO_COMMUNICATION_FAILSAFE_MASK);
    setCclReducedDueToHighSoc(limitFlags & CCL_REDUCED_DUE_TO_HIGH_SOC_MASK);
    setCclReducedDueToHighCellResistance(limitFlags & CCL_REDUCED_DUE_TO_HIGH_CELL_RESISTANCE_MASK);
    setCclReducedDueToTemperature(limitFlags & CCL_REDUCED_DUE_TO_TEMPERATURE_MASK);
    setCclReducedDueToHighCellVoltage(limitFlags & CCL_REDUCED_DUE_TO_HIGH_CELL_VOLTAGE_MASK);
    setCclReducedDueToHighPackVoltage(limitFlags & CCL_REDUCED_DUE_TO_HIGH_PACK_VOLTAGE_MASK);
    setCclReducedDueToChargerLatch(limitFlags & CCL_REDUCED_DUE_TO_CHARGER_LATCH_MASK);
    setCclReducedDueToAlternateCurrentLimit(limitFlags & CCL_REDUCED_DUE_TO_ALTERNATE_CURRENT_LIMIT_MASK);
}

QJsonObject BatteryFaultsPacket::toJson() {
    QJsonObject json;
    
    //Errors
    QJsonObject errors;

    errors[JsonDefinitions::INTERNAL_COMMUNICATION_FAULT] = InternalCommunicationFault_;
    errors[JsonDefinitions::INTERNAL_CONVERSION_FAULT] = InternalConverversionFault_;
    errors[JsonDefinitions::WEAK_CELL_FAULT] = WeakCellFault_;
    errors[JsonDefinitions::LOW_CELL_VOLTAGE_FAULT] = LowCellVoltageFault_;
    errors[JsonDefinitions::OPEN_WIRING_FAULT] = OpenWiringFault_;
    errors[JsonDefinitions::CURRENT_SENSOR_FAULT] = CurrentSensorFault_;
    errors[JsonDefinitions::PACK_VOLTAGE_SENSOR_FAULT] = PackVoltageSensorFault_;
    errors[JsonDefinitions::WEAK_PACK_FAULT] = WeakPackFault_;
    errors[JsonDefinitions::VOLTAGE_REDUNDANCY_FAULT] = VoltageRedundancyFault_;
    errors[JsonDefinitions::FAN_MONITOR_FAULT] = FanMonitorFault_;
    errors[JsonDefinitions::THERMISTOR_FAULT] = ThermistorFault_;
    errors[JsonDefinitions::CANBUS_COMMUNICATION_FAULT] = CanbusCommunicationFault_;
    errors[JsonDefinitions::ALWAYS_ON_SUPPLY_FAULT] = AlwaysOnSupplyFault_;
    errors[JsonDefinitions::HIGH_VOLTAGE_ISOLATION_FAULT] = HighVoltageIsolationFault_;
    errors[JsonDefinitions::POWER_SUPPLY_12V_FAULT] = PowerSupply12VFault_;
    errors[JsonDefinitions::CHARGE_LIMIT_ENFORCEMENT_FAULT] = ChargeLimitEnforcementFault_;
    errors[JsonDefinitions::DISCHARGE_LIMIT_ENFORCEMENT_FAULT] = DischargeLimitEnforcementFault_;
    errors[JsonDefinitions::CHARGER_SAFETY_RELAY_FAULT] = ChargerSafetyRelayFault_;
    errors[JsonDefinitions::INTERNAL_MEMORY_FAULT] = InternalMemoryFault_;
    errors[JsonDefinitions::INTERNAL_THERMISTOR_FAULT] = InternalThermistorFault_;
    errors[JsonDefinitions::INTERNAL_LOGIC_FAULT] = InternalLogicFault_;

    json[JsonDefinitions::ERRORS] = errors;

    //Limits/Warnings
    QJsonObject limits;

    limits[JsonDefinitions::DCL_REDUCED_DUE_TO_LOW_SOC] = DclReducedDueToLowSoc_;
    limits[JsonDefinitions::DCL_REDUCED_DUE_TO_HIGH_CELL_RESISTANCE] = DclReducedDueToHighCellResistance_;
    limits[JsonDefinitions::DCL_REDUCED_DUE_TO_TEMPERATURE] = DclReducedDueToTemperature_;
    limits[JsonDefinitions::DCL_REDUCED_DUE_TO_LOW_CELL_VOLTAGE] = DclReducedDueToLowCellVoltage_;
    limits[JsonDefinitions::DCL_REDUCED_DUE_TO_LOW_PACK_VOLTAGE] = DclReducedDueToLowPackVoltage_;
    limits[JsonDefinitions::DCL_AND_CCL_REDUCED_DUE_TO_VOLTAGE_FAILSAFE] = DclAndCclReducedDueToVoltageFailsafe_;
    limits[JsonDefinitions::DCL_AND_CCL_REDUCED_DUE_TO_COMMUNICATION_FAILSAFE] = DclAndCclReducedDueToCommunicationFailsafe_;
    limits[JsonDefinitions::CCL_REDUCED_DUE_TO_HIGH_SOC] = CclReducedDueToHighSoc_;
    limits[JsonDefinitions::CCL_REDUCED_DUE_TO_HIGH_CELL_RESISTANCE] = CclReducedDueToHighCellResistance_;
    limits[JsonDefinitions::CCL_REDUCED_DUE_TO_TEMPERATURE] = CclReducedDueToTemperature_;
    limits[JsonDefinitions::CCL_REDUCED_DUE_TO_HIGH_CELL_VOLTAGE] = CclReducedDueToHighCellVoltage_;
    limits[JsonDefinitions::CCL_REDUCED_DUE_TO_HIGH_PACK_VOLTAGE] = CclReducedDueToHighPackVoltage_;
    limits[JsonDefinitions::CCL_REDUCED_DUE_TO_CHARGER_LATCH] = CclReducedDueToChargerLatch_;
    limits[JsonDefinitions::CCL_REDUCED_DUE_TO_ALTERNATE_CURRENT_LIMIT] = CclReducedDueToAlternateCurrentLimit_;

    json[JsonDefinitions::WARNINGS] = limits;
    
    return json;
}