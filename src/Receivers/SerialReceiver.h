#ifndef SERIALRECEIVER_H
#define SERIALRECEIVER_H

#include <QObject>
#include <QSerialPort>
#include <QTimer>
#include "../PacketFactory/PacketFactory.h"

class SerialReceiver : public QObject {
    Q_OBJECT
public:
    SerialReceiver(PacketFactory* packetFactory);
    ~SerialReceiver();

signals:
    void dataReceived(const QByteArray& data);

private slots:
    void handleReadyRead();

private:
    QSerialPort *serialPort_;
    PacketFactory* packetFactory_;

    void retryConnection();
    void attemptReconnect();
};

#endif // SERIALRECEIVER_H
