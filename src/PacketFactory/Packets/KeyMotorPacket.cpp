#include "KeyMotorPacket.h"
#include "../../Config/JsonDefinitions.h"

KeyMotorPacket::KeyMotorPacket() {
    // Motor Drive Command
    setKeyMotorVelocity(0.0f);
    setMotorCurrent(0.0f);

    // Motor Power Command
    setBusCurrentOut(0.0f);

    initializeIdActionMap();
}

QJsonObject KeyMotorPacket::toJson() {
    QJsonObject json;

    // Motor Drive Command
    json[JsonDefinitions::KEY_MOTOR_VELOCITY] = KeyMotorVelocity_;
    json[JsonDefinitions::MOTOR_CURRENT] = MotorCurrent_;

    // Motor Power Command
    json[JsonDefinitions::BUS_CURRENT_OUT] = BusCurrentOut_;
    return json;
}

void KeyMotorPacket::populatePacket(const QByteArray& data) {
}

void KeyMotorPacket::initializeIdActionMap() {
    // Motor Drive Command - 0x501
    idActionMap[0x501] = {
        [this](QByteArray payload){
            float velocity = getValue<float>(payload, 0);
            setKeyMotorVelocity(velocity);
            float current = getValue<float>(payload, 4);
            setMotorCurrent(current);
        }
    };

    // Motor Power Command - 0x502
    idActionMap[0x502] = {
        [this](QByteArray payload){
            float busCurrent = getValue<float>(payload, 4);
            setBusCurrentOut(busCurrent);
        }
    };

    // // Motor Reset Command - 0x503 (Unused)
    // idActionMap[0x503] = {
    //     [this](QByteArray /*payload*/){
    //     }
    // };
}
