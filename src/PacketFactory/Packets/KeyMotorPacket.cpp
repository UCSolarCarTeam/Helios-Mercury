#include "KeyMotorPacket.h"
#include "../../Config/JsonDefinitions.h"

namespace {
    const int MOTOR_SETPOINT_OFFSET = 1;
    const int CONTROL_BITS_OFFSET = 3;

    const char CONTROL_MODE_MASK = 0x01;
    const char MOTOR_MODE_MASK = 0x02;
    const char SOFTWARE_ENABLE_MASK = 0x04;
    const char DEBUG_MODE_MASK = 0x08;
}

KeyMotorPacket::KeyMotorPacket() {}

void KeyMotorPacket::populatePacket(const QByteArray& data) {
    motorSetpoint_ = getValue<unsigned short>(data, MOTOR_SETPOINT_OFFSET);

    unsigned char controlBits = getValue<unsigned char>(data, CONTROL_BITS_OFFSET);
    controlMode_ = controlBits & CONTROL_MODE_MASK;
    motorMode_ = controlBits & MOTOR_MODE_MASK;
    softwareEnable_ = controlBits & SOFTWARE_ENABLE_MASK;
    debugMode_ = controlBits & DEBUG_MODE_MASK;
}

QJsonObject KeyMotorPacket::toJson() {
    QJsonObject json;
    
    json[JsonDefinitions::MOTOR_SETPOINT] = motorSetpoint_;
    json[JsonDefinitions::CONTROL_MODE] = controlMode_;
    json[JsonDefinitions::MOTOR_MODE] = motorMode_;
    json[JsonDefinitions::SOFTWARE_ENABLE] = softwareEnable_;
    json[JsonDefinitions::DEBUG_MODE] = debugMode_;

    return json;
}