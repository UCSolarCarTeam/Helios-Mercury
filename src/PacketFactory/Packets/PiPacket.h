#ifndef PIPACKET_H
#define PIPACKET_H

#include "../../Config/PropertyDefinitions.h"
#include <QJsonObject>


class PiPacket : public IPacket {
    Q_OBJECT
    DEFINE_PROPERTY(bool, EmbeddedState)
    DEFINE_PROPERTY(bool, AWSState)
    DEFINE_PROPERTY(QString, Rfid)
    DEFINE_PROPERTY(QString, DriverName)

public:
    PiPacket();
    void populateTelemetry(const bool state);
    void populateEmbedded(const bool state);
    QJsonObject toJson();
}

#endif // PIPACKET_H
