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

KeyMotorPacket::KeyMotorPacket() {
    setMotorSetpoint(0);
    setControlMode(false);
    setMotorMode(false);
    setSoftwareEnable(false);
    setDebugMode(false);
}

void KeyMotorPacket::populatePacket(const QByteArray& data) {
    setMotorSetpoint(getValue<unsigned short>(data, MOTOR_SETPOINT_OFFSET));

    unsigned char controlBits = getValue<unsigned char>(data, CONTROL_BITS_OFFSET);
    setControlMode(controlBits & CONTROL_MODE_MASK);
    setMotorMode(controlBits & MOTOR_MODE_MASK);
    setSoftwareEnable(controlBits & SOFTWARE_ENABLE_MASK);
    setDebugMode(controlBits & DEBUG_MODE_MASK);
}

QJsonObject KeyMotorPacket::toJson() {
    QJsonObject json;
    
    json[JsonDefinitions::MOTOR_SETPOINT] = MotorSetpoint_;
    json[JsonDefinitions::CONTROL_MODE] = ControlMode_;
    json[JsonDefinitions::MOTOR_MODE] = MotorMode_;
    json[JsonDefinitions::SOFTWARE_ENABLE] = SoftwareEnable_;
    json[JsonDefinitions::DEBUG_MODE] = DebugMode_;

    return json;
}