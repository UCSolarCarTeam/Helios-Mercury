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
    void resetEmbeddedActive(); // Slot to reset activity status

private:
    QSerialPort *serialPort_;
    bool embeddedActive_ = false;
    QTimer embeddedActivityTimer_;
};

#endif // SERIALRECEIVER_H
