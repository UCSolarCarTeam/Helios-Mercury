#include "TelemetryPacket.h"
#include "../../Config/JsonDefinitions.h"

void TelemetryPacket::populatePacket(quint32 id, const QByteArray& data)
{
    // call into IPacket’s dispatcher:
    IPacket::populatePacket(id, data);
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
