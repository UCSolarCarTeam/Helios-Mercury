#ifndef MESSAGETRANSMITTER_H
#define MESSAGETRANSMITTER_H

#include "../PacketFactory/Packets/PiPacket.h"

#include <QByteArray>
#include <QMqttClient>
#include <QObject>

class MessageTransmitter : public QObject {
    Q_OBJECT
public:
    MessageTransmitter(PiPacket* piPacket);

    void setupTelemetryClient();

public slots:
    void transmitMessage(const QByteArray& message);

private:
    QMqttClient* telemetryClient_;
    QString telemetryTopic_;

    PiPacket* piPacket_;
};

#endif // MESSAGETRANSMITTER_H
