#include "TelemetryReceiver.h"
#include "../Config/ConfigManager.h"

#include <QTimer>
#include <QJsonDocument>

/** Initilize receiver mqtt client to receive messages */
TelemetryReceiver::TelemetryReceiver(PiPacket* piPacket) {
    piPacket_ = piPacket;
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
        client_->subscribe(ConfigManager::instance().getReceiverTopic());
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
    qDebug() << "onMessageReceived called with topic:" << topic.name();
    qDebug() << "Message content:" << message;
    
    if(topic.name() == ConfigManager::instance().getPingTopic()) {
        sendPong();
    } else if(topic.name() == ConfigManager::instance().getReceiverTopic()) {
        handleTelemetryMessage(message);
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

void TelemetryReceiver::handleTelemetryMessage(const QByteArray& message) {
    qDebug() << "Telemetry message received: " << message;
    
    QJsonParseError parseError;
    QJsonDocument jsonDoc = QJsonDocument::fromJson(message, &parseError);

    if (parseError.error != QJsonParseError::NoError) {
        qWarning() << "ERROR - Failed to parse Telemetry message:" << parseError.errorString();
        return;
    }

    if (!jsonDoc.isObject()) {
        qWarning() << "Telemetry message is not an object";
        return;
    }

    QJsonObject jsonObj = jsonDoc.object();

    // Extract carLatency
    if (jsonObj.contains("carLatency")) {
        if (jsonObj["carLatency"].isString()) {
            bool ok;
            int carLatency = jsonObj["carLatency"].toString().toInt(&ok);
            if (ok) {
                piPacket_->setLatency(carLatency);
            } else {
                qWarning() << "ERROR - Failed to convert carLatency to integer.";
            }
        } else {
            qWarning() << "ERROR - carLatency is not a string.";
        }
    } else {
        qWarning() << "ERROR - carLatency key is missing.";
    }

    // Extract driver name
    if (jsonObj.contains("driverName") && jsonObj["driverName"].isString()) {
        piPacket_->setDriverName(jsonObj["driverName"].toString());
    } else {
        qWarning() << "ERROR - driverName key is missing or invalid.";
    }
}
