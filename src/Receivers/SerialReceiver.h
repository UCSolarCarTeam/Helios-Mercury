#ifndef SERIALRECEIVER_H
#define SERIALRECEIVER_H

#include <QObject>
#include <QSerialPort>
#include <QFileSystemWatcher>
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
    void onDevDirectoryChanged();

private:
    void tryConnect();
    void checkPortAvailability();

    QSerialPort* serialPort_;
    PacketFactory* packetFactory_;
    QString portName_;
    bool connected_;

    QFileSystemWatcher* devWatcher_;
};

#endif // SERIALRECEIVER_H
