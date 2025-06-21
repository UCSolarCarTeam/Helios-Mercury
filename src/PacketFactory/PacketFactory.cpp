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
    piPacket_.reset(new PiPacket());
    contactorPacket_.reset(new ContactorPacket());
    mpptPacket_.reset(new MpptPacket());

    for (int i = 0; i < config.getNumberOfMotors(); i++) {
        motorDetailsPackets_.append(new MotorDetailsPacket());
    }
}

PacketFactory::~PacketFactory() {
    qDeleteAll(motorDetailsPackets_);
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

PiPacket& PacketFactory::getPiPacket(){
    return *piPacket_;
}

MotorDetailsPacket& PacketFactory::getMotorDetailsPacket(int index) {
    return *motorDetailsPackets_[index];
}

MpptPacket& PacketFactory::getMpptPacket() {
    return *mpptPacket_;
}

ContactorPacket& PacketFactory::getContactorPacket() {
    return *contactorPacket_;
}
