#include "ContactorPacket.h"
#include "../../Config/JsonDefinitions.h"

ContactorPacket::ContactorPacket() {
    // Heartbeats
    setCommonHeartbeat(false);
    setMotorHeartbeat(false);
    setArrayHeartbeat(false);
    setLvHeartbeat(false);
    setChargeHeartbeat(false);

    // Common Board Status
    setCommonPrechargerClosed(false);
    setCommonPrechargerClosing(false);
    setCommonPrechargerError(false);
    setCommonContactorClosed(false);
    setCommonContactorClosing(false);
    setCommonContactorError(false);
    setCommonLineCurrent(0);
    setCommonChargeCurrent(0);
    setCommonContactorOpeningError(false);

    // Motor Board Status
    setMotorPrechargerClosed(false);
    setMotorPrechargerClosing(false);
    setMotorPrechargerError(false);
    setMotorContactorClosed(false);
    setMotorContactorClosing(false);
    setMotorContactorError(false);
    setMotorLineCurrent(0);
    setMotorChargeCurrent(0);
    setMotorBPSError(false);

    // Array Board Status
    setArrayPrechargerClosed(false);
    setArrayPrechargerClosing(false);
    setArrayPrechargerError(false);
    setArrayContactorClosed(false);
    setArrayContactorClosing(false);
    setArrayContactorError(false);
    setArrayLineCurrent(0);
    setArrayChargeCurrent(0);
    setArrayBPSError(false);

    // LV Board Status
    setLvPrechargerClosed(false);
    setLvPrechargerClosing(false);
    setLvPrechargerError(false);
    setLvContactorClosed(false);
    setLvContactorClosing(false);
    setLvContactorError(false);
    setLvLineCurrent(0);
    setLvChargeCurrent(0);
    setLvBpsError(false);

    // Charge Board Status
    setChargePrechargerClosed(false);
    setChargePrechargerClosing(false);
    setChargePrechargerError(false);
    setChargeContactorClosed(false);
    setChargeContactorClosing(false);
    setChargeContactorError(false);
    setChargeLineCurrent(0);
    setChargeChargeCurrent(0);
    setChargeBPSError(false);

    initializeIdActionMap();
}

void ContactorPacket::populatePacket(const QByteArray& data) {
}

QJsonObject ContactorPacket::toJson() {
    QJsonObject json;
    // Heartbeats
    json["CommonHeartbeat"] = CommonHeartbeat_;
    json["MotorHeartbeat"] = MotorHeartbeat_;
    json["ArrayHeartbeat"] = ArrayHeartbeat_;
    json["LvHeartbeat"] = LvHeartbeat_;
    json["ChargeHeartbeat"] = ChargeHeartbeat_;

    // Common Board Status
    json["CommonPrechargerClosed"] = CommonPrechargerClosed_;
    json["CommonPrechargerClosing"] = CommonPrechargerClosing_;
    json["CommonPrechargerError"] = CommonPrechargerError_;
    json["CommonContactorClosed"] = CommonContactorClosed_;
    json["CommonContactorClosing"] = CommonContactorClosing_;
    json["CommonContactorError"] = CommonContactorError_;
    json["CommonLineCurrent"] = CommonLineCurrent_;
    json["CommonChargeCurrent"] = CommonChargeCurrent_;
    json["CommonContactorOpeningError"] = CommonContactorOpeningError_;

    // Motor Board Status
    json["MotorPrechargerClosed"] = MotorPrechargerClosed_;
    json["MotorPrechargerClosing"] = MotorPrechargerClosing_;
    json["MotorPrechargerError"] = MotorPrechargerError_;
    json["MotorContactorClosed"] = MotorContactorClosed_;
    json["MotorContactorClosing"] = MotorContactorClosing_;
    json["MotorContactorError"] = MotorContactorError_;
    json["MotorLineCurrent"] = MotorLineCurrent_;
    json["MotorChargeCurrent"] = MotorChargeCurrent_;
    json["MotorBPSError"] = MotorBPSError_;

    // Array Board Status
    json["ArrayPrechargerClosed"] = ArrayPrechargerClosed_;
    json["ArrayPrechargerClosing"] = ArrayPrechargerClosing_;
    json["ArrayPrechargerError"] = ArrayPrechargerError_;
    json["ArrayContactorClosed"] = ArrayContactorClosed_;
    json["ArrayContactorClosing"] = ArrayContactorClosing_;
    json["ArrayContactorError"] = ArrayContactorError_;
    json["ArrayLineCurrent"] = ArrayLineCurrent_;
    json["ArrayChargeCurrent"] = ArrayChargeCurrent_;
    json["ArrayBPSError"] = ArrayBPSError_;

    // LV Board Status
    json["LvPrechargerClosed"] = LvPrechargerClosed_;
    json["LvPrechargerClosing"] = LvPrechargerClosing_;
    json["LvPrechargerError"] = LvPrechargerError_;
    json["LvContactorClosed"] = LvContactorClosed_;
    json["LvContactorClosing"] = LvContactorClosing_;
    json["LvContactorError"] = LvContactorError_;
    json["LvLineCurrent"] = LvLineCurrent_;
    json["LvChargeCurrent"] = LvChargeCurrent_;
    json["LvBpsError"] = LvBpsError_;

    // Charge Board Status
    json["ChargePrechargerClosed"] = ChargePrechargerClosed_;
    json["ChargePrechargerClosing"] = ChargePrechargerClosing_;
    json["ChargePrechargerError"] = ChargePrechargerError_;
    json["ChargeContactorClosed"] = ChargeContactorClosed_;
    json["ChargeContactorClosing"] = ChargeContactorClosing_;
    json["ChargeContactorError"] = ChargeContactorError_;
    json["ChargeLineCurrent"] = ChargeLineCurrent_;
    json["ChargeChargeCurrent"] = ChargeChargeCurrent_;
    json["ChargeBPSError"] = ChargeBPSError_;

    return json;
}

void ContactorPacket::initializeIdActionMap() {
    // Common Heartbeat - 0x200
    idActionMap[0x200] = {
        [this](QByteArray payload){
            bool heartbeat = getValue<bool>(payload, 0);
            setCommonHeartbeat(heartbeat & 0x01);
        }
    };

    // Motor Heartbeat - 0x201
    idActionMap[0x201] = {
        [this](QByteArray payload){
            bool heartbeat = getValue<bool>(payload, 0);
            setMotorHeartbeat(heartbeat & 0x01);
        }
    };

    // Array Heartbeat - 0x202
    idActionMap[0x202] = {
        [this](QByteArray payload){
            bool heartbeat = getValue<bool>(payload, 0);
            setArrayHeartbeat(heartbeat & 0x01);
        }
    };

    // LV Heartbeat - 0x203
    idActionMap[0x203] = {
        [this](QByteArray payload){
            bool heartbeat = getValue<bool>(payload, 0);
            setLvHeartbeat(heartbeat & 0x01);
        }
    };

    // Charge Heartbeat - 0x204
    idActionMap[0x204] = {
        [this](QByteArray payload){
            bool heartbeat = getValue<bool>(payload, 0);
            setChargeHeartbeat(heartbeat & 0x01);
        }
    };

    // Common Board Status - 0x210
    idActionMap[0x210] = {
        [this](QByteArray payload){
            quint32 common = getValue<quint32>(payload, 0);
            setCommonPrechargerClosed(common & 0x01);
            setCommonPrechargerClosing((common >> 1) & 0x01);
            setCommonPrechargerError((common >> 2) & 0x01);
            setCommonContactorClosed((common >> 3) & 0x01);
            setCommonContactorClosing((common >> 4) & 0x01);
            setCommonContactorError((common >> 5) & 0x01);
            setCommonLineCurrent((common >> 6) & 0xFFF);
            setCommonChargeCurrent((common >> 18) & 0xFFF);
            setCommonContactorOpeningError((common >> 30) & 0x01);
        }
    };

    // Motor Board Status - 0x211
    idActionMap[0x211] = {
        [this](QByteArray payload){
            quint32 motor = getValue<quint32>(payload, 0);
            setMotorPrechargerClosed(motor & 0x01);
            setMotorPrechargerClosing((motor >> 1) & 0x01);
            setMotorPrechargerError((motor >> 2) & 0x01);
            setMotorContactorClosed((motor >> 3) & 0x01);
            setMotorContactorClosing((motor >> 4) & 0x01);
            setMotorContactorError((motor >> 5) & 0x01);
            setMotorLineCurrent((motor >> 6) & 0xFFF); 
            setMotorChargeCurrent((motor >> 18) & 0xFFF); 
            setMotorBPSError((motor >> 30) & 0x01);
        }
    };

    // Array Board Status - 0x212
    idActionMap[0x212] = {
        [this](QByteArray payload){
            quint32 array = getValue<quint32>(payload, 0);
            setArrayPrechargerClosed(array & 0x01);
            setArrayPrechargerClosing((array >> 1) & 0x01);
            setArrayPrechargerError((array >> 2) & 0x01);
            setArrayContactorClosed((array >> 3) & 0x01);
            setArrayContactorClosing((array >> 4) & 0x01);
            setArrayContactorError((array >> 5) & 0x01);
            setArrayLineCurrent((array >> 6) & 0xFFF); 
            setArrayChargeCurrent((array >> 18) & 0xFFF); 
            setArrayBPSError((array >> 30) & 0x01);
        }
    };

    // LV Board Status - 0x213
    idActionMap[0x213] = {
        [this](QByteArray payload){
            quint32 lv = getValue<quint32>(payload, 0);
            setLvPrechargerClosed(lv & 0x01);
            setLvPrechargerClosing((lv >> 1) & 0x01);
            setLvPrechargerError((lv >> 2) & 0x01);
            setLvContactorClosed((lv >> 3) & 0x01);
            setLvContactorClosing((lv >> 4) & 0x01);
            setLvContactorError((lv >> 5) & 0x01);
            setLvLineCurrent((lv >> 6) & 0xFFF);    
            setLvChargeCurrent((lv >> 18) & 0xFFF);    
            setLvBpsError((lv >> 30) & 0x01);
        }
    };

    // Charge Board Status - 0x214
    idActionMap[0x214] = {
        [this](QByteArray payload){
            quint32 charge = getValue<quint32>(payload, 0);
            setChargePrechargerClosed(charge & 0x01);
            setChargePrechargerClosing((charge >> 1) & 0x01);
            setChargePrechargerError((charge >> 2) & 0x01);
            setChargeContactorClosed((charge >> 3) & 0x01);
            setChargeContactorClosing((charge >> 4) & 0x01);
            setChargeContactorError((charge >> 5) & 0x01);
            setChargeLineCurrent((charge >> 6) & 0xFFF);
            setChargeChargeCurrent((charge >> 18) & 0xFFF);
            setChargeBPSError((charge >> 30) & 0x01);
        }
    };
}
