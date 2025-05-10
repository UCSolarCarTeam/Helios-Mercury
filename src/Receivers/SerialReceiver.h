#ifndef SERIALRECEIVER_H
#define SERIALRECEIVER_H

#include <QObject>
#include <QSerialPort>
#include <QFileSystemWatcher>
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
    void tryConnect();

    QSerialPort* serialPort_;
    PacketFactory* packetFactory_;
    QString portName_;

    QFileSystemWatcher* devWatcher_;

    QTimer* retryTimer_;
};

#endif // SERIALRECEIVER_H
