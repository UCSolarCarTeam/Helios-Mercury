#include "MbmsPacket.h"
#include "../../Config/JsonDefinitions.h"

namespace {
    const int CONTACTOR_STATUS_OFFSET = 1;
    const unsigned char COMMON_CONTACTOR_STATE_OFFSET = 0x01;
    const unsigned char MOTOR_CONTACTOR_STATE_OFFSET = 0x02;
    const unsigned char ARRAY_CONTACTOR_STATE_OFFSET = 0x04;
    const unsigned char LV_CONTACTOR_STATE_OFFSET = 0x08;
    const unsigned char CHARGE_CONTACTOR_STATE_OFFSET = 0x10;
    
    const int CONTACTOR_ERROR_OFFSET = 2;
    const unsigned char COMMON_CONTACTOR_ERROR_OFFSET = 0x01;
    const unsigned char MOTOR_CONTACTOR_ERROR_OFFSET = 0x02;
    const unsigned char ARRAY_CONTACTOR_ERROR_OFFSET = 0x04;
    const unsigned char LV_CONTACTOR_ERROR_OFFSET = 0x08;
    const unsigned char CHARGE_CONTACTOR_ERROR_OFFSET = 0x10;

    const int MISCELLANOUS_STATUS = 3;
    const unsigned char STROBE_BMS_LIGHT_OFFSET = 0x01;
    const unsigned char ALLOW_CHARGE_OFFSET = 0x02;
    const unsigned char HIGH_VOLTAGE_ENABLE_STATE_OFFSET = 0x04;
    const unsigned char ALLOW_DISCHARGE_OFFSET = 0x08;
    const unsigned char ORION_CAN_RECEIVED_RECENTLY_OFFSET = 0x10;
    const unsigned char DISCHARGE_SHOULD_TRIP_OFFSET = 0x20;
    const unsigned char CHARGE_SHOULD_TRIP_OFFSET = 0x40;

    const int AUXILIARY_BATTERY_VOLTAGE_OFFSET = 4;
    const int MOTOR_VOLTAGE_OFFSET = 6;
    const int ARRAY_VOLTAGE_OFFSET = 8;
    const int LV_VOLTAGE_OFFSET = 10;
    const int CHARGE_VOLTAGE_OFFSET = 12;
    const int COMMON_CURRENT_OFFSET = 14;
    const int MOTOR_CURRENT_OFFSET = 16;
    const int ARRAY_CURRENT_OFFSET = 18;
    const int LV_CURRENT_OFFSET = 20;
    const int CHARGE_CURRENT_OFFSET = 22;

    const int TRIP_FLAGS_OFFSET = 24;
    const unsigned short HIGH_CELL_VOLTAGE_TRIP_OFFSET = 0x0001;
    const unsigned short LOW_CELL_VOLTAGE_TRIP_OFFSET = 0x0002;
    const unsigned short HIGH_COMMON_CURRENT_TRIP_OFFSET = 0x0004;
    const unsigned short MOTOR_HIGH_TEMPERATURE_CURRENT_TRIP_OFFSET = 0x0008;
    const unsigned short ARRAY_HIGH_TEMPERATURE_CURRENT_TRIP_OFFSET = 0x0010;
    const unsigned short LV_HIGH_TEMPERATURE_CURRENT_TRIP_OFFSET = 0x0020;
    const unsigned short CHARGE_HIGH_TEMPERATURE_CURRENT_TRIP_OFFSET = 0x0040;
    const unsigned short PROTECTION_TRIP_OFFSET = 0x0080;
    const unsigned short ORION_MESSAGE_TIMEOUT_TRIP_OFFSET = 0x0100;
    const unsigned short CONTACTOR_DISCONNECTED_UNEXPECTEDLY_TRIP_OFFSET = 0x0200;
}

MbmsPacket::MbmsPacket() {
    setCommonContactorState(false);
    setMotorContactorState(false);
    setArrayContactorState(false);
    setLvContactorState(false);
    setChargeContactorState(false);
    setCommonContactorError(false);
    setMotorContactorError(false);
    setArrayContactorError(false);
    setLvContactorError(false);
    setChargeContactorError(false);
    setStrobeBmsLight(false);
    setAllowCharge(false);
    setHighVoltageEnableState(false);
    setAllowDischarge(false);
    setOrionCanReceivedRecently(false);
    setDischargeShouldTrip(false);
    setChargeShouldTrip(false);

    setAuxillaryBatteryVoltage(0);
    setMotorVoltage(0);
    setArrayVoltage(0);
    setLvVoltage(0);
    setChargeVoltage(0);
    setCommonCurrent(0);
    setMotorCurrent(0);
    setArrayCurrent(0);
    setLvCurrent(0);
    setChargeCurrent(0);

    setHighCellVoltageTrip(false);
    setLowCellVoltageTrip(false);
    setHighCommonCurrentTrip(false);
    setMotorHighTemperatureCurrentTrip(false);
    setArrayHighTemperatureCurrentTrip(false);
    setLvHighTemperatureCurrentTrip(false);
    setChargeHighTemperatureCurrentTrip(false);
    setProtectionTrip(false);
    setOrionMessageTimeoutTrip(false);
    setContactorDisconnectedUnexpectedlyTrip(false);
}

void MbmsPacket::populatePacket(const QByteArray& data) {
    unsigned char contactorStatus = getValue<unsigned char>(data, CONTACTOR_STATUS_OFFSET);
    setCommonContactorState(contactorStatus & COMMON_CONTACTOR_STATE_OFFSET);
    setMotorContactorState(contactorStatus & MOTOR_CONTACTOR_STATE_OFFSET);
    setArrayContactorState(contactorStatus & ARRAY_CONTACTOR_STATE_OFFSET);
    setLvContactorState(contactorStatus & LV_CONTACTOR_STATE_OFFSET);
    setChargeContactorState(contactorStatus & CHARGE_CONTACTOR_STATE_OFFSET);

    unsigned char contactorError = getValue<unsigned char>(data, CONTACTOR_ERROR_OFFSET);
    setCommonContactorError(contactorError & COMMON_CONTACTOR_ERROR_OFFSET);
    setMotorContactorError(contactorError & MOTOR_CONTACTOR_ERROR_OFFSET);
    setArrayContactorError(contactorError & ARRAY_CONTACTOR_ERROR_OFFSET);
    setLvContactorError(contactorError & LV_CONTACTOR_ERROR_OFFSET);
    setChargeContactorError(contactorError & CHARGE_CONTACTOR_ERROR_OFFSET);

    unsigned char miscStatus = getValue<unsigned char>(data, MISCELLANOUS_STATUS);
    setStrobeBmsLight(miscStatus & STROBE_BMS_LIGHT_OFFSET);
    setAllowCharge(miscStatus & ALLOW_CHARGE_OFFSET);
    setHighVoltageEnableState(miscStatus & HIGH_VOLTAGE_ENABLE_STATE_OFFSET);
    setAllowDischarge(miscStatus & ALLOW_DISCHARGE_OFFSET);
    setOrionCanReceivedRecently(miscStatus & ORION_CAN_RECEIVED_RECENTLY_OFFSET);
    setDischargeShouldTrip(miscStatus & DISCHARGE_SHOULD_TRIP_OFFSET);
    setChargeShouldTrip(miscStatus & CHARGE_SHOULD_TRIP_OFFSET);

    setAuxillaryBatteryVoltage(getValue<unsigned short>(data, AUXILIARY_BATTERY_VOLTAGE_OFFSET));
    setMotorVoltage(getValue<unsigned short>(data, MOTOR_VOLTAGE_OFFSET));
    setArrayVoltage(getValue<unsigned short>(data, ARRAY_VOLTAGE_OFFSET));
    setLvVoltage(getValue<unsigned short>(data, LV_VOLTAGE_OFFSET));
    setChargeVoltage(getValue<unsigned short>(data, CHARGE_VOLTAGE_OFFSET));
    setCommonCurrent(getValue<unsigned short>(data, COMMON_CURRENT_OFFSET));
    setMotorCurrent(getValue<unsigned short>(data, MOTOR_CURRENT_OFFSET));
    setArrayCurrent(getValue<unsigned short>(data, ARRAY_CURRENT_OFFSET));
    setLvCurrent(getValue<unsigned short>(data, LV_CURRENT_OFFSET));
    setChargeCurrent(getValue<unsigned short>(data, CHARGE_CURRENT_OFFSET));

    unsigned short tripFlags = getValue<unsigned short>(data, TRIP_FLAGS_OFFSET);
    setHighCellVoltageTrip(tripFlags & HIGH_CELL_VOLTAGE_TRIP_OFFSET);
    setLowCellVoltageTrip(tripFlags & LOW_CELL_VOLTAGE_TRIP_OFFSET);
    setHighCommonCurrentTrip(tripFlags & HIGH_COMMON_CURRENT_TRIP_OFFSET);
    setMotorHighTemperatureCurrentTrip(tripFlags & MOTOR_HIGH_TEMPERATURE_CURRENT_TRIP_OFFSET);
    setArrayHighTemperatureCurrentTrip(tripFlags & ARRAY_HIGH_TEMPERATURE_CURRENT_TRIP_OFFSET);
    setLvHighTemperatureCurrentTrip(tripFlags & LV_HIGH_TEMPERATURE_CURRENT_TRIP_OFFSET);
    setChargeHighTemperatureCurrentTrip(tripFlags & CHARGE_HIGH_TEMPERATURE_CURRENT_TRIP_OFFSET);
    setProtectionTrip(tripFlags & PROTECTION_TRIP_OFFSET);
    setOrionMessageTimeoutTrip(tripFlags & ORION_MESSAGE_TIMEOUT_TRIP_OFFSET);
    setContactorDisconnectedUnexpectedlyTrip(tripFlags & CONTACTOR_DISCONNECTED_UNEXPECTEDLY_TRIP_OFFSET);
}

QJsonObject MbmsPacket::toJson() {
    QJsonObject json;
    
    json[JsonDefinitions::COMMON_CONTACTOR_STATE] = CommonContactorState_;
    json[JsonDefinitions::MOTOR_CONTACTOR_STATE] = MotorContactorState_;
    json[JsonDefinitions::ARRAY_CONTACTOR_STATE] = ArrayContactorState_;
    json[JsonDefinitions::LV_CONTACTOR_STATE] = LvContactorState_;
    json[JsonDefinitions::CHARGE_CONTACTOR_STATE] = ChargeContactorState_;

    json[JsonDefinitions::COMMON_CONTACTOR_ERROR] = CommonContactorError_;
    json[JsonDefinitions::MOTOR_CONTACTOR_ERROR] = MotorContactorError_;
    json[JsonDefinitions::ARRAY_CONTACTOR_ERROR] = ArrayContactorError_;
    json[JsonDefinitions::LV_CONTACTOR_ERROR] = LvContactorError_;
    json[JsonDefinitions::CHARGE_CONTACTOR_ERROR] = ChargeContactorError_;

    json[JsonDefinitions::STROBE_BMS_LIGHT] = StrobeBmsLight_;
    json[JsonDefinitions::ALLOW_CHARGE] = AllowCharge_;
    json[JsonDefinitions::HIGH_VOLTAGE_ENABLE_STATE] = HighVoltageEnableState_;
    json[JsonDefinitions::ALLOW_DISCHARGE] = AllowDischarge_;
    json[JsonDefinitions::ORION_CAN_RECEIVED_RECENTLY] = OrionCanReceivedRecently_;
    json[JsonDefinitions::DISCHARGE_SHOULD_TRIP] = DischargeShouldTrip_;
    json[JsonDefinitions::CHARGE_SHOULD_TRIP] = ChargeShouldTrip_;

    json[JsonDefinitions::AUXILLARY_BATTERY_VOLTAGE] = AuxillaryBatteryVoltage_;
    json[JsonDefinitions::MOTOR_VOLTAGE] = MotorVoltage_;
    json[JsonDefinitions::ARRAY_VOLTAGE] = ArrayVoltage_;
    json[JsonDefinitions::LV_VOLTAGE] = LvVoltage_;
    json[JsonDefinitions::CHARGE_VOLTAGE] = ChargeVoltage_;
    json[JsonDefinitions::COMMON_CURRENT] = CommonCurrent_;
    json[JsonDefinitions::MOTOR_CURRENT] = MotorCurrent_;
    json[JsonDefinitions::ARRAY_CURRENT] = ArrayCurrent_;
    json[JsonDefinitions::LV_CURRENT] = LvCurrent_;
    json[JsonDefinitions::CHARGE_CURRENT] = ChargeCurrent_;

    json[JsonDefinitions::HIGH_CELL_VOLTAGE_TRIP] = HighCellVoltageTrip_;
    json[JsonDefinitions::LOW_CELL_VOLTAGE_TRIP] = LowCellVoltageTrip_;
    json[JsonDefinitions::HIGH_COMMON_CURRENT_TRIP] = HighCommonCurrentTrip_;
    json[JsonDefinitions::MOTOR_HIGH_TEMPERATURE_CURRENT_TRIP] = MotorHighTemperatureCurrentTrip_;
    json[JsonDefinitions::ARRAY_HIGH_TEMPERATURE_CURRENT_TRIP] = ArrayHighTemperatureCurrentTrip_;
    json[JsonDefinitions::LV_HIGH_TEMPERATURE_CURRENT_TRIP] = LvHighTemperatureCurrentTrip_;
    json[JsonDefinitions::CHARGE_HIGH_TEMPERATURE_CURRENT_TRIP] = ChargeHighTemperatureCurrentTrip_;
    json[JsonDefinitions::PROTECTION_TRIP] = ProtectionTrip_;
    json[JsonDefinitions::ORION_MESSAGE_TIMEOUT_TRIP] = OrionMessageTimeoutTrip_;
    json[JsonDefinitions::CONTACTOR_DISCONNECTED_UNEXPECTEDLY_TRIP] = ContactorDisconnectedUnexpectedlyTrip_;

    return json;
}