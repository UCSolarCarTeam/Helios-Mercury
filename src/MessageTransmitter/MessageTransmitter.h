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

public slots:
    void transmitMessage(const QByteArray& message);

private:
    QMqttClient* telemetryClient_;
    QString telemetryTopic_;
};

#endif // MESSAGETRANSMITTER_H