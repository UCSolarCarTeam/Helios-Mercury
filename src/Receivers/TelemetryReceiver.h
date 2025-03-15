#ifndef TELEMETRYRECEIVER_H
#define TELEMETRYRECEIVER_H

#include <QObject>
#include <QMqttClient>

class TelemetryReceiver : public QObject {
    Q_OBJECT
public:
    TelemetryReceiver();
    ~TelemetryReceiver();

private slots:
    void onMessageReceived(const QByteArray& message, const QMqttTopicName& topic);

private:
    void sendPong();
    void handleTelemetryMessage(const QByteArray& message);
    void setup();

    QMqttClient* client_;
};

#endif // TELEMETRYRECEIVER_H
