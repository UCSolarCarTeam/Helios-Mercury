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
    explicit SerialReceiver(PacketFactory* packetFactory);
    ~SerialReceiver();
    void setPortPath(const QString &path);

signals:
    void dataReceived(const QByteArray& data);

private slots:
    void handleReadyRead();

private:
    void tryConnect();
    void checkPortAvailability();

    QSerialPort* serialPort_;
    PacketFactory* packetFactory_;
    QString portName_;
    bool connected_;

    QFileSystemWatcher* devWatcher_;

    QTimer* retryTimer_;
};

#endif // SERIALRECEIVER_H
