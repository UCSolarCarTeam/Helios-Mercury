#include "TelemetryPacket.h"
#include "../../Config/JsonDefinitions.h"

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

QJsonObject TelemetryPacket::toJson() {
    QJsonObject json;
    
    json[JsonDefinitions::GPS_YEAR] = getGpsYear();
    json[JsonDefinitions::GPS_MONTH] = getGpsMonth();
    json[JsonDefinitions::GPS_DAY] = getGpsDay();
    json[JsonDefinitions::GPS_HOUR] = getGpsHour();
    json[JsonDefinitions::GPS_MINUTE] = getGpsMinute();
    json[JsonDefinitions::GPS_SECOND] = getGpsSecond();
    json[JsonDefinitions::GPS_VALIDITY_FLAGS] = getGpsValidityFlags();
    json[JsonDefinitions::GPS_FIX_STATUS_FLAGS] = getGpsFixStatusFlags();
    json[JsonDefinitions::GPS_ADDITIONAL_FLAGS] = getGpsAdditionalFlags();
    json[JsonDefinitions::GPS_LONGITUDE] = getGpsLongitude();
    json[JsonDefinitions::GPS_LATITUDE] = getGpsLatitude();
    json[JsonDefinitions::MPU_ACCELERATION_X] = getMpuAccelerationX();
    json[JsonDefinitions::MPU_ACCELERATION_Y] = getMpuAccelerationY();
    json[JsonDefinitions::MPU_ACCELERATION_Z] = getMpuAccelerationZ();
    json[JsonDefinitions::MPU_ROTATION_X] = getMpuRotationX();
    json[JsonDefinitions::MPU_ROTATION_Y] = getMpuRotationY();
    json[JsonDefinitions::MPU_ROTATION_Z] = getMpuRotationZ();
    json[JsonDefinitions::MPU_TEMPERATURE] = getMpuTemperature();

    return json;
}
