#ifndef B3PACKET_H
#define B3PACKET_H

#include "../IPacket.h"

class B3Packet : public IPacket {
public:
    B3Packet();
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;

private:
    bool rightSignalIn_;
    bool leftSignalIn_;
    bool hazardLightsIn_;
    bool headlightsSwitchIn_;
    bool forwardSwitchIn_;
    bool hornSwitchIn_;
    bool forwardIn_;

    bool neutral_;
    bool reverse_;
    bool brakeSwitch_;
    bool handbrakeSwitch_;
    bool motorReset_;
    bool raceMode_;
    bool lap_;
    bool zoomZoom_;

    unsigned short acceleration_;
    unsigned short regenbraking_;

    bool rightSignalOut_;
    bool leftSignalOut_;
    bool daytimeRunningLightSignalOut_;
    bool headlightSignalOut_;
    bool brakeLightSignalOut_;
    bool hornSignalOut_;
};

#endif // B3PACKET_H