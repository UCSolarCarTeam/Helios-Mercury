#ifndef CANRECEIVER_H
#define CANRECEIVER_H

#include <QObject>
#include <QCanBusDevice>

class CanReceiver : public QObject {
    Q_OBJECT
public:
    CanReceiver();
    ~CanReceiver();

private slots:
    void handleReadyRead();

private:
    QCanBusDevice *canDevice_;
};

#endif // CANRECEIVER_H
