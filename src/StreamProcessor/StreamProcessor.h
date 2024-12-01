#ifndef STREAMPROCESSOR_H
#define STREAMPROCESSOR_H

#include "../Receivers/SerialReceiver.h"
#include "../PacketFactory/PacketFactory.h"

#include <QObject>
#include <QByteArray>

class StreamProcessor : public QObject{
    Q_OBJECT
public:
    StreamProcessor(SerialReceiver* serialReceiver, PacketFactory* packetFactory);

public slots:
    void processData(const QByteArray& data);

private:
    QByteArray extractPacket();
    QByteArray decodePacket(QByteArray packet);
    bool isValidChecksum(QByteArray& decodedPacket);
    void validateAndForwardPacket(QByteArray& packetBody);

    QByteArray buffer_;
    PacketFactory* packetFactory_;
};

#endif // STREAMPROCESSOR_H