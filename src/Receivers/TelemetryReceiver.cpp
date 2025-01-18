#include "TelemetryReceiver.h"
#include "../Config/ConfigManager.h"

#include <QTimer>

/** Initilize receiver mqtt client to receive messages */
TelemetryReceiver::TelemetryReceiver() {
    client_ = new QMqttClient(this);
    setup();
}

TelemetryReceiver::~TelemetryReceiver() {
    client_->disconnect();
    delete client_;
}

/** 
 * Setup mqtt client to receive messages 
 * On failure will retry connecting every 5s
 * On success will subscribe to ping topic
 */
void TelemetryReceiver::setup() {
    ConfigManager& config = ConfigManager::instance();

    client_->setHostname(config.getTelemetryHostname());
    client_->setPort(config.getTelemetryPort());
    client_->setUsername(config.getTelemetryUsername());
    client_->setPassword(config.getTelemetryPassword());

    QObject::connect(client_, &QMqttClient::connected, [this]() {
        qDebug() << "Connection to RECEIVER Service Established";
        client_->subscribe(ConfigManager::instance().getPingTopic());

    });

    QObject::connect(client_, &QMqttClient::disconnected, [this]() {
        qDebug() << "Connection to RECEIVER Service Failed - retrying in 5s...";
        QTimer::singleShot(5000, [this]() {
            client_->connectToHost();
        });
    });

    connect(client_, &QMqttClient::messageReceived, this, &TelemetryReceiver::onMessageReceived);

    client_->connectToHost();
}

/** 
 *  Handle message based on topic, will serve more of a purpose if/when
 *  we receive more than just pings
 */
void TelemetryReceiver::onMessageReceived(const QByteArray& message, const QMqttTopicName& topic) {
    if(topic.name() == ConfigManager::instance().getPingTopic()) {
        sendPong();
    } else{
        qDebug() << "Message received to unregistered topic: " << topic.name();
        qDebug() << "message content: " << message;
    }
}

/** Send pong message back to telemetry */
void TelemetryReceiver::sendPong() {
    if(client_->state() == QMqttClient::Connected) {
        //pong with a inspirational quote
        client_->publish(ConfigManager::instance().getPongTopic(), QByteArray("'Go, prick thy face and over-red thy fear, / Thou lily-livered boy' (Macbeth, 5.3)"));
    }
}
