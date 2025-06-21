#ifndef PACKETFACTORY_H
#define PACKETFACTORY_H

#include "Packets/KeyMotorPacket.h"
#include "Packets/TelemetryPacket.h"
#include "Packets/MotorDetailsPacket.h"
#include "Packets/MpptPacket.h"
#include "Packets/ProximitySensorsPacket.h"
#include "Packets/BatteryPacket.h"
#include "Packets/MbmsPacket.h"
#include "Packets/BatteryFaultsPacket.h"
#include "Packets/B3Packet.h"
#include "Packets/PiPacket.h"
#include "Packets/ContactorPacket.h"

#include <QScopedPointer>

class PacketFactory {

public:
    PacketFactory();
    ~PacketFactory();

    KeyMotorPacket& getKeyMotorPacket();
    TelemetryPacket& getTelemetryPacket();
    ProximitySensorsPacket& getProximitySensorsPacket();
    BatteryPacket& getBatteryPacket();
    MbmsPacket& getMbmsPacket();
    BatteryFaultsPacket& getBatteryFaultsPacket();
    B3Packet& getB3Packet();
    PiPacket& getPiPacket();
    ContactorPacket& getContactorPacket();

    MotorDetailsPacket& getMotorDetailsPacket(int index);
    MpptPacket& getMpptPacket(int index);

private:
    QScopedPointer<KeyMotorPacket> keyMotorPacket_;
    QScopedPointer<TelemetryPacket> telemetryPacket_;
    QScopedPointer<ProximitySensorsPacket> proximitySensorsPacket_;
    QScopedPointer<BatteryPacket> batteryPacket_;
    QScopedPointer<MbmsPacket> mbmsPacket_;
    QScopedPointer<BatteryFaultsPacket> batteryFaultsPacket_;
    QScopedPointer<B3Packet> b3Packet_;
    QScopedPointer<PiPacket> piPacket_;
    QScopedPointer<ContactorPacket> contactorPacket_;

    //amounts defined in config.ini
    QVector<MotorDetailsPacket*> motorDetailsPackets_;
    QVector<MpptPacket*> mpptPackets_;
};

#endif // PACKETFACTORY_H