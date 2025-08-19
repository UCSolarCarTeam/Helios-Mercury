#ifndef PIPACKET_H
#define PIPACKET_H

#include <QJsonObject>

#include "../../Config/PropertyDefinitions.h"

class PiPacket : public QObject{
    Q_OBJECT
    DEFINE_PROPERTY(QString, Rfid)
    DEFINE_PROPERTY(QString, DriverName)
    DEFINE_PROPERTY(int, Latency)
    DEFINE_PROPERTY(bool, isTelemetryConnected)
    DEFINE_PROPERTY(bool, IsCanConnected)
public:
    PiPacket();
    QJsonObject toJson();
};

#endif // PIPACKET_H
