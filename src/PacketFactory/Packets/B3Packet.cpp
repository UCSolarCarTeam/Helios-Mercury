#include "B3Packet.h"
#include "../../Config/JsonDefinitions.h"

B3Packet::B3Packet() {
    setRightSignalIn(false);
    setLeftSignalIn(false);
    setHazardLightsIn(false);
    setHeadlightsSwitchIn(false);

    setForward(false);
    setNeutral(false);
    setReverse(false);
    setHornSwitchIn(false);
    setBrakeSwitch(false);
    setHandbrakeSwitch(false);
    setMotorReset(false);
    setRaceMode(false);
    setLap(false);

    setAcceleration(0);
    setRegenBraking(0);

    setRightSignalOut(false);
    setLeftSignalOut(false);
    setDaytimeRunningLightSignalOut(false);
    setHeadlightSignalOut(false);
    setBrakeLightSignalOut(false);
    setHornSignalOut(false);

    initializeIdActionMap();
}

void B3Packet::initializeIdActionMap() {
    qDebug() << "Initializing B3 Packet ID Action Map";
    idActionMap[0x610] = {
        [this](QByteArray payload){
            unsigned char lightInputs = getValue<unsigned char>(payload, 0);
            setRightSignalIn(lightInputs & 0x01);
            setLeftSignalIn(lightInputs & 0x02);
            setHazardLightsIn(lightInputs & 0x04);
            setHeadlightsSwitchIn(lightInputs & 0x08);
        }
    };
    idActionMap[0x611] = {
        [this](QByteArray payload){
            unsigned short digitalInputs = getValue<unsigned short>(payload, 0);
            setForward(digitalInputs & 0x0001);
            setNeutral(digitalInputs & 0x0002);
            setReverse(digitalInputs & 0x0004);
            setHornSwitchIn(digitalInputs & 0x0008);
            setBrakeSwitch(digitalInputs & 0x0010);
            setHandbrakeSwitch(digitalInputs & 0x0020);
            setMotorReset(digitalInputs & 0x0040);
            setRaceMode(digitalInputs & 0x0080);
            setLap(digitalInputs & 0x0100);
        }
    };
    idActionMap[0x612] = {
        [this](QByteArray payload){
            setAcceleration(getValue<unsigned char>(payload, 0));
            setRegenBraking(getValue<unsigned char>(payload, 1));
        }
    };
    idActionMap[0x620] = {
        [this](QByteArray payload){
            unsigned char lightsStatus = getValue<unsigned char>(payload, 0);
            setRightSignalOut(lightsStatus & 0x01);
            setLeftSignalOut(lightsStatus & 0x02);
            setDaytimeRunningLightSignalOut(lightsStatus & 0x04);
            setHeadlightSignalOut(lightsStatus & 0x08);
            setBrakeLightSignalOut(lightsStatus & 0x10);
            setHornSignalOut(lightsStatus & 0x20);
        }
    };
}

QJsonObject B3Packet::toJson() {
    QJsonObject json;
    
    json["RightSignalIn"] = getRightSignalIn();
    json["LeftSignalIn"] = getLeftSignalIn();
    json["HazardLightsIn"] = getHazardLightsIn();
    json["HeadlightsIn"] = getHeadlightsSwitchIn();

    json["Forward"] = getForward();
    json["Neutral"] = getNeutral();
    json["Reverse"] = getReverse();
    json["HornSwitchIn"] = getHornSwitchIn();
    json["BrakeSwitch"] = getBrakeSwitch();
    json["HandbrakeSwitch"] = getHandbrakeSwitch();
    json["MotorReset"] = getMotorReset();
    json["RaceMode"] = getRaceMode();
    json["Lap"] = getLap();

    json["Acceleration"] = getAcceleration();
    json["RegenBraking"] = getRegenBraking();

    json["RightSignalOut"] = getRightSignalOut();
    json["LeftSignalOut"] = getLeftSignalOut();
    json["DaytimeRunningLightsSignalOut"] = getDaytimeRunningLightSignalOut();
    json["HeadlightsSignalOut"] = getHeadlightSignalOut();
    json["BrakeLightsSignalOut"] = getBrakeLightSignalOut();
    json["HornSignalOut"] = getHornSignalOut();

    return json;
}
