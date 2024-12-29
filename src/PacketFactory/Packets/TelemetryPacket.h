#ifndef TELEMETRYPACKET_H
#define TELEMETRYPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class TelemetryPacket : public IPacket {
    Q_OBJECT
    DEFINE_PROPERTY(unsigned short, GpsYear)
    DEFINE_PROPERTY(unsigned char, GpsMonth)
    DEFINE_PROPERTY(unsigned char, GpsDay)
    DEFINE_PROPERTY(unsigned char, GpsHour)
    DEFINE_PROPERTY(unsigned char, GpsMinute)
    DEFINE_PROPERTY(unsigned char, GpsSecond)
    DEFINE_PROPERTY(unsigned char, GpsValidityFlags)
    DEFINE_PROPERTY(unsigned char, GpsFixStatusFlags)
    DEFINE_PROPERTY(unsigned char, GpsAdditionalFlags)
    DEFINE_PROPERTY(int, GpsLongitude)
    DEFINE_PROPERTY(int, GpsLatitude)
    DEFINE_PROPERTY(unsigned short, MpuAccelerationX)
    DEFINE_PROPERTY(unsigned short, MpuAccelerationY)
    DEFINE_PROPERTY(unsigned short, MpuAccelerationZ)
    DEFINE_PROPERTY(unsigned short, MpuRotationX)
    DEFINE_PROPERTY(unsigned short, MpuRotationY)
    DEFINE_PROPERTY(unsigned short, MpuRotationZ)
    DEFINE_PROPERTY(unsigned short, MpuTemperature)
public:
    TelemetryPacket();
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;
};

#endif // TELEMETRYPACKET_H