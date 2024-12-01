#ifndef MBMSPACKET_H
#define MBMSPACKET_H

#include "../IPacket.h"

class MbmsPacket : public IPacket {
public:
    MbmsPacket();
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;

private:
    bool commonContactorState_;
    bool motorContactorState_;
    bool arrayContactorState_;
    bool lvContactorState_;
    bool chargeContactorState_;

    bool commonContactorError_;
    bool motorContactorError_;
    bool arrayContactorError_;
    bool lvContactorError_;
    bool chargeContactorError_;

    bool strobeBmsLight_;
    bool allowCharge_;
    bool highVoltageEnableState_;
    bool allowDischarge_;
    bool orionCanReceivedRecently_;
    bool dischargeShouldTrip_;
    bool chargeShouldTrip_;

    unsigned short auxillaryBatteryVoltage_;
    unsigned short motorVoltage_;
    unsigned short arrayVoltage_;
    unsigned short lvVoltage_;
    unsigned short chargeVoltage_;
    unsigned short commonCurrent_;
    unsigned short motorCurrent_;
    unsigned short arrayCurrent_;
    unsigned short lvCurrent_;
    unsigned short chargeCurrent_;

    bool highCellVoltageTrip_;
    bool lowCellVoltageTrip_;
    bool highCommonCurrentTrip_;
    bool motorHighTemperatureCurrentTrip_;
    bool arrayHighTemperatureCurrentTrip_;
    bool lvHighTemperatureCurrentTrip_;
    bool chargeHighTemperatureCurrentTrip_;
    bool protectionTrip_;
    bool orionMessageTimeoutTrip_;
    bool contactorDisconnectedUnexpectedlyTrip_;
};

#endif // MBMSPACKET_H