#include "MessageTransmitter.h"
#include "../Config/ConfigManager.h"

#include <QTimer>

namespace {
    const int RETRY_PERIOD = 5000; // milliseconds
}

MessageTransmitter::MessageTransmitter(PiPacket* piPacket) {
    piPacket_ = piPacket;
    telemetryClient_ = new QMqttClient();
    setupTelemetryClient();
}

/** Transmit message to both telemetry MQTT services if connected */
void MessageTransmitter::transmitMessage(const QByteArray& message) {
    if(telemetryClient_->state() == QMqttClient::Connected) {
        qDebug() << "Publishing to TELEMETRY MQTT Service";
        telemetryClient_->publish(telemetryTopic_, message);
    }
}

/** 
 * Setup Telemetry MQTT client
 * requires hostname, port, username, password, and topic
 * will retry connecting every 5s if connection fails
 */
void MessageTransmitter::setupTelemetryClient() {
    ConfigManager& config = ConfigManager::instance();

    telemetryClient_->setHostname(config.getTelemetryHostname());
    telemetryClient_->setPort(config.getTelemetryPort());
    telemetryClient_->setUsername(config.getTelemetryUsername());
    telemetryClient_->setPassword(config.getTelemetryPassword());
    telemetryTopic_ = config.getTelemetryTopic();

    QObject::connect(telemetryClient_, &QMqttClient::connected, [this]() {
        qDebug() << "Connection to TELEMETRY MQTT Service Established";
        piPacket_->setisTelemetryConnected(true);
    });

    QObject::connect(telemetryClient_, &QMqttClient::disconnected, [this]() {
        qDebug() << "Connection to TELEMETRY MQTT Service Failed - retrying in 5s...";
        piPacket_->setisTelemetryConnected(false);
        QTimer::singleShot(RETRY_PERIOD, [this]() {
            telemetryClient_->connectToHost();
        });
    });

    telemetryClient_->connectToHost();
}
