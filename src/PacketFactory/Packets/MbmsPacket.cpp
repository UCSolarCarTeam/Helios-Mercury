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
    // Base/Heartbeat
    setHeartbeat(false);
    
    // Contactor Commands
    setCommonContactorCommand(false);
    setMotorContactorCommand(false);
    setArrayContactorCommand(false);
    setLvContactorCommand(false);
    setChargeContactorCommand(false);
    
    // MBMS Status
    setAuxiliaryBatteryVoltage(0);
    setStrobeBmsLight(false);
    setChargeEnable(false);
    setChargeSafety(false);
    setDischargeEnable(false);
    setOrionCanReceivedRecently(false);
    setDischargeShouldTrip(false);
    setChargeShouldTrip(false);
    setStartupState(0);
    setSystemState(0);
    
    // Power Selection Status
    setMainPowerSwitch(false);
    setExternalShutdown(false);
    setEn1(false);
    setDcdcFault(false);
    setThreeAOc(false);
    setDcdcOn(false);
    setChgFault(false);
    setChgOn(false);
    setChgLvEn(false);
    setAbattDisable(false);
    setKey(false);
    
    // MBMS Trip
    setHighCellVoltageTrip(false);
    setLowCellVoltageTrip(false);
    setCommonHighCurrentTrip(false);
    setMotorHighCurrentTrip(false);
    setArrayHighCurrentTrip(false);
    setLvHighCurrentTrip(false);
    setChargeHighCurrentTrip(false);
    setProtectionTrip(false);
    setOrionMessageTimeoutTrip(false);
    setContactorDisconnectedUnexpectedlyTrip(false);
    setContactorConnectedUnexpectedlyTrip(false);
    setCommonHeartbeatDeadTrip(false);
    setMotorHeartbeatDeadTrip(false);
    setArrayHeartbeatDeadTrip(false);
    setLvHeartbeatDeadTrip(false);
    setChargeHeartbeatDeadTrip(false);
    setMpsDisabledTrip(false);
    setEsdEnabledTrip(false);
    setHighTemperatureTrip(false);
    setLowTemperatureTrip(false);
    
    // MBMS Warnings
    setHighCellVoltageWarning(false);
    setLowCellVoltageWarning(false);
    setCommonHighCurrentWarning(false);
    setMotorHighCurrentWarning(false);
    setArrayHighCurrentWarning(false);
    setLvHighCurrentWarning(false);
    setChargeHighCurrentWarning(false);
    setHighTemperatureWarning(false);
    setLowTemperatureWarning(false);
    setCanOc12VWarning(false);

    initializeIdActionMap();
}

void MbmsPacket::populatePacket(const QByteArray& data) {
}

QJsonObject MbmsPacket::toJson() {
    QJsonObject json;
    
    // Base/Heartbeat
    json[JsonDefinitions::HEARTBEAT] = Heartbeat_;
    
    // Contactor Commands
    json[JsonDefinitions::COMMON_CONTACTOR_COMMAND] = CommonContactorCommand_;
    json[JsonDefinitions::MOTOR_CONTACTOR_COMMAND] = MotorContactorCommand_;
    json[JsonDefinitions::ARRAY_CONTACTOR_COMMAND] = ArrayContactorCommand_;
    json[JsonDefinitions::LV_CONTACTOR_COMMAND] = LvContactorCommand_;
    json[JsonDefinitions::CHARGE_CONTACTOR_COMMAND] = ChargeContactorCommand_;
    
    // MBMS Status
    json[JsonDefinitions::AUXILIARY_BATTERY_VOLTAGE] = AuxiliaryBatteryVoltage_;
    json[JsonDefinitions::STROBE_BMS_LIGHT] = StrobeBmsLight_;
    json[JsonDefinitions::CHARGE_ENABLE] = ChargeEnable_;
    json[JsonDefinitions::CHARGE_SAFETY] = ChargeSafety_;
    json[JsonDefinitions::DISCHARGE_ENABLE] = DischargeEnable_;
    json[JsonDefinitions::ORION_CAN_RECEIVED_RECENTLY] = OrionCanReceivedRecently_;
    json[JsonDefinitions::DISCHARGE_SHOULD_TRIP] = DischargeShouldTrip_;
    json[JsonDefinitions::CHARGE_SHOULD_TRIP] = ChargeShouldTrip_;
    json[JsonDefinitions::STARTUP_STATE] = StartupState_;
    json[JsonDefinitions::SYSTEM_STATE] = SystemState_;
    
    // Power Selection Status
    json[JsonDefinitions::MAIN_POWER_SWITCH] = MainPowerSwitch_;
    json[JsonDefinitions::EXTERNAL_SHUTDOWN] = ExternalShutdown_;
    json[JsonDefinitions::EN1] = En1_;
    json[JsonDefinitions::DCDC_FAULT] = DcdcFault_;
    json[JsonDefinitions::THREE_A_OC] = ThreeAOc_;
    json[JsonDefinitions::DCDC_ON] = DcdcOn_;
    json[JsonDefinitions::CHG_FAULT] = ChgFault_;
    json[JsonDefinitions::CHG_ON] = ChgOn_;
    json[JsonDefinitions::CHG_LV_EN] = ChgLvEn_;
    json[JsonDefinitions::ABATT_DISABLE] = AbattDisable_;
    json[JsonDefinitions::KEY] = Key_;
    
    // MBMS Trip
    json[JsonDefinitions::HIGH_CELL_VOLTAGE_TRIP] = HighCellVoltageTrip_;
    json[JsonDefinitions::LOW_CELL_VOLTAGE_TRIP] = LowCellVoltageTrip_;
    json[JsonDefinitions::COMMON_HIGH_CURRENT_TRIP] = CommonHighCurrentTrip_;
    json[JsonDefinitions::MOTOR_HIGH_CURRENT_TRIP] = MotorHighCurrentTrip_;
    json[JsonDefinitions::ARRAY_HIGH_CURRENT_TRIP] = ArrayHighCurrentTrip_;
    json[JsonDefinitions::LV_HIGH_CURRENT_TRIP] = LvHighCurrentTrip_;
    json[JsonDefinitions::CHARGE_HIGH_CURRENT_TRIP] = ChargeHighCurrentTrip_;
    json[JsonDefinitions::PROTECTION_TRIP] = ProtectionTrip_;
    json[JsonDefinitions::ORION_MESSAGE_TIMEOUT_TRIP] = OrionMessageTimeoutTrip_;
    json[JsonDefinitions::CONTACTOR_DISCONNECTED_UNEXPECTEDLY_TRIP] = ContactorDisconnectedUnexpectedlyTrip_;
    json[JsonDefinitions::CONTACTOR_CONNECTED_UNEXPECTEDLY_TRIP] = ContactorConnectedUnexpectedlyTrip_;
    json[JsonDefinitions::COMMON_HEARTBEAT_DEAD_TRIP] = CommonHeartbeatDeadTrip_;
    json[JsonDefinitions::MOTOR_HEARTBEAT_DEAD_TRIP] = MotorHeartbeatDeadTrip_;
    json[JsonDefinitions::ARRAY_HEARTBEAT_DEAD_TRIP] = ArrayHeartbeatDeadTrip_;
    json[JsonDefinitions::LV_HEARTBEAT_DEAD_TRIP] = LvHeartbeatDeadTrip_;
    json[JsonDefinitions::CHARGE_HEARTBEAT_DEAD_TRIP] = ChargeHeartbeatDeadTrip_;
    json[JsonDefinitions::MPS_DISABLED_TRIP] = MpsDisabledTrip_;
    json[JsonDefinitions::ESD_ENABLED_TRIP] = EsdEnabledTrip_;
    json[JsonDefinitions::HIGH_TEMPERATURE_TRIP] = HighTemperatureTrip_;
    json[JsonDefinitions::LOW_TEMPERATURE_TRIP] = LowTemperatureTrip_;
    
    // MBMS Warnings
    json[JsonDefinitions::HIGH_CELL_VOLTAGE_WARNING] = HighCellVoltageWarning_;
    json[JsonDefinitions::LOW_CELL_VOLTAGE_WARNING] = LowCellVoltageWarning_;
    json[JsonDefinitions::COMMON_HIGH_CURRENT_WARNING] = CommonHighCurrentWarning_;
    json[JsonDefinitions::MOTOR_HIGH_CURRENT_WARNING] = MotorHighCurrentWarning_;
    json[JsonDefinitions::ARRAY_HIGH_CURRENT_WARNING] = ArrayHighCurrentWarning_;
    json[JsonDefinitions::LV_HIGH_CURRENT_WARNING] = LvHighCurrentWarning_;
    json[JsonDefinitions::CHARGE_HIGH_CURRENT_WARNING] = ChargeHighCurrentWarning_;
    json[JsonDefinitions::HIGH_TEMPERATURE_WARNING] = HighTemperatureWarning_;
    json[JsonDefinitions::LOW_TEMPERATURE_WARNING] = LowTemperatureWarning_;
    json[JsonDefinitions::CAN_OC_12V_WARNING] = CanOc12VWarning_;

    return json;
}

void MbmsPacket::initializeIdActionMap() {
    qDebug() << "Initializing MBMS Packet ID Action Map";
    
    // Base/Heartbeat - 0x100
    idActionMap[0x100] = {
        [this](QByteArray payload){
            unsigned char heartbeat = getValue<unsigned char>(payload, 0);
            setHeartbeat(heartbeat & 0x01);
        }
    };
    
    // Contactor Command - 0x101
    idActionMap[0x101] = {
        [this](QByteArray payload){
            unsigned char contactorCommands = getValue<unsigned char>(payload, 0);
            setCommonContactorCommand(contactorCommands & 0x01); // Bit 0
            setMotorContactorCommand(contactorCommands & 0x02); // Bit 1
            setArrayContactorCommand(contactorCommands & 0x04); // Bit 2
            setLvContactorCommand(contactorCommands & 0x08); // Bit 3
            setChargeContactorCommand(contactorCommands & 0x10); // Bit 4
        }
    };
    
    // MBMS Status - 0x102
    idActionMap[0x102] = {
        [this](QByteArray payload){
            // Bits 0-4: VAuxiliary Battery Voltage
            setAuxiliaryBatteryVoltage(getValue<unsigned char>(payload, 0) & 0x1F);
            
            unsigned char statusByte1 = getValue<unsigned char>(payload, 0);
            setStrobeBmsLight(statusByte1 & 0x20); // Bit 5
            setChargeEnable(statusByte1 & 0x40); // Bit 6
            setChargeSafety(statusByte1 & 0x80); // Bit 7
            
            unsigned char statusByte2 = getValue<unsigned char>(payload, 1);
            setDischargeEnable(statusByte2 & 0x01); // Bit 8
            setOrionCanReceivedRecently(statusByte2 & 0x02); // Bit 9
            setDischargeShouldTrip(statusByte2 & 0x04); // Bit 10
            setChargeShouldTrip(statusByte2 & 0x08); // Bit 11
            
            // Bits 12-15: Startup State
            setStartupState((statusByte2 & 0xF0) >> 4);
            unsigned char statusByte3 = getValue<unsigned char>(payload, 2);

            // Bits 16-18: System State (Car State)
            setSystemState(statusByte3 & 0x07);
        }
    };
    
    // Power Selection Status - 0x103
    idActionMap[0x103] = {
        [this](QByteArray payload){
            unsigned short powerStatus = getValue<unsigned short>(payload, 0);
            setMainPowerSwitch(!(powerStatus & 0x0001));    // Bit 0 (inverted)
            setExternalShutdown(powerStatus & 0x0002);      // Bit 1
            setEn1(powerStatus & 0x0004);                   // Bit 2
            setDcdcFault(!(powerStatus & 0x0008));          // Bit 3 (inverted)
            setThreeAOc(!(powerStatus & 0x0010));           // Bit 4 (inverted)
            setDcdcOn(!(powerStatus & 0x0020));             // Bit 5 (inverted)
            setChgFault(!(powerStatus & 0x0040));           // Bit 6 (inverted)
            setChgOn(!(powerStatus & 0x0080));              // Bit 7 (inverted)
            setChgLvEn(!(powerStatus & 0x0100));            // Bit 8 (inverted)
            setAbattDisable(powerStatus & 0x0200);          // Bit 9
            setKey(powerStatus & 0x0400);                   // Bit 10
        }
    };
    
    // MBMS Trip - 0x104
    idActionMap[0x104] = {
        [this](QByteArray payload){
            unsigned int tripFlags = getValue<unsigned int>(payload, 0);
            
            setHighCellVoltageTrip(tripFlags & 0x00000001);                    // Bit 0
            setLowCellVoltageTrip(tripFlags & 0x00000002);                     // Bit 1
            setCommonHighCurrentTrip(tripFlags & 0x00000004);                  // Bit 2
            setMotorHighCurrentTrip(tripFlags & 0x00000008);                   // Bit 3
            setArrayHighCurrentTrip(tripFlags & 0x00000010);                   // Bit 4
            setLvHighCurrentTrip(tripFlags & 0x00000020);                      // Bit 5
            setChargeHighCurrentTrip(tripFlags & 0x00000040);                  // Bit 6
            setProtectionTrip(tripFlags & 0x00000080);                         // Bit 7
            setOrionMessageTimeoutTrip(tripFlags & 0x00000100);                // Bit 8
            setContactorDisconnectedUnexpectedlyTrip(tripFlags & 0x00000200);  // Bit 9
            setContactorConnectedUnexpectedlyTrip(tripFlags & 0x00000400);     // Bit 10
            setCommonHeartbeatDeadTrip(tripFlags & 0x00000800);                // Bit 11
            setMotorHeartbeatDeadTrip(tripFlags & 0x00001000);                 // Bit 12
            setArrayHeartbeatDeadTrip(tripFlags & 0x00002000);                 // Bit 13
            setLvHeartbeatDeadTrip(tripFlags & 0x00004000);                    // Bit 14
            setChargeHeartbeatDeadTrip(tripFlags & 0x00008000);                // Bit 15
            setMpsDisabledTrip(tripFlags & 0x00010000);                        // Bit 16
            setEsdEnabledTrip(tripFlags & 0x00020000);                         // Bit 17
            setHighTemperatureTrip(tripFlags & 0x00040000);                    // Bit 18
            setLowTemperatureTrip(tripFlags & 0x00080000);                     // Bit 19
        }
    };
    
    // MBMS Soft Battery Limit Warning - 0x105
    idActionMap[0x105] = {
        [this](QByteArray payload){
            unsigned short warningFlags = getValue<unsigned short>(payload, 0);
            
            setHighCellVoltageWarning(warningFlags & 0x0001);
            setLowCellVoltageWarning(warningFlags & 0x0002);
            setCommonHighCurrentWarning(warningFlags & 0x0004);
            setMotorHighCurrentWarning(warningFlags & 0x0008);
            setArrayHighCurrentWarning(warningFlags & 0x0010);
            setLvHighCurrentWarning(warningFlags & 0x0020);
            setChargeHighCurrentWarning(warningFlags & 0x0040);
            setHighTemperatureWarning(warningFlags & 0x0080);
            setLowTemperatureWarning(warningFlags & 0x0100);
            setCanOc12VWarning(warningFlags & 0x0200);
        }
    };
}
