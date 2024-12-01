#include "MessageAggregator.h"
#include "../Config/ConfigManager.h"
#include "../Config/JsonDefinitions.h"

#include <QJsonDocument>

MessageAggregator::MessageAggregator(MessageTransmitter* messageTransmitter, PacketFactory* packetFactory, QObject* parent) 
    : QObject(parent), messageTransmitter_(messageTransmitter), packetFactory_(packetFactory) {
    
    //Connects timer to createJsonMessage slot so that it fires every period of time defined in config.ini
    connect(&timer_, &QTimer::timeout, this, &MessageAggregator::createJsonMessage);

    //Connects jsonPacketReady signal to transmitMessage slot in MessageTransmitter
    connect(this, &MessageAggregator::jsonPacketReady, messageTransmitter_, &MessageTransmitter::transmitMessage);
}

/** Merges all packet json into one Json Message then emits signal to transmit */
void MessageAggregator::createJsonMessage() {
    QJsonObject message;

    message[JsonDefinitions::TITLE] = ConfigManager::instance().getPacketTitle();
    message[JsonDefinitions::TIMESTAMP] = QDateTime::currentDateTime().toString("yyyy-MM-dd HH:mm:ss");

    message[JsonDefinitions::KEY_MOTOR] = packetFactory_->getKeyMotorPacket().toJson();
    message[JsonDefinitions::B3] = packetFactory_->getB3Packet().toJson();
    message[JsonDefinitions::TELEMETRY] = packetFactory_->getTelemetryPacket().toJson();
    message[JsonDefinitions::BATTERY_FAULTS] = packetFactory_->getBatteryFaultsPacket().toJson();
    message[JsonDefinitions::BATTERY] = packetFactory_->getBatteryPacket().toJson();
    message[JsonDefinitions::MBMS] = packetFactory_->getMbmsPacket().toJson();
    message[JsonDefinitions::PROXIMITY_SENSORS] = packetFactory_->getProximitySensorsPacket().toJson();

    for(int i = 0; i < ConfigManager::instance().getNumberOfMotors(); i++) {
        message[JsonDefinitions::MOTOR_DETAILS + QString::number(i)] = packetFactory_->getMotorDetailsPacket(i).toJson();
    }

    for(int i = 0; i < ConfigManager::instance().getNumberOfMppts(); i++) {
        message[JsonDefinitions::MPPT + QString::number(i)] = packetFactory_->getMpptPacket(i).toJson();
    }
    
    emit jsonPacketReady(QJsonDocument(message).toJson(QJsonDocument::Compact));
}

/** Begin transmission timer, fires every 0.5s by default */
void MessageAggregator::startTransmission() {
    ConfigManager& config = ConfigManager::instance();
    timer_.start(config.getForwardPeriod());
}