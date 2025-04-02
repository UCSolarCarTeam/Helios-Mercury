#ifndef MESSAGETRANSMITTER_H
#define MESSAGETRANSMITTER_H

#include <QByteArray>
#include <QMqttClient>
#include <QObject>
#include "../PacketFactory/PacketFactory.h"

class MessageTransmitter : public QObject {
    Q_OBJECT
public:
    MessageTransmitter(PacketFactory* packetFactory);

    void setupTelemetryClient();

public slots:
    void transmitMessage(const QByteArray& message);

private:
    QMqttClient* telemetryClient_;
    QString telemetryTopic_;

    PacketFactory* packetFactory_;

};

#endif // MESSAGETRANSMITTER_H
