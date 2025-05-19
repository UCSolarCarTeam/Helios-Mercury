#include "TelemetryPacket.h"
#include "../../Config/JsonDefinitions.h"

namespace {
    //Serial offsets -> TODO: phase out
    const int GPS_YEAR_OFFSET = 1;
    const int GPS_MONTH_OFFSET = 3;
    const int GPS_DAY_OFFSET = 4;
    const int GPS_HOUR_OFFSET = 5;
    const int GPS_MINUTE_OFFSET = 6;
    const int GPS_SECOND_OFFSET = 7;
    const int GPS_VALIDITY_FLAGS_OFFSET = 8;
    const int GPS_FIX_STATUS_FLAGS_OFFSET = 9;
    const int GPS_ADDITIONAL_FLAGS_OFFSET = 10;
    const int GPS_LONGITUDE_OFFSET = 11;
    const int GPS_LATITUDE_OFFSET = 15;
    const int MPU_ACCELERATION_X_OFFSET = 19;
    const int MPU_ACCELERATION_Y_OFFSET = 21;
    const int MPU_ACCELERATION_Z_OFFSET = 23;
    const int MPU_ROTATION_X_OFFSET = 25;
    const int MPU_ROTATION_Y_OFFSET = 27;
    const int MPU_ROTATION_Z_OFFSET = 29;
    const int MPU_TEMPERATURE_OFFSET = 31;
}

TelemetryPacket::TelemetryPacket() {
    setGpsYear(0);
    setGpsMonth(0);
    setGpsDay(0);
    setGpsHour(0);
    setGpsMinute(0);
    setGpsSecond(0);
    setGpsValidityFlags(0);
    setGpsFixStatusFlags(0);
    setGpsAdditionalFlags(0);
    setGpsLongitude(0);
    setGpsLatitude(0);
    setMpuAccelerationX(0);
    setMpuAccelerationY(0);
    setMpuAccelerationZ(0);
    setMpuRotationX(0);
    setMpuRotationY(0);
    setMpuRotationZ(0);
    setMpuTemperature(0);

    initializeIdActionMap();
}

void TelemetryPacket::populatePacket(const QByteArray& data) {
    setGpsYear(getValue<unsigned short>(data, GPS_YEAR_OFFSET));
    setGpsMonth(getValue<unsigned char>(data, GPS_MONTH_OFFSET));
    setGpsDay(getValue<unsigned char>(data, GPS_DAY_OFFSET));
    setGpsHour(getValue<unsigned char>(data, GPS_HOUR_OFFSET));
    setGpsMinute(getValue<unsigned char>(data, GPS_MINUTE_OFFSET));
    setGpsSecond(getValue<unsigned char>(data, GPS_SECOND_OFFSET));
    setGpsValidityFlags(getValue<unsigned char>(data, GPS_VALIDITY_FLAGS_OFFSET));
    setGpsFixStatusFlags(getValue<unsigned char>(data, GPS_FIX_STATUS_FLAGS_OFFSET));
    setGpsAdditionalFlags(getValue<unsigned char>(data, GPS_ADDITIONAL_FLAGS_OFFSET));
    setGpsLongitude(getValue<float>(data, GPS_LONGITUDE_OFFSET));
    setGpsLatitude(getValue<float>(data, GPS_LATITUDE_OFFSET));
    setMpuAccelerationX(getValue<unsigned short>(data, MPU_ACCELERATION_X_OFFSET));
    setMpuAccelerationY(getValue<unsigned short>(data, MPU_ACCELERATION_Y_OFFSET));
    setMpuAccelerationZ(getValue<unsigned short>(data, MPU_ACCELERATION_Z_OFFSET));
    setMpuRotationX(getValue<unsigned short>(data, MPU_ROTATION_X_OFFSET));
    setMpuRotationY(getValue<unsigned short>(data, MPU_ROTATION_Y_OFFSET));
    setMpuRotationZ(getValue<unsigned short>(data, MPU_ROTATION_Z_OFFSET));
    setMpuTemperature(getValue<unsigned short>(data, MPU_TEMPERATURE_OFFSET));
}

QJsonObject TelemetryPacket::toJson() {
    QJsonObject json;
    
    json[JsonDefinitions::GPS_YEAR] = GpsYear_;
    json[JsonDefinitions::GPS_MONTH] = GpsMonth_;
    json[JsonDefinitions::GPS_DAY] = GpsDay_;
    json[JsonDefinitions::GPS_HOUR] = GpsHour_;
    json[JsonDefinitions::GPS_MINUTE] = GpsMinute_;
    json[JsonDefinitions::GPS_SECOND] = GpsSecond_;
    json[JsonDefinitions::GPS_VALIDITY_FLAGS] = GpsValidityFlags_;
    json[JsonDefinitions::GPS_FIX_STATUS_FLAGS] = GpsFixStatusFlags_;
    json[JsonDefinitions::GPS_ADDITIONAL_FLAGS] = GpsAdditionalFlags_;
    json[JsonDefinitions::GPS_LONGITUDE] = GpsLongitude_;
    json[JsonDefinitions::GPS_LATITUDE] = GpsLatitude_;
    json[JsonDefinitions::MPU_ACCELERATION_X] = MpuAccelerationX_;
    json[JsonDefinitions::MPU_ACCELERATION_Y] = MpuAccelerationY_;
    json[JsonDefinitions::MPU_ACCELERATION_Z] = MpuAccelerationZ_;
    json[JsonDefinitions::MPU_ROTATION_X] = MpuRotationX_;
    json[JsonDefinitions::MPU_ROTATION_Y] = MpuRotationY_;
    json[JsonDefinitions::MPU_ROTATION_Z] = MpuRotationZ_;
    json[JsonDefinitions::MPU_TEMPERATURE] = MpuTemperature_;

    return json;
}

void TelemetryPacket::initializeIdActionMap() {
    qDebug() << "Initializing Telemetry ID Action Map";
    idActionMap[0x630] = {
        [this](QByteArray payload) { 
            setGpsYear(getValue<unsigned short>(payload, 0)); 
            setGpsMonth(getValue<unsigned char>(payload, 2));
            setGpsDay(getValue<unsigned char>(payload, 3));
            setGpsHour(getValue<unsigned char>(payload, 4));
            setGpsMinute(getValue<unsigned char>(payload, 5));
            setGpsSecond(getValue<unsigned char>(payload, 6));
        },
    };
    idActionMap[0x631] = {
        [this](QByteArray payload) { 
            setGpsValidityFlags(getValue<unsigned char>(payload, 0));
            setGpsFixStatusFlags(getValue<unsigned char>(payload, 1));
            setGpsAdditionalFlags(getValue<unsigned char>(payload, 2));
        },
    };
    idActionMap[0x632] = {
        [this](QByteArray payload) { 
            setGpsLongitude(getValue<float>(payload, 0));
            setGpsLatitude(getValue<float>(payload, 4));
        },
    };
    idActionMap[0x633] = {
        [this](QByteArray payload) { 
            setMpuAccelerationX(getValue<unsigned short>(payload, 0));
            setMpuAccelerationY(getValue<unsigned short>(payload, 2));
            setMpuAccelerationZ(getValue<unsigned short>(payload, 4));
        },
    };
    idActionMap[0x634] = {
        [this](QByteArray payload) { 
            setMpuRotationX(getValue<unsigned short>(payload, 0));
            setMpuRotationY(getValue<unsigned short>(payload, 2));
            setMpuRotationZ(getValue<unsigned short>(payload, 4));
        },
    };
    idActionMap[0x635] = {
        [this](QByteArray payload) { 
            setMpuTemperature(getValue<unsigned short>(payload, 0));
        },
    };
}
