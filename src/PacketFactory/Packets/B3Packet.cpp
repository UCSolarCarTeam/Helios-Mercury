#include "B3Packet.h"
#include "../../Config/JsonDefinitions.h"

namespace {
    const int LIGHT_INPUTS_OFFSET = 1;
    const char RIGHT_SIGNAL_IN_MASK = 0x01;
    const char LEFT_SIGNAL_IN_MASK = 0x02;
    const char HAZARD_LIGHTS_IN_MASK = 0x04;
    const char HEADLIGHTS_SWITCH_IN_MASK = 0x08;
    const char FORWARD_SWITCH_IN_MASK = 0x10;
    const char HORN_SWITCH_IN_MASK = 0x20;
    const char FORWARD_IN_MASK = 0x40;

    const int DRIVER_INPUTS_OFFSET = 2;
    const char NEUTRAL_MASK = 0x01;
    const char REVERSE_MASK = 0x02;
    const char BRAKE_SWITCH_MASK = 0x04;
    const char HANDBRAKE_SWITCH_MASK = 0x08;
    const char MOTOR_RESET_MASK = 0x10;
    const char RACE_MODE_MASK = 0x20;
    const char LAP_MASK = 0x40;
    const char ZOOM_ZOOM_MASK = 0x80;

    const int ACCELERATION_OFFSET = 3;
    const int REGEN_BRAKING_OFFSET = 5;

    const int LIGHT_OUTPUTS_OFFSET = 7;
    const char RIGHT_SIGNAL_OUT_MASK = 0x01;
    const char LEFT_SIGNAL_OUT_MASK = 0x02;
    const char DAYTIME_RUNNING_LIGHT_SIGNAL_OUT_MASK = 0x04;
    const char HEADLIGHT_SIGNAL_OUT_MASK = 0x08;
    const char BRAKE_LIGHT_SIGNAL_OUT_MASK = 0x10;
    const char HORN_SIGNAL_OUT_MASK = 0x20;
}

B3Packet::B3Packet() {
    rightSignalIn_ = false;
    leftSignalIn_ = false;
    hazardLightsIn_ = false;
    headlightsSwitchIn_ = false;
    forwardSwitchIn_ = false;
    hornSwitchIn_ = false;
    forwardIn_ = false;

    neutral_ = false;
    reverse_ = false;
    brakeSwitch_ = false;
    handbrakeSwitch_ = false;
    motorReset_ = false;
    raceMode_ = false;
    lap_ = false;
    zoomZoom_ = false;

    acceleration_ = 0;
    regenbraking_ = 0;

    rightSignalOut_ = false;
    leftSignalOut_ = false;
    daytimeRunningLightSignalOut_ = false;
    headlightSignalOut_ = false;
    brakeLightSignalOut_ = false;
    hornSignalOut_ = false;
}

void B3Packet::populatePacket(const QByteArray& data) {
    unsigned char lightInputs = getValue<unsigned char>(data, LIGHT_INPUTS_OFFSET);
    rightSignalIn_ = lightInputs & RIGHT_SIGNAL_IN_MASK;
    leftSignalIn_ = lightInputs & LEFT_SIGNAL_IN_MASK;
    hazardLightsIn_ = lightInputs & HAZARD_LIGHTS_IN_MASK;
    headlightsSwitchIn_ = lightInputs & HEADLIGHTS_SWITCH_IN_MASK;
    forwardSwitchIn_ = lightInputs & FORWARD_SWITCH_IN_MASK;
    hornSwitchIn_ = lightInputs & HORN_SWITCH_IN_MASK;
    forwardIn_ = lightInputs & FORWARD_IN_MASK;

    unsigned char driverInputs = getValue<unsigned char>(data, DRIVER_INPUTS_OFFSET);
    neutral_ = driverInputs & NEUTRAL_MASK;
    reverse_ = driverInputs & REVERSE_MASK;
    brakeSwitch_ = driverInputs & BRAKE_SWITCH_MASK;
    handbrakeSwitch_ = driverInputs & HANDBRAKE_SWITCH_MASK;
    motorReset_ = driverInputs & MOTOR_RESET_MASK;
    raceMode_ = driverInputs & RACE_MODE_MASK;
    lap_ = driverInputs & LAP_MASK;
    zoomZoom_ = driverInputs & ZOOM_ZOOM_MASK;

    acceleration_ = getValue<unsigned short>(data, ACCELERATION_OFFSET);
    regenbraking_ = getValue<unsigned short>(data, REGEN_BRAKING_OFFSET);

    unsigned char lightOutputs = getValue<unsigned char>(data, LIGHT_OUTPUTS_OFFSET);
    rightSignalOut_ = lightOutputs & RIGHT_SIGNAL_OUT_MASK;
    leftSignalOut_ = lightOutputs & LEFT_SIGNAL_OUT_MASK;
    daytimeRunningLightSignalOut_ = lightOutputs & DAYTIME_RUNNING_LIGHT_SIGNAL_OUT_MASK;
    headlightSignalOut_ = lightOutputs & HEADLIGHT_SIGNAL_OUT_MASK;
    brakeLightSignalOut_ = lightOutputs & BRAKE_LIGHT_SIGNAL_OUT_MASK;
    hornSignalOut_ = lightOutputs & HORN_SIGNAL_OUT_MASK;
}

QJsonObject B3Packet::toJson() {
    QJsonObject json;
    
    json[JsonDefinitions::RIGHT_SIGNAL_IN] = rightSignalIn_;
    json[JsonDefinitions::LEFT_SIGNAL_IN] = leftSignalIn_;
    json[JsonDefinitions::HAZARD_LIGHTS_IN] = hazardLightsIn_;
    json[JsonDefinitions::HEADLIGHTS_SWITCH_IN] = headlightsSwitchIn_;
    json[JsonDefinitions::FORWARD_SWITCH_IN] = forwardSwitchIn_;
    json[JsonDefinitions::HORN_SWITCH_IN] = hornSwitchIn_;
    json[JsonDefinitions::FORWARD_IN] = forwardIn_;

    json[JsonDefinitions::NEUTRAL] = neutral_;
    json[JsonDefinitions::REVERSE] = reverse_;
    json[JsonDefinitions::BRAKE_SWITCH] = brakeSwitch_;
    json[JsonDefinitions::HANDBRAKE_SWITCH] = handbrakeSwitch_;
    json[JsonDefinitions::MOTOR_RESET] = motorReset_;
    json[JsonDefinitions::RACE_MODE] = raceMode_;
    json[JsonDefinitions::LAP] = lap_;
    json[JsonDefinitions::ZOOM_ZOOM] = zoomZoom_;

    json[JsonDefinitions::ACCELERATION] = acceleration_;
    json[JsonDefinitions::REGEN_BRAKING] = regenbraking_;

    json[JsonDefinitions::RIGHT_SIGNAL_OUT] = rightSignalOut_;
    json[JsonDefinitions::LEFT_SIGNAL_OUT] = leftSignalOut_;
    json[JsonDefinitions::DAYTIME_RUNNING_LIGHT_SIGNAL_OUT] = daytimeRunningLightSignalOut_;
    json[JsonDefinitions::HEADLIGHT_SIGNAL_OUT] = headlightSignalOut_;
    json[JsonDefinitions::BRAKE_LIGHT_SIGNAL_OUT] = brakeLightSignalOut_;
    json[JsonDefinitions::HORN_SIGNAL_OUT] = hornSignalOut_;

    return json;
}