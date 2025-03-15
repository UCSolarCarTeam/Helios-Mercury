#ifndef PIPACKET_H
#define PIPACKET_H

#include <QJsonObject>

#include "../../Config/PropertyDefinitions.h"

class PiPacket : public QObject{
    Q_OBJECT
    DEFINE_PROPERTY(int, Rfid);
    DEFINE_PROPERTY(QString, DriverName);
public:
    PiPacket();
    QJsonObject toJson();
};

#endif // PIPACKET_H
