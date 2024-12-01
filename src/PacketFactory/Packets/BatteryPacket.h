#ifndef BATTERYPACKET_H
#define BATTERYPACKET_H

#include "../IPacket.h"

class BatteryPacket : public IPacket {
public:
    BatteryPacket();
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;

private:
    unsigned char bmuAlive_;

    bool dischargeRelayEnabled_;
    bool chargeRelayEnabled_;
    bool chargerSafetyRelayEnabled_;
    bool malfunctionIndicatorActive_;
    bool multiPurposeInputSignalStatus_;
    bool alwaysOnSignalStatus_;
    bool isReadySignalStatus_;
    bool isChargingSignalStatus_;

    unsigned char populatedCells_;
    float input12V_;
    float fanVoltage_;
    float packCurrent_;
    float packVoltage_;
    float packStateOfCharge_;
    float packAmphours_;
    float packDepthOfDischarge_;
    unsigned char highTemperature_;
    unsigned char highThermistorId_;
    unsigned char lowTemperature_;
    unsigned char lowThermistorId_;
    unsigned char averageTemperature_;
    unsigned char internalTemperature_;
    unsigned char fanSpeed_;
    unsigned char requestedFanSpeed_;

    unsigned short lowCellVoltage_;
    unsigned char lowCellVoltageId_;
    unsigned short highCellVoltage_;
    unsigned char highCellVoltageId_;
    unsigned short averageCellVoltage_;
};

#endif // BATTERYPACKET_H