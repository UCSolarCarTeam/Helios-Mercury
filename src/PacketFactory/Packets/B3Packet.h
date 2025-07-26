#ifndef B3PACKET_H
#define B3PACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class B3Packet : public IPacket {
    Q_OBJECT

    // Heartbeat
    DEFINE_PROPERTY(bool, B3Heartbeat)

    // Lights Inputs
    DEFINE_PROPERTY(bool, RightSignalInput)
    DEFINE_PROPERTY(bool, LeftSignalInput)
    DEFINE_PROPERTY(bool, HazardLightsInput)
    DEFINE_PROPERTY(bool, HeadlightsSwitchInput)

    // Digital Inputs
    DEFINE_PROPERTY(bool, ForwardDigital)
    DEFINE_PROPERTY(bool, NeutralDigital)
    DEFINE_PROPERTY(bool, ReverseDigital)
    DEFINE_PROPERTY(bool, HornSwitchDigital)
    DEFINE_PROPERTY(bool, BrakeSwitchDigital)
    DEFINE_PROPERTY(bool, HandbrakeSwitchDigital)
    DEFINE_PROPERTY(bool, MotorResetDigital)
    DEFINE_PROPERTY(bool, RaceModeDigital)
    DEFINE_PROPERTY(bool, LapDigital)

    // Analog Inputs
    DEFINE_PROPERTY(unsigned char, Acceleration)
    DEFINE_PROPERTY(unsigned char, RegenBraking)
    
    // Lights Status
    DEFINE_PROPERTY(bool, RightSignalStatus)
    DEFINE_PROPERTY(bool, LeftSignalStatus)
    DEFINE_PROPERTY(bool, DaytimeRunningLightSignalStatus)
    DEFINE_PROPERTY(bool, HeadlightSignalStatus)
    DEFINE_PROPERTY(bool, BrakeLightSignalStatus)
    DEFINE_PROPERTY(bool, HornSignalStatus)

public:
    B3Packet();
    QJsonObject toJson() override;

protected:
    void initializeIdActionMap() override;

};

#endif // B3PACKET_H
