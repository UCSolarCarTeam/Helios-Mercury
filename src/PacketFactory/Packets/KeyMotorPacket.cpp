#include "KeyMotor.h"
#include "../../Config/JsonDefinitions.h"
#include <cstring>

KeyMotor::KeyMotor() {
    // Motor Drive Command
    setMotorVelocity(0.0f);
    setMotorCurrent(0.0f);
    setBusCurrentOut(0.0f);

    // Motor Power Command
    initializeIdActionMap();
}

QJsonObject KeyMotor::toJson() {
    QJsonObject json;

    // Motor Drive Command
    json[JsonDefinitions::MOTOR_VELOCITY] = MotorVelocity_;
    json[JsonDefinitions::MOTOR_CURRENT] = MotorCurrent_;

    // Motor Power Command
    json[JsonDefinitions::BUS_CURRENT_OUT] = BusCurrentOut_;
    return json;
}

void KeyMotor::initializeIdActionMap() {
    // Motor Drive Command - 0x501
    idActionMap[0x501] = {
        [this](QByteArray payload){
            float velocity = getValue<float>(payload, 0);
            setMotorVelocity(velocity);
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
