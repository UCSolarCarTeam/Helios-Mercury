#ifndef SERIALRECEIVER_H
#define SERIALRECEIVER_H

#include <QObject>
#include <QSerialPort>
#include <QTimer>

class SerialReceiver : public QObject {
    Q_OBJECT
public:
    SerialReceiver();
    ~SerialReceiver();

signals:
    void dataReceived(const QByteArray& data);

private slots:
    void handleReadyRead();

private:
    QSerialPort *serialPort_;
};

#endif // SERIALRECEIVER_H
