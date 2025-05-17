#ifndef CANRECEIVER_H
#define CANRECEIVER_H

#include <QObject>
#include <QCanBusDevice>
#include "../PacketFactory/PacketFactory.h"

class CanReceiver : public QObject {
    Q_OBJECT
public:
    CanReceiver(PacketFactory* packetFactory);
    ~CanReceiver();

private slots:
    void handleReadyRead();

private:
    QCanBusDevice *canDevice_;
    PacketFactory* packetFactory_;
};

#endif // CANRECEIVER_H
