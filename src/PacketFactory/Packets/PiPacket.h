#ifndef PIPACKET_H
#define PIPACKET_H

#include "../../Config/PropertyDefinitions.h"
#include <QJsonObject>


class PiPacket : public QObject {
    Q_OBJECT
    DEFINE_PROPERTY(bool, EmbeddedState)
    DEFINE_PROPERTY(bool, AWSState)
    DEFINE_PROPERTY(QString, Rfid)
    DEFINE_PROPERTY(QString, DriverName)

public:
    PiPacket();
    QJsonObject toJson();
};

#endif // PIPACKET_H
