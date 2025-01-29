#ifndef MESSAGETRANSMITTER_H
#define MESSAGETRANSMITTER_H

#include <QByteArray>
#include <QMqttClient>
#include <QObject>

class MessageTransmitter : public QObject {
    Q_OBJECT
public:
    MessageTransmitter();

    void setupTelemetryClient();
    bool isTelemetryConnected();

public slots:
    void transmitMessage(const QByteArray& message);

private:
    QMqttClient* telemetryClient_;
    QString telemetryTopic_;
    bool telemetryConnected_ = false;
};

#endif // MESSAGETRANSMITTER_H
