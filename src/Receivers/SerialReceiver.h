#ifndef SERIALRECEIVER_H
#define SERIALRECEIVER_H

#include <QObject>
#include <QSerialPort>
#include <atomic>
#include <thread>
#include "../PacketFactory/PacketFactory.h"

class SerialReceiver : public QObject {
    Q_OBJECT

public:
    explicit SerialReceiver(PacketFactory* packetFactory);
    ~SerialReceiver();

signals:
    void dataReceived(const QByteArray &data);

private slots:
    void handleReadyRead();
    void tryConnect();
    void disconnectPort();

private:
    void monitorPortAvailability(); // Thread function

    PacketFactory* packetFactory_;
    QSerialPort* serialPort_;
    QString portName_;
    bool connected_;

    std::atomic<bool> monitoring_;
    std::thread monitorThread_;
};

#endif // SERIALRECEIVER_H
