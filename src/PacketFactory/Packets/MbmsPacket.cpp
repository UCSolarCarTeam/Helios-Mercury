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
    commonContactorState_ = false;
    motorContactorState_ = false;
    arrayContactorState_ = false;
    lvContactorState_ = false;
    chargeContactorState_ = false;
    commonContactorError_ = false;
    motorContactorError_ = false;
    arrayContactorError_ = false;
    lvContactorError_ = false;
    chargeContactorError_ = false;
    strobeBmsLight_ = false;
    allowCharge_ = false;
    highVoltageEnableState_ = false;
    allowDischarge_ = false;
    orionCanReceivedRecently_ = false;
    dischargeShouldTrip_ = false;
    chargeShouldTrip_ = false;

    auxillaryBatteryVoltage_ = 0;
    motorVoltage_ = 0;
    arrayVoltage_ = 0;
    lvVoltage_ = 0;
    chargeVoltage_ = 0;
    commonCurrent_ = 0;
    motorCurrent_ = 0;
    arrayCurrent_ = 0;
    lvCurrent_ = 0;
    chargeCurrent_ = 0;

    highCellVoltageTrip_ = false;
    lowCellVoltageTrip_ = false;
    highCommonCurrentTrip_ = false;
    motorHighTemperatureCurrentTrip_ = false;
    arrayHighTemperatureCurrentTrip_ = false;
    lvHighTemperatureCurrentTrip_ = false;
    chargeHighTemperatureCurrentTrip_ = false;
    protectionTrip_ = false;
    orionMessageTimeoutTrip_ = false;
    contactorDisconnectedUnexpectedlyTrip_ = false;
}

void MbmsPacket::populatePacket(const QByteArray& data) {
    unsigned char contactorStatus = getValue<unsigned char>(data, CONTACTOR_STATUS_OFFSET);
    commonContactorState_ = contactorStatus & COMMON_CONTACTOR_STATE_OFFSET;
    motorContactorState_ = contactorStatus & MOTOR_CONTACTOR_STATE_OFFSET;
    arrayContactorState_ = contactorStatus & ARRAY_CONTACTOR_STATE_OFFSET;
    lvContactorState_ = contactorStatus & LV_CONTACTOR_STATE_OFFSET;
    chargeContactorState_ = contactorStatus & CHARGE_CONTACTOR_STATE_OFFSET;

    unsigned char contactorError = getValue<unsigned char>(data, CONTACTOR_ERROR_OFFSET);
    commonContactorError_ = contactorError & COMMON_CONTACTOR_ERROR_OFFSET;
    motorContactorError_ = contactorError & MOTOR_CONTACTOR_ERROR_OFFSET;
    arrayContactorError_ = contactorError & ARRAY_CONTACTOR_ERROR_OFFSET;
    lvContactorError_ = contactorError & LV_CONTACTOR_ERROR_OFFSET;
    chargeContactorError_ = contactorError & CHARGE_CONTACTOR_ERROR_OFFSET;

    unsigned char miscStatus = getValue<unsigned char>(data, MISCELLANOUS_STATUS);
    strobeBmsLight_ = miscStatus & STROBE_BMS_LIGHT_OFFSET;
    allowCharge_ = miscStatus & ALLOW_CHARGE_OFFSET;
    highVoltageEnableState_ = miscStatus & HIGH_VOLTAGE_ENABLE_STATE_OFFSET;
    allowDischarge_ = miscStatus & ALLOW_DISCHARGE_OFFSET;
    orionCanReceivedRecently_ = miscStatus & ORION_CAN_RECEIVED_RECENTLY_OFFSET;
    dischargeShouldTrip_ = miscStatus & DISCHARGE_SHOULD_TRIP_OFFSET;
    chargeShouldTrip_ = miscStatus & CHARGE_SHOULD_TRIP_OFFSET;

    auxillaryBatteryVoltage_ = getValue<unsigned short>(data, AUXILIARY_BATTERY_VOLTAGE_OFFSET);
    motorVoltage_ = getValue<unsigned short>(data, MOTOR_VOLTAGE_OFFSET);
    arrayVoltage_ = getValue<unsigned short>(data, ARRAY_VOLTAGE_OFFSET);
    lvVoltage_ = getValue<unsigned short>(data, LV_VOLTAGE_OFFSET);
    chargeVoltage_ = getValue<unsigned short>(data, CHARGE_VOLTAGE_OFFSET);
    commonCurrent_ = getValue<unsigned short>(data, COMMON_CURRENT_OFFSET);
    motorCurrent_ = getValue<unsigned short>(data, MOTOR_CURRENT_OFFSET);
    arrayCurrent_ = getValue<unsigned short>(data, ARRAY_CURRENT_OFFSET);
    lvCurrent_ = getValue<unsigned short>(data, LV_CURRENT_OFFSET);
    chargeCurrent_ = getValue<unsigned short>(data, CHARGE_CURRENT_OFFSET);

    unsigned short tripFlags = getValue<unsigned short>(data, TRIP_FLAGS_OFFSET);
    highCellVoltageTrip_ = tripFlags & HIGH_CELL_VOLTAGE_TRIP_OFFSET;
    lowCellVoltageTrip_ = tripFlags & LOW_CELL_VOLTAGE_TRIP_OFFSET;
    highCommonCurrentTrip_ = tripFlags & HIGH_COMMON_CURRENT_TRIP_OFFSET;
    motorHighTemperatureCurrentTrip_ = tripFlags & MOTOR_HIGH_TEMPERATURE_CURRENT_TRIP_OFFSET;
    arrayHighTemperatureCurrentTrip_ = tripFlags & ARRAY_HIGH_TEMPERATURE_CURRENT_TRIP_OFFSET;
    lvHighTemperatureCurrentTrip_ = tripFlags & LV_HIGH_TEMPERATURE_CURRENT_TRIP_OFFSET;
    chargeHighTemperatureCurrentTrip_ = tripFlags & CHARGE_HIGH_TEMPERATURE_CURRENT_TRIP_OFFSET;
    protectionTrip_ = tripFlags & PROTECTION_TRIP_OFFSET;
    orionMessageTimeoutTrip_ = tripFlags & ORION_MESSAGE_TIMEOUT_TRIP_OFFSET;
    contactorDisconnectedUnexpectedlyTrip_ = tripFlags & CONTACTOR_DISCONNECTED_UNEXPECTEDLY_TRIP_OFFSET;
}

QJsonObject MbmsPacket::toJson() {
    QJsonObject json;
    
    json[JsonDefinitions::COMMON_CONTACTOR_STATE] = commonContactorState_;
    json[JsonDefinitions::MOTOR_CONTACTOR_STATE] = motorContactorState_;
    json[JsonDefinitions::ARRAY_CONTACTOR_STATE] = arrayContactorState_;
    json[JsonDefinitions::LV_CONTACTOR_STATE] = lvContactorState_;
    json[JsonDefinitions::CHARGE_CONTACTOR_STATE] = chargeContactorState_;

    json[JsonDefinitions::COMMON_CONTACTOR_ERROR] = commonContactorError_;
    json[JsonDefinitions::MOTOR_CONTACTOR_ERROR] = motorContactorError_;
    json[JsonDefinitions::ARRAY_CONTACTOR_ERROR] = arrayContactorError_;
    json[JsonDefinitions::LV_CONTACTOR_ERROR] = lvContactorError_;
    json[JsonDefinitions::CHARGE_CONTACTOR_ERROR] = chargeContactorError_;

    json[JsonDefinitions::STROBE_BMS_LIGHT] = strobeBmsLight_;
    json[JsonDefinitions::ALLOW_CHARGE] = allowCharge_;
    json[JsonDefinitions::HIGH_VOLTAGE_ENABLE_STATE] = highVoltageEnableState_;
    json[JsonDefinitions::ALLOW_DISCHARGE] = allowDischarge_;
    json[JsonDefinitions::ORION_CAN_RECEIVED_RECENTLY] = orionCanReceivedRecently_;
    json[JsonDefinitions::DISCHARGE_SHOULD_TRIP] = dischargeShouldTrip_;
    json[JsonDefinitions::CHARGE_SHOULD_TRIP] = chargeShouldTrip_;

    json[JsonDefinitions::AUXILLARY_BATTERY_VOLTAGE] = auxillaryBatteryVoltage_;
    json[JsonDefinitions::MOTOR_VOLTAGE] = motorVoltage_;
    json[JsonDefinitions::ARRAY_VOLTAGE] = arrayVoltage_;
    json[JsonDefinitions::LV_VOLTAGE] = lvVoltage_;
    json[JsonDefinitions::CHARGE_VOLTAGE] = chargeVoltage_;
    json[JsonDefinitions::COMMON_CURRENT] = commonCurrent_;
    json[JsonDefinitions::MOTOR_CURRENT] = motorCurrent_;
    json[JsonDefinitions::ARRAY_CURRENT] = arrayCurrent_;
    json[JsonDefinitions::LV_CURRENT] = lvCurrent_;
    json[JsonDefinitions::CHARGE_CURRENT] = chargeCurrent_;

    json[JsonDefinitions::HIGH_CELL_VOLTAGE_TRIP] = highCellVoltageTrip_;
    json[JsonDefinitions::LOW_CELL_VOLTAGE_TRIP] = lowCellVoltageTrip_;
    json[JsonDefinitions::HIGH_COMMON_CURRENT_TRIP] = highCommonCurrentTrip_;
    json[JsonDefinitions::MOTOR_HIGH_TEMPERATURE_CURRENT_TRIP] = motorHighTemperatureCurrentTrip_;
    json[JsonDefinitions::ARRAY_HIGH_TEMPERATURE_CURRENT_TRIP] = arrayHighTemperatureCurrentTrip_;
    json[JsonDefinitions::LV_HIGH_TEMPERATURE_CURRENT_TRIP] = lvHighTemperatureCurrentTrip_;
    json[JsonDefinitions::CHARGE_HIGH_TEMPERATURE_CURRENT_TRIP] = chargeHighTemperatureCurrentTrip_;
    json[JsonDefinitions::PROTECTION_TRIP] = protectionTrip_;
    json[JsonDefinitions::ORION_MESSAGE_TIMEOUT_TRIP] = orionMessageTimeoutTrip_;
    json[JsonDefinitions::CONTACTOR_DISCONNECTED_UNEXPECTEDLY_TRIP] = contactorDisconnectedUnexpectedlyTrip_;

    return json;
}