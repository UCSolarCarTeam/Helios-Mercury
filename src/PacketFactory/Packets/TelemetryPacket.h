#ifndef TELEMETRYPACKET_H
#define TELEMETRYPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

namespace TelemetryIds {
    static constexpr quint32 GPS_TIME = 0x630;
    static constexpr quint32 GPS_FLAGS = 0x631;
    static constexpr quint32 GPS_POSITION = 0x632;
    static constexpr quint32 MPU_ACCELERATION = 0x633;
    static constexpr quint32 MPU_GYRO = 0x634;
    static constexpr quint32 MPU_TEMPERATURE = 0x635;
}

// 2) Byte‐offsets within each PGN’s payload
namespace {
// GPS Time
    static constexpr int GPS_YEAR_OFFSE = 0;
    static constexpr int GPS_MONTH_OFFSET = 2;
    static constexpr int GPS_DAY_OFFSE = 3;
    static constexpr int GPS_HOUR_OFFS = 4;
    static constexpr int GPS_MINUTE_OFFSET = 5;
    static constexpr int GPS_SECOND_OFFSET = 6;

    // GPS Flags
    static constexpr int GPS_VALIDITY_FLAGS_OFFSET = 0;
    static constexpr int GPS_FIX_STATUS_FLAGS_OFFSET = 1;
    static constexpr int GPS_ADDITIONAL_FLAGS_OFFSET = 2;

    // GPS Position
    static constexpr int GPS_LONGITUDE_OFFSET = 0;
    static constexpr int GPS_LATITUDE_OFFSET = 4;

    // MPU Acceleration
    static constexpr int MPU_ACCELERATION_X_OFFSET = 0;
    static constexpr int MPU_ACCELERATION_Y_OFFSET = 2;
    static constexpr int MPU_ACCELERATION_Z_OFFSET = 4;

    // MPU Gyroscope
    static constexpr int MPU_ROTATION_X_OFFSET = 0;
    static constexpr int MPU_ROTATION_Y_OFFSET = 2;
    static constexpr int MPU_ROTATION_Z_OFFSET = 4;

    // MPU Temperature
    static constexpr int MPU_TEMPERATURE_OFFSET = 0;
}

class TelemetryPacket : public IPacket {
    Q_OBJECT
    // 3) Properties for each field (getter, setter, signal)
    DEFINE_PROPERTY(quint16, GpsYear)
    DEFINE_PROPERTY(quint8, GpsMonth)
    DEFINE_PROPERTY(quint8, GpsDay)
    DEFINE_PROPERTY(quint8, GpsHour)
    DEFINE_PROPERTY(quint8, GpsMinute)
    DEFINE_PROPERTY(quint8, GpsSecond)
    DEFINE_PROPERTY(unsigned char, GpsValidityFlags)
    DEFINE_PROPERTY(unsigned char, GpsFixStatusFlags)
    DEFINE_PROPERTY(unsigned char, GpsAdditionalFlags)
    DEFINE_PROPERTY(float, GpsLongitude)
    DEFINE_PROPERTY(float, GpsLatitude)
    DEFINE_PROPERTY(unsigned short, MpuAccelerationX)
    DEFINE_PROPERTY(unsigned short, MpuAccelerationY)
    DEFINE_PROPERTY(unsigned short, MpuAccelerationZ)
    DEFINE_PROPERTY(unsigned short, MpuRotationX)
    DEFINE_PROPERTY(unsigned short, MpuRotationY)
    DEFINE_PROPERTY(unsigned short, MpuRotationZ)
    DEFINE_PROPERTY(unsigned short, MpuTemperature)

public:
    // 4) Inline constructor: register all handlers in one place
    TelemetryPacket() {
        // GPS Time PGN = 0x630
        DEFINE_HANDLER(TelemetryIds::GPS_TIME, quint16, GpsYear, GPS_YEAR_OFFSET)
        DEFINE_HANDLER(TelemetryIds::GPS_TIME, quint8, GpsMonth, GPS_MONTH_OFFSET)
        DEFINE_HANDLER(TelemetryIds::GPS_TIME, quint8, GpsDay, GPS_DAY_OFFSET)
        DEFINE_HANDLER(TelemetryIds::GPS_TIME, quint8, GpsHour, GPS_HOUR_OFFSET)
        DEFINE_HANDLER(TelemetryIds::GPS_TIME, quint8, GpsMinute, GPS_MINUTE_OFFSET)
        DEFINE_HANDLER(TelemetryIds::GPS_TIME, quint8, GpsSecond, GPS_SECOND_OFFSET)

        // GPS Flags PGN = 0x631
        DEFINE_HANDLER(TelemetryIds::GPS_FLAGS, unsigned char, GpsValidityFlags, GPS_VALIDITY_FLAGS_OFFSET)
        DEFINE_HANDLER(TelemetryIds::GPS_FLAGS, unsigned char, GpsFixStatusFlags, GPS_FIX_STATUS_FLAGS_OFFSET)
        DEFINE_HANDLER(TelemetryIds::GPS_FLAGS, unsigned char, GpsAdditionalFlags, GPS_ADDITIONAL_FLAGS_OFFSET)

        // GPS Position PGN = 0x632
        DEFINE_HANDLER(TelemetryIds::GPS_POSITION, float, GpsLongitude, GPS_LONGITUDE_OFFSET)
        DEFINE_HANDLER(TelemetryIds::GPS_POSITION, float, GpsLatitude, GPS_LATITUDE_OFFSET)

        // MPU Acceleration PGN = 0x633
        DEFINE_HANDLER(TelemetryIds::MPU_ACCELERATION, unsigned short, MpuAccelerationX, MPU_ACCELERATION_X_OFFSET)
        DEFINE_HANDLER(TelemetryIds::MPU_ACCELERATION, unsigned short, MpuAccelerationY, MPU_ACCELERATION_Y_OFFSET)
        DEFINE_HANDLER(TelemetryIds::MPU_ACCELERATION, unsigned short, MpuAccelerationZ, MPU_ACCELERATION_Z_OFFSET)

        // MPU Gyro PGN = 0x634
        DEFINE_HANDLER(TelemetryIds::MPU_GYRO, unsigned short, MpuRotationX, MPU_ROTATION_X_OFFSET)
        DEFINE_HANDLER(TelemetryIds::MPU_GYRO, unsigned short, MpuRotationY, MPU_ROTATION_Y_OFFSET)
        DEFINE_HANDLER(TelemetryIds::MPU_GYRO, unsigned short, MpuRotationZ, MPU_ROTATION_Z_OFFSET)

        // MPU Temp PGN = 0x635
        DEFINE_HANDLER(TelemetryIds::MPU_TEMPERATURE, unsigned short, MpuTemperature, MPU_TEMPERATURE_OFFSET)
    }
public:
    // For SerialReceiver
    void populatePacket(const QByteArray& raw) override;
    // For CanReceiver
    void populatePacket(quint32 id, const QByteArray& data);
    QJsonObject toJson() override;
};

#endif // TELEMETRYPACKET_H
