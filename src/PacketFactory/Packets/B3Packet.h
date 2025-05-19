#ifndef B3PACKET_H
#define B3PACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class B3Packet : public IPacket {
    Q_OBJECT
    DEFINE_PROPERTY(bool, RightSignalIn)
    DEFINE_PROPERTY(bool, LeftSignalIn)
    DEFINE_PROPERTY(bool, HazardLightsIn)
    DEFINE_PROPERTY(bool, HeadlightsSwitchIn)
    DEFINE_PROPERTY(bool, ForwardSwitchIn) //TODO: Verify if Required
    DEFINE_PROPERTY(bool, HornSwitchIn)
    DEFINE_PROPERTY(bool, ForwardIn)

    DEFINE_PROPERTY(bool, Neutral)
    DEFINE_PROPERTY(bool, Reverse)
    DEFINE_PROPERTY(bool, BrakeSwitch)
    DEFINE_PROPERTY(bool, HandbrakeSwitch)
    DEFINE_PROPERTY(bool, MotorReset)
    DEFINE_PROPERTY(bool, RaceMode)
    DEFINE_PROPERTY(bool, Lap)
    DEFINE_PROPERTY(bool, ZoomZoom) //TODO: Verify if Required

    DEFINE_PROPERTY(unsigned char, Acceleration)
    DEFINE_PROPERTY(unsigned char, RegenBraking)

    DEFINE_PROPERTY(bool, RightSignalOut)
    DEFINE_PROPERTY(bool, LeftSignalOut)
    DEFINE_PROPERTY(bool, DaytimeRunningLightSignalOut)
    DEFINE_PROPERTY(bool, HeadlightSignalOut)
    DEFINE_PROPERTY(bool, BrakeLightSignalOut)
    DEFINE_PROPERTY(bool, HornSignalOut)

public:
    B3Packet();
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;

protected:
    void initializeIdActionMap() override;

};

#endif // B3PACKET_H
