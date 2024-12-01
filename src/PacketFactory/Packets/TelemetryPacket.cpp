#include "TelemetryPacket.h"
#include "../../Config/JsonDefinitions.h"

namespace {
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
    gpsYear_ = 0;
    gpsMonth_ = 0;
    gpsDay_ = 0;
    gpsHour_ = 0;
    gpsMinute_ = 0;
    gpsSecond_ = 0;
    gpsValidityFlags_ = 0;
    gpsFixStatusFlags_ = 0;
    gpsAdditionalFlags_ = 0;
    gpsLongitude_ = 0;
    gpsLatitude_ = 0;
    mpuAccelerationX_ = 0;
    mpuAccelerationY_ = 0;
    mpuAccelerationZ_ = 0;
    mpuRotationX_ = 0;
    mpuRotationY_ = 0;
    mpuRotationZ_ = 0;
    mpuTemperature_ = 0;
}

void TelemetryPacket::populatePacket(const QByteArray& data) {
    gpsYear_ = getValue<unsigned short>(data, GPS_YEAR_OFFSET);
    gpsMonth_ = getValue<unsigned char>(data, GPS_MONTH_OFFSET);
    gpsDay_ = getValue<unsigned char>(data, GPS_DAY_OFFSET);
    gpsHour_ = getValue<unsigned char>(data, GPS_HOUR_OFFSET);
    gpsMinute_ = getValue<unsigned char>(data, GPS_MINUTE_OFFSET);
    gpsSecond_ = getValue<unsigned char>(data, GPS_SECOND_OFFSET);
    gpsValidityFlags_ = getValue<unsigned char>(data, GPS_VALIDITY_FLAGS_OFFSET);
    gpsFixStatusFlags_ = getValue<unsigned char>(data, GPS_FIX_STATUS_FLAGS_OFFSET);
    gpsAdditionalFlags_ = getValue<unsigned char>(data, GPS_ADDITIONAL_FLAGS_OFFSET);
    gpsLongitude_ = getValue<int>(data, GPS_LONGITUDE_OFFSET);
    gpsLatitude_ = getValue<int>(data, GPS_LATITUDE_OFFSET);
    mpuAccelerationX_ = getValue<unsigned short>(data, MPU_ACCELERATION_X_OFFSET);
    mpuAccelerationY_ = getValue<unsigned short>(data, MPU_ACCELERATION_Y_OFFSET);
    mpuAccelerationZ_ = getValue<unsigned short>(data, MPU_ACCELERATION_Z_OFFSET);
    mpuRotationX_ = getValue<unsigned short>(data, MPU_ROTATION_X_OFFSET);
    mpuRotationY_ = getValue<unsigned short>(data, MPU_ROTATION_Y_OFFSET);
    mpuRotationZ_ = getValue<unsigned short>(data, MPU_ROTATION_Z_OFFSET);
    mpuTemperature_ = getValue<unsigned short>(data, MPU_TEMPERATURE_OFFSET);
}

QJsonObject TelemetryPacket::toJson() {
    QJsonObject json;
    
    json[JsonDefinitions::GPS_YEAR] = gpsYear_;
    json[JsonDefinitions::GPS_MONTH] = gpsMonth_;
    json[JsonDefinitions::GPS_DAY] = gpsDay_;
    json[JsonDefinitions::GPS_HOUR] = gpsHour_;
    json[JsonDefinitions::GPS_MINUTE] = gpsMinute_;
    json[JsonDefinitions::GPS_SECOND] = gpsSecond_;
    json[JsonDefinitions::GPS_VALIDITY_FLAGS] = gpsValidityFlags_;
    json[JsonDefinitions::GPS_FIX_STATUS_FLAGS] = gpsFixStatusFlags_;
    json[JsonDefinitions::GPS_ADDITIONAL_FLAGS] = gpsAdditionalFlags_;
    json[JsonDefinitions::GPS_LONGITUDE] = gpsLongitude_;
    json[JsonDefinitions::GPS_LATITUDE] = gpsLatitude_;
    json[JsonDefinitions::MPU_ACCELERATION_X] = mpuAccelerationX_;
    json[JsonDefinitions::MPU_ACCELERATION_Y] = mpuAccelerationY_;
    json[JsonDefinitions::MPU_ACCELERATION_Z] = mpuAccelerationZ_;
    json[JsonDefinitions::MPU_ROTATION_X] = mpuRotationX_;
    json[JsonDefinitions::MPU_ROTATION_Y] = mpuRotationY_;
    json[JsonDefinitions::MPU_ROTATION_Z] = mpuRotationZ_;
    json[JsonDefinitions::MPU_TEMPERATURE] = mpuTemperature_;

    return json;
}