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

    bool isEmbeddedActive() const;

signals:
    void dataReceived(const QByteArray& data);

private slots:
    void handleReadyRead();

private:
    QSerialPort *serialPort_;
    bool embeddedActive_ = false;
};

#endif // SERIALRECEIVER_H
