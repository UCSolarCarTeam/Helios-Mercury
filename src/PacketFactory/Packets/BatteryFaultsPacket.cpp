#include "BatteryFaultsPacket.h"
#include "../../Config/JsonDefinitions.h"

BatteryFaultsPacket::BatteryFaultsPacket() {
    // DTC flags  
    setInternalCommunicationFault(false);
    setInternalConversionFault(false);
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

    // Limit flags 
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

    initializeIdActionMap();
}

QJsonObject BatteryFaultsPacket::toJson() {
    QJsonObject json;
    
    // DTC flags  
    QJsonObject errors;

    errors[JsonDefinitions::INTERNAL_COMMUNICATION_FAULT] = InternalCommunicationFault_;
    errors[JsonDefinitions::INTERNAL_CONVERSION_FAULT] = InternalConversionFault_;
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

    // Limit flags 
    QJsonObject warnings;

    warnings[JsonDefinitions::DCL_REDUCED_DUE_TO_LOW_SOC] = DclReducedDueToLowSoc_;
    warnings[JsonDefinitions::DCL_REDUCED_DUE_TO_HIGH_CELL_RESISTANCE] = DclReducedDueToHighCellResistance_;
    warnings[JsonDefinitions::DCL_REDUCED_DUE_TO_TEMPERATURE] = DclReducedDueToTemperature_;
    warnings[JsonDefinitions::DCL_REDUCED_DUE_TO_LOW_CELL_VOLTAGE] = DclReducedDueToLowCellVoltage_;
    warnings[JsonDefinitions::DCL_REDUCED_DUE_TO_LOW_PACK_VOLTAGE] = DclReducedDueToLowPackVoltage_;
    warnings[JsonDefinitions::DCL_AND_CCL_REDUCED_DUE_TO_VOLTAGE_FAILSAFE] = DclAndCclReducedDueToVoltageFailsafe_;
    warnings[JsonDefinitions::DCL_AND_CCL_REDUCED_DUE_TO_COMMUNICATION_FAILSAFE] = DclAndCclReducedDueToCommunicationFailsafe_;
    warnings[JsonDefinitions::CCL_REDUCED_DUE_TO_HIGH_SOC] = CclReducedDueToHighSoc_;
    warnings[JsonDefinitions::CCL_REDUCED_DUE_TO_HIGH_CELL_RESISTANCE] = CclReducedDueToHighCellResistance_;
    warnings[JsonDefinitions::CCL_REDUCED_DUE_TO_TEMPERATURE] = CclReducedDueToTemperature_;
    warnings[JsonDefinitions::CCL_REDUCED_DUE_TO_HIGH_CELL_VOLTAGE] = CclReducedDueToHighCellVoltage_;
    warnings[JsonDefinitions::CCL_REDUCED_DUE_TO_HIGH_PACK_VOLTAGE] = CclReducedDueToHighPackVoltage_;
    warnings[JsonDefinitions::CCL_REDUCED_DUE_TO_CHARGER_LATCH] = CclReducedDueToChargerLatch_;
    warnings[JsonDefinitions::CCL_REDUCED_DUE_TO_ALTERNATE_CURRENT_LIMIT] = CclReducedDueToAlternateCurrentLimit_;

    json[JsonDefinitions::WARNINGS] = warnings;
    
    return json;
}

void BatteryFaultsPacket::initializeIdActionMap() {
    qDebug() << "Initializing Battery Faults Packet ID Action Map";
    
    // Errors - 0x303
    idActionMap[0x303] = [this](QByteArray payload) {
        unsigned short limitFlags = (static_cast<unsigned char>(payload[1]) << 8) | static_cast<unsigned char>(payload[0]);

        unsigned char b2 = static_cast<unsigned char>(payload[2]);
        unsigned char b3 = static_cast<unsigned char>(payload[3]);
        unsigned char b4 = static_cast<unsigned char>(payload[4]);
        unsigned int dtcFlags = b2 | (b3 << 8) | (b4 << 16);

        // Limit flags
        setDclReducedDueToLowSoc(limitFlags & 0x0001);
        setDclReducedDueToHighCellResistance(limitFlags & 0x0002);
        setDclReducedDueToTemperature(limitFlags & 0x0004);
        setDclReducedDueToLowCellVoltage(limitFlags & 0x0008);
        setDclReducedDueToLowPackVoltage(limitFlags & 0x0010);
        setDclAndCclReducedDueToVoltageFailsafe(limitFlags & 0x0040);
        setDclAndCclReducedDueToCommunicationFailsafe(limitFlags & 0x0080);
        setCclReducedDueToHighSoc(limitFlags & 0x0200);
        setCclReducedDueToHighCellResistance(limitFlags & 0x0400);
        setCclReducedDueToTemperature(limitFlags & 0x0800);
        setCclReducedDueToHighCellVoltage(limitFlags & 0x1000);
        setCclReducedDueToHighPackVoltage(limitFlags & 0x2000);
        setCclReducedDueToChargerLatch(limitFlags & 0x4000);
        setCclReducedDueToAlternateCurrentLimit(limitFlags & 0x8000);

        // DTC flags 
        setInternalCommunicationFault(dtcFlags & 0x00000001);
        setInternalConversionFault(dtcFlags & 0x00000002);
        setWeakCellFault(dtcFlags & 0x00000004);
        setLowCellVoltageFault(dtcFlags & 0x00000008);
        setOpenWiringFault(dtcFlags & 0x00000010);
        setCurrentSensorFault(dtcFlags & 0x00000020);
        setPackVoltageSensorFault(dtcFlags & 0x00000040);
        setWeakPackFault(dtcFlags & 0x00000080);
        setVoltageRedundancyFault(dtcFlags & 0x00000100);
        setFanMonitorFault(dtcFlags & 0x00000200);
        setThermistorFault(dtcFlags & 0x00000400);
        setCanbusCommunicationFault(dtcFlags & 0x00000800);
        setAlwaysOnSupplyFault(dtcFlags & 0x00001000);
        setHighVoltageIsolationFault(dtcFlags & 0x00002000);
        setPowerSupply12VFault(dtcFlags & 0x00004000);
        setChargeLimitEnforcementFault(dtcFlags & 0x00008000);
        setDischargeLimitEnforcementFault(dtcFlags & 0x00010000);
        setChargerSafetyRelayFault(dtcFlags & 0x00020000);
        setInternalMemoryFault(dtcFlags & 0x00040000);
        setInternalThermistorFault(dtcFlags & 0x00080000);
        setInternalLogicFault(dtcFlags & 0x00100000);
    };
}
