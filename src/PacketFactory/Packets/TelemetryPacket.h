#ifndef TELEMETRYPACKET_H
#define TELEMETRYPACKET_H

#include "../IPacket.h"

class TelemetryPacket : public IPacket {
public:
    TelemetryPacket();
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;

private:
    unsigned short gpsYear_;
    unsigned char gpsMonth_;
    unsigned char gpsDay_;
    unsigned char gpsHour_;
    unsigned char gpsMinute_;
    unsigned char gpsSecond_;
    unsigned char gpsValidityFlags_;
    unsigned char gpsFixStatusFlags_;
    unsigned char gpsAdditionalFlags_;
    int gpsLongitude_;
    int gpsLatitude_;
    unsigned short mpuAccelerationX_;
    unsigned short mpuAccelerationY_;
    unsigned short mpuAccelerationZ_;
    unsigned short mpuRotationX_;
    unsigned short mpuRotationY_;
    unsigned short mpuRotationZ_;
    unsigned short mpuTemperature_;
};

#endif // TELEMETRYPACKET_H