#ifndef PIPACKET_H
#define PIPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"
#include <QByteArray>

class PiPacket : public IPacket {
    Q_OBJECT
    DEFINE_PROPERTY(QByteArray, RfidData)

public:
    PiPacket();
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;
    QByteArray getRfidData() const;

private:
    QByteArray rfidData_;  // Member variable for RFID data
};

#endif // PIPACKET_H
