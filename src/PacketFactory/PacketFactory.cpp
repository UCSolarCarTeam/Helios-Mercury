#include "PacketFactory.h"
#include "../Config/ConfigManager.h"

PacketFactory::PacketFactory() {
    ConfigManager& config = ConfigManager::instance();

    keyMotorPacket_.reset(new KeyMotorPacket());
    telemetryPacket_.reset(new TelemetryPacket());
    proximitySensorsPacket_.reset(new ProximitySensorsPacket());
    batteryPacket_.reset(new BatteryPacket());
    mbmsPacket_.reset(new MbmsPacket());
    batteryFaultsPacket_.reset(new BatteryFaultsPacket());
    b3Packet_.reset(new B3Packet());

    for (int i = 0; i < config.getNumberOfMotors(); i++) {
        motorDetailsPackets_.append(new MotorDetailsPacket());
    }

    for (int i = 0; i < config.getNumberOfMppts(); i++) {
        mpptPackets_.append(new MpptPacket());
    }

    piPacket_.reset(new PiPacket());

}

PacketFactory::~PacketFactory() {
    qDeleteAll(motorDetailsPackets_);
    qDeleteAll(mpptPackets_);
}

//Getters
KeyMotorPacket& PacketFactory::getKeyMotorPacket() {
    return *keyMotorPacket_;
}

TelemetryPacket& PacketFactory::getTelemetryPacket() {
    return *telemetryPacket_;
}

ProximitySensorsPacket& PacketFactory::getProximitySensorsPacket() {
    return *proximitySensorsPacket_;
}

BatteryPacket& PacketFactory::getBatteryPacket() {
    return *batteryPacket_;
}

MbmsPacket& PacketFactory::getMbmsPacket() {
    return *mbmsPacket_;
}

BatteryFaultsPacket& PacketFactory::getBatteryFaultsPacket() {
    return *batteryFaultsPacket_;
}

B3Packet& PacketFactory::getB3Packet() {
    return *b3Packet_;
}

MotorDetailsPacket& PacketFactory::getMotorDetailsPacket(int index) {
    return *motorDetailsPackets_[index];
}

MpptPacket& PacketFactory::getMpptPacket(int index) {
    return *mpptPackets_[index];
}

PiPacket& PacketFactory::getPiPacket() {
    return *piPacket_;
}
