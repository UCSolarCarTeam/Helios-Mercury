#include "ProximitySensorsPacket.h"
#include "../../Config/JsonDefinitions.h"

ProximitySensorsPacket::ProximitySensorsPacket(){
    setProximitySensor1(0);
    setProximitySensor2(0);
    setProximitySensor3(0);
    setProximitySensor4(0);

    initializeIdActionMap();
}

QJsonObject ProximitySensorsPacket::toJson() {
    QJsonObject json;
    
    json[JsonDefinitions::PROXIMITY_SENSOR_1] = ProximitySensor1_;
    json[JsonDefinitions::PROXIMITY_SENSOR_2] = ProximitySensor2_;
    json[JsonDefinitions::PROXIMITY_SENSOR_3] = ProximitySensor3_;
    json[JsonDefinitions::PROXIMITY_SENSOR_4] = ProximitySensor4_;

    return json;
}

void ProximitySensorsPacket::initializeIdActionMap() {
    qDebug() << "Initializing Proximity Sensors ID Action Map";
    idActionMap[0x700] = {
        [this](QByteArray payload) { 
            setProximitySensor1(getValue<unsigned short>(payload, 0)); 
        },
    };
    idActionMap[0x701] = {
        [this](QByteArray payload) { 
            setProximitySensor2(getValue<unsigned short>(payload, 0)); 
        },
    };
    idActionMap[0x702] = {
        [this](QByteArray payload) { 
            setProximitySensor3(getValue<unsigned short>(payload, 0)); 
        },
    };
    idActionMap[0x703] = {
        [this](QByteArray payload) { 
            setProximitySensor4(getValue<unsigned short>(payload, 0)); 
        },
    };
}
