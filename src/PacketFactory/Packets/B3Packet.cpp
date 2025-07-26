#include "B3Packet.h"
#include "../../Config/JsonDefinitions.h"

B3Packet::B3Packet() {
    // Heartbeat 
    setB3Heartbeat(false);

    // Lights Inputs
    setRightSignalInput(false);
    setLeftSignalInput(false);
    setHazardLightsInput(false);
    setHeadlightsSwitchInput(false);

    // Digital Inputs
    setForwardDigital(false);
    setNeutralDigital(false);
    setReverseDigital(false);
    setHornSwitchDigital(false);
    setBrakeSwitchDigital(false);
    setHandbrakeSwitchDigital(false);
    setMotorResetDigital(false);
    setRaceModeDigital(false);
    setLapDigital(false);

    // Analog Inputs
    setAcceleration(0);
    setRegenBraking(0);

    // Lights Status
    setRightSignalStatus(false);
    setLeftSignalStatus(false);
    setDaytimeRunningLightSignalStatus(false);
    setHeadlightSignalStatus(false);
    setBrakeLightSignalStatus(false);
    setHornSignalStatus(false);

    initializeIdActionMap();
}


QJsonObject B3Packet::toJson() {
    QJsonObject json;

    // Heartbeat
    json[JsonDefinitions::B3_HEARTBEAT] = B3Heartbeat_;

    // Lights Inputs
    json[JsonDefinitions::RIGHT_SIGNAL_INPUT] = RightSignalInput_;
    json[JsonDefinitions::LEFT_SIGNAL_INPUT] = LeftSignalInput_;
    json[JsonDefinitions::HAZARD_LIGHTS_INPUT] = HazardLightsInput_;
    json[JsonDefinitions::HEADLIGHTS_SWITCH_INPUT] = HeadlightsSwitchInput_;

    // Digital Inputs
    json[JsonDefinitions::FORWARD_DIGITAL] = ForwardDigital_;
    json[JsonDefinitions::NEUTRAL_DIGITAL] = NeutralDigital_;
    json[JsonDefinitions::REVERSE_DIGITAL] = ReverseDigital_;
    json[JsonDefinitions::HORN_SWITCH_DIGITAL] = HornSwitchDigital_;
    json[JsonDefinitions::BRAKE_SWITCH_DIGITAL] = BrakeSwitchDigital_;
    json[JsonDefinitions::HANDBRAKE_SWITCH_DIGITAL] = HandbrakeSwitchDigital_;
    json[JsonDefinitions::MOTOR_RESET_DIGITAL] = MotorResetDigital_;
    json[JsonDefinitions::RACE_MODE_DIGITAL] = RaceModeDigital_;
    json[JsonDefinitions::LAP_DIGITAL] = LapDigital_;

    // Analog Inputs
    json[JsonDefinitions::ACCELERATION] = Acceleration_;
    json[JsonDefinitions::REGEN_BRAKING] = RegenBraking_;

    // Lights Status
    json[JsonDefinitions::RIGHT_SIGNAL_STATUS] = RightSignalStatus_;
    json[JsonDefinitions::LEFT_SIGNAL_STATUS] = LeftSignalStatus_;
    json[JsonDefinitions::DAYTIME_RUNNING_LIGHT_SIGNAL_STATUS] = DaytimeRunningLightSignalStatus_;
    json[JsonDefinitions::HEADLIGHT_SIGNAL_STATUS] = HeadlightSignalStatus_;
    json[JsonDefinitions::BRAKE_LIGHT_SIGNAL_STATUS] = BrakeLightSignalStatus_;
    json[JsonDefinitions::HORN_SIGNAL_STATUS] = HornSignalStatus_;

    return json;
}

void B3Packet::initializeIdActionMap() {
    qDebug() << "Initializing B3 Packet ID Action Map";

    // Heartbeat - 0x609
    idActionMap[0x100] = {
        [this](QByteArray payload){
            unsigned char heartbeat = getValue<unsigned char>(payload, 0);
            setB3Heartbeat(heartbeat & 0x01);
        }
    };

    // Lights Inputs - 0x610
    idActionMap[0x610] = {
        [this](QByteArray payload){
            unsigned char lightInputs = getValue<unsigned char>(payload, 0);
            setRightSignalInput(lightInputs & 0x01);
            setLeftSignalInput(lightInputs & 0x02);
            setHazardLightsInput(lightInputs & 0x04);
            setHeadlightsSwitchInput(lightInputs & 0x08);
        }
    };

    // Digital Inputs - 0x611
    idActionMap[0x611] = {
        [this](QByteArray payload){
            unsigned short digitalInputs = getValue<unsigned short>(payload, 0);
            setForwardDigital(digitalInputs & 0x0001);
            setNeutralDigital(digitalInputs & 0x0002);
            setReverseDigital(digitalInputs & 0x0004);
            setHornSwitchDigital(digitalInputs & 0x0008);
            setBrakeSwitchDigital(digitalInputs & 0x0010);
            setHandbrakeSwitchDigital(digitalInputs & 0x0020);
            setMotorResetDigital(digitalInputs & 0x0040);
            setRaceModeDigital(digitalInputs & 0x0080);
            setLapDigital(digitalInputs & 0x0100);
        }
    };

    // Analog Inputs - 0x612 
    idActionMap[0x612] = {
        [this](QByteArray payload){
            setAcceleration(static_cast<uint8_t>(getValue<uint8_t>(payload, 0)));
            setRegenBraking(static_cast<uint8_t>(getValue<uint8_t>(payload, 1)));
        }
    };

    // Lights Status - 0x620
    idActionMap[0x620] = {
        [this](QByteArray payload){
            unsigned char lightsStatus = getValue<unsigned char>(payload, 0);
            setRightSignalStatus(lightsStatus & 0x01);
            setLeftSignalStatus(lightsStatus & 0x02);
            setDaytimeRunningLightSignalStatus(lightsStatus & 0x04);
            setHeadlightSignalStatus(lightsStatus & 0x08);
            setBrakeLightSignalStatus(lightsStatus & 0x10);
            setHornSignalStatus(lightsStatus & 0x20);
        }
    };
}
