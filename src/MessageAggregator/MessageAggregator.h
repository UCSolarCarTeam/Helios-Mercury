#ifndef MESSAGEAGGREGATOR_H
#define MESSAGEAGGREGATOR_H

#include "../MessageTransmitter/MessageTransmitter.h"
#include "../PacketFactory/PacketFactory.h"

#include <QTimer>
#include <QByteArray>
#include <QObject>

class MessageAggregator : public QObject {
    Q_OBJECT
public:
    MessageAggregator(MessageTransmitter* messageTransmitter, PacketFactory* packetFactory, QObject* parent = nullptr);
    void startTransmission();

signals:
    void jsonPacketReady(const QByteArray& message);

private slots:
    void createJsonMessage();

private:
    MessageTransmitter* messageTransmitter_;
    PacketFactory* packetFactory_;
    QTimer timer_;
};

#endif // MESSAGEAGGREGATOR_H