#ifndef SERIALRECEIVER_H
#define SERIALRECEIVER_H

#include <QObject>
#include <QSerialPort>
#include <QTimer>
#include "../PacketFactory/PacketFactory.h"

class SerialReceiver : public QObject {
    Q_OBJECT

public:
    explicit SerialReceiver(PacketFactory* packetFactory);
    ~SerialReceiver();

signals:
    void dataReceived(const QByteArray& data);

private slots:
    void handleReadyRead();
    void checkConnection();
    void tryConnect();

private:
    QSerialPort* serialPort_;
    PacketFactory* packetFactory_;
    QString portName_;
    bool connected_;

    QTimer* monitorTimer_; // Timer for continuous monitoring
};

#endif // SERIALRECEIVER_H
