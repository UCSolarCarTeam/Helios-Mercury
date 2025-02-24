#include "B3Packet.h"
#include "../../Config/JsonDefinitions.h"

namespace {
    const int LIGHT_INPUTS_OFFSET = 1;
    const char RIGHT_SIGNAL_IN_MASK = 0x01;
    const char LEFT_SIGNAL_IN_MASK = 0x02;
    const char HAZARD_LIGHTS_IN_MASK = 0x04;
    const char HEADLIGHTS_SWITCH_IN_MASK = 0x08;

    const int DRIVER_INPUTS_OFFSET = 2;
    const unsigned short FORWARD_SWITCH_IN_MASK = 0x0001;
    const unsigned short HORN_SWITCH_IN_MASK = 0x0002;
    const unsigned short FORWARD_IN_MASK = 0x0004;
    const unsigned short NEUTRAL_MASK = 0x0008;
    const unsigned short REVERSE_MASK = 0x0010;
    const unsigned short BRAKE_SWITCH_MASK = 0x0020;
    const unsigned short HANDBRAKE_SWITCH_MASK = 0x0040;
    const unsigned short MOTOR_RESET_MASK = 0x0080;
    const unsigned short RACE_MODE_MASK = 0x0100;
    const unsigned short LAP_MASK = 0x0200;
    const unsigned short ZOOM_ZOOM_MASK = 0x0400;

    const int ACCELERATION_OFFSET = 4;
    const int REGEN_BRAKING_OFFSET = 6;

    const int LIGHT_OUTPUTS_OFFSET = 8;
    const char RIGHT_SIGNAL_OUT_MASK = 0x01;
    const char LEFT_SIGNAL_OUT_MASK = 0x02;
    const char DAYTIME_RUNNING_LIGHT_SIGNAL_OUT_MASK = 0x04;
    const char HEADLIGHT_SIGNAL_OUT_MASK = 0x08;
    const char BRAKE_LIGHT_SIGNAL_OUT_MASK = 0x10;
    const char HORN_SIGNAL_OUT_MASK = 0x20;
}

B3Packet::B3Packet() {
    setRightSignalIn(false);
    setLeftSignalIn(false);
    setHazardLightsIn(false);
    setHeadlightsSwitchIn(false);
    setForwardSwitchIn(false);
    setHornSwitchIn(false);
    setForwardIn(false);

    setNeutral(false);
    setReverse(false);
    setBrakeSwitch(false);
    setHandbrakeSwitch(false);
    setMotorReset(false);
    setRaceMode(false);
    setLap(false);
    setZoomZoom(false);

    setAcceleration(0);
    setRegenBraking(0);

    setRightSignalOut(false);
    setLeftSignalOut(false);
    setDaytimeRunningLightSignalOut(false);
    setHeadlightSignalOut(false);
    setBrakeLightSignalOut(false);
    setHornSignalOut(false);
}

void B3Packet::populatePacket(const QByteArray& data) {
    qDebug() << "populatePacket";
    qDebug() << data;
    unsigned char lightInputs = getValue<unsigned char>(data, LIGHT_INPUTS_OFFSET);
    setRightSignalIn(lightInputs & RIGHT_SIGNAL_IN_MASK);
    setLeftSignalIn(lightInputs & LEFT_SIGNAL_IN_MASK);
    setHazardLightsIn(lightInputs & HAZARD_LIGHTS_IN_MASK);
    setHeadlightsSwitchIn(lightInputs & HEADLIGHTS_SWITCH_IN_MASK);

    unsigned short driverInputs = getValue<unsigned short>(data, DRIVER_INPUTS_OFFSET);
    setForwardSwitchIn(driverInputs & FORWARD_SWITCH_IN_MASK);
    setHornSwitchIn(driverInputs & HORN_SWITCH_IN_MASK);
    setForwardIn(driverInputs & FORWARD_IN_MASK);
    setNeutral(driverInputs & NEUTRAL_MASK);
    setReverse(driverInputs & REVERSE_MASK);
    setBrakeSwitch(driverInputs & BRAKE_SWITCH_MASK);
    setHandbrakeSwitch(driverInputs & HANDBRAKE_SWITCH_MASK);
    setMotorReset(driverInputs & MOTOR_RESET_MASK);
    setRaceMode(driverInputs & RACE_MODE_MASK);
    setLap(driverInputs & LAP_MASK);
    setZoomZoom(driverInputs & ZOOM_ZOOM_MASK);

    setAcceleration(getValue<unsigned short>(data, ACCELERATION_OFFSET));
    setRegenBraking(getValue<unsigned short>(data, REGEN_BRAKING_OFFSET));

    unsigned char lightOutputs = getValue<unsigned char>(data, LIGHT_OUTPUTS_OFFSET);
    setRightSignalOut(lightOutputs & RIGHT_SIGNAL_OUT_MASK);
    setLeftSignalOut(lightOutputs & LEFT_SIGNAL_OUT_MASK);
    setDaytimeRunningLightSignalOut(lightOutputs & DAYTIME_RUNNING_LIGHT_SIGNAL_OUT_MASK);
    setHeadlightSignalOut(lightOutputs & HEADLIGHT_SIGNAL_OUT_MASK);
    setBrakeLightSignalOut(lightOutputs & BRAKE_LIGHT_SIGNAL_OUT_MASK);
    setHornSignalOut(lightOutputs & HORN_SIGNAL_OUT_MASK);
}

QJsonObject B3Packet::toJson() {
    QJsonObject json;
    
    json[JsonDefinitions::RIGHT_SIGNAL_IN] = RightSignalIn_;
    json[JsonDefinitions::LEFT_SIGNAL_IN] = LeftSignalIn_;
    json[JsonDefinitions::HAZARD_LIGHTS_IN] = HazardLightsIn_;
    json[JsonDefinitions::HEADLIGHTS_SWITCH_IN] = HeadlightsSwitchIn_;
    json[JsonDefinitions::FORWARD_SWITCH_IN] = ForwardSwitchIn_;
    json[JsonDefinitions::HORN_SWITCH_IN] = HornSwitchIn_;
    json[JsonDefinitions::FORWARD_IN] = ForwardIn_;

    json[JsonDefinitions::NEUTRAL] = Neutral_;
    json[JsonDefinitions::REVERSE] = Reverse_;
    json[JsonDefinitions::BRAKE_SWITCH] = BrakeSwitch_;
    json[JsonDefinitions::HANDBRAKE_SWITCH] = HandbrakeSwitch_;
    json[JsonDefinitions::MOTOR_RESET] = MotorReset_;
    json[JsonDefinitions::RACE_MODE] = RaceMode_;
    json[JsonDefinitions::LAP] = Lap_;
    json[JsonDefinitions::ZOOM_ZOOM] = ZoomZoom_;

    json[JsonDefinitions::ACCELERATION] = Acceleration_;
    json[JsonDefinitions::REGEN_BRAKING] = RegenBraking_;

    json[JsonDefinitions::RIGHT_SIGNAL_OUT] = RightSignalOut_;
    json[JsonDefinitions::LEFT_SIGNAL_OUT] = LeftSignalOut_;
    json[JsonDefinitions::DAYTIME_RUNNING_LIGHT_SIGNAL_OUT] = DaytimeRunningLightSignalOut_;
    json[JsonDefinitions::HEADLIGHT_SIGNAL_OUT] = HeadlightSignalOut_;
    json[JsonDefinitions::BRAKE_LIGHT_SIGNAL_OUT] = BrakeLightSignalOut_;
    json[JsonDefinitions::HORN_SIGNAL_OUT] = HornSignalOut_;

    return json;
}
