#ifndef TELEMETRYRECEIVER_H
#define TELEMETRYRECEIVER_H

#include <QObject>
#include <QMqttClient>

#include "../PacketFactory/Packets/PiPacket.h"

class TelemetryReceiver : public QObject {
    Q_OBJECT
public:
    TelemetryReceiver(PiPacket* piPacket);
    ~TelemetryReceiver();

private slots:
    void onMessageReceived(const QByteArray& message, const QMqttTopicName& topic);

private:
    void sendPong();
    void handleTelemetryMessage(const QByteArray& message);
    void setup();

    QMqttClient* client_;
    PiPacket* piPacket_;
};

#endif // TELEMETRYRECEIVER_H
