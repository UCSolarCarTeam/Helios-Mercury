#ifndef SERIALRECEIVER_H
#define SERIALRECEIVER_H

#include <QObject>
#include <QSerialPort>
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
    void handleError(QSerialPort::SerialPortError error);
    void attemptReconnect();

private:
    QSerialPort *serialPort_;
    PacketFactory* packetFactory_;
    QString portName_;

    void setupSerialPort();
    void retryConnection();
};

#endif // SERIALRECEIVER_H
