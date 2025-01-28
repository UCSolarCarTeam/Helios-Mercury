#include "PacketFactory.h"
#include "../Config/ConfigManager.h"
#include "../MessageTransmitter/MessageTransmitter.h"
#include "../Receivers/SerialReceiver.h"

PacketFactory::PacketFactory() {
    ConfigManager& config = ConfigManager::instance();

    keyMotorPacket_.reset(new KeyMotorPacket());
    telemetryPacket_.reset(new TelemetryPacket());
    proximitySensorsPacket_.reset(new ProximitySensorsPacket());
    batteryPacket_.reset(new BatteryPacket());
    mbmsPacket_.reset(new MbmsPacket());
    batteryFaultsPacket_.reset(new BatteryFaultsPacket());
    b3Packet_.reset(new B3Packet());

    // serialReceiver_ = std::make_unique<SerialReceiver>();
    messageTransmitter_ = std::make_unique<MessageTransmitter>();
    connectionStatusPacket_.reset(new ConnectionStatusPacket(messageTransmitter_.get(), nullptr));

    for (int i = 0; i < config.getNumberOfMotors(); i++) {
        motorDetailsPackets_.append(new MotorDetailsPacket());
    }

    for (int i = 0; i < config.getNumberOfMppts(); i++) {
        mpptPackets_.append(new MpptPacket());
    }

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

ConnectionStatusPacket& PacketFactory::getConnectionStatusPacket() {
    return *connectionStatusPacket_;
}

MotorDetailsPacket& PacketFactory::getMotorDetailsPacket(int index) {
    return *motorDetailsPackets_[index];
}

MpptPacket& PacketFactory::getMpptPacket(int index) {
    return *mpptPackets_[index];
}
