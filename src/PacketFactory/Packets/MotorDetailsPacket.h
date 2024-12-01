#ifndef MOTORDETAILSPACKET_H
#define MOTORDETAILSPACKET_H

#include "../IPacket.h"

class MotorDetailsPacket : public IPacket {
public:
    MotorDetailsPacket();
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;

private:
    short controlValue_;

    bool controlMode_;
    bool motorMode_;
    bool softwareEnable_;
    bool debugMode_;

    short currentMotorTorque_;
    short currentRpmValue_;
    char motorTemperature_;
    short inverterPeakCurrent_;
    short currentMotorPower_;
    unsigned short absuluteAngle_;

    // Warning Flags
    bool motorAboutToStall_;
    bool delayInReadingTempSensor_;
    bool delayInReadingPosSensor_;
    bool inverter1TempVeryHigh_;
    bool inverter2TempVeryHigh_;
    bool inverter3TempVeryHigh_;
    bool inverter4TempVeryHigh_;
    bool inverter5TempVeryHigh_;
    bool inverter6TempVeryHigh_;
    bool cpuTemperatureVeryHigh_;
    bool hallTemperatureVeryHigh_;
    bool dclinkTemperatureVeryHigh_;
    bool delayInDclinkCommunication_;
    bool inverter1OverCurrentWarning_;
    bool inverter2OverCurrentWarning_;
    bool inverter3OverCurrentWarning_;
    bool inverter4OverCurrentWarning_;
    bool inverter5OverCurrentWarning_;
    bool inverter6OverCurrentWarning_;
    bool dcOvervoltageWarning_;
    bool dcUndervoltageWarning_;
    bool canCommsTimeout_;
    bool inverter1faultWarning_;
    bool inverter2faultWarning_;
    bool inverter3faultWarning_;
    bool inverter4faultWarning_;
    bool inverter5faultWarning_;
    bool inverter6faultWarning_;
    bool canSendWarning_;
    bool lostFramesOnCanBusWarning_;
    bool overspeedWarning_;
    bool cpuOverload_;
    bool torqueLimited_;
    bool startAtHighRpm_;

    // Error Flags
    bool initError_;
    bool settingsNotFound_;
    bool motorStalled_;
    bool controllerDataReadingTimeout_;
    bool invalidHallSensorSequence_;
    bool invalidHallSector_;
    bool errorReadingTempSensor_;
    bool positionSensorReadingError_;
    bool errorReadingEncoder_;
    bool zeroPositionOffsetNotSet_;
    bool hwEnableNotSet_;
    bool inverter1TempTooHigh_;
    bool inverter2TempTooHigh_;
    bool inverter3TempTooHigh_;
    bool inverter4TempTooHigh_;
    bool inverter5TempTooHigh_;
    bool inverter6TempTooHigh_;
    bool cpuTemperatureTooHigh_;
    bool hallTemperatureTooHigh_;
    bool dclinkTemperatureTooHigh_;
    bool errorInDclinkCommunication_;
    bool inverter1OvercurrentError_;
    bool inverter2OvercurrentError_;
    bool inverter3OvercurrentError_;
    bool inverter4OvercurrentError_;
    bool inverter5OvercurrentError_;
    bool inverter6OvercurrentError_;
    bool dcOvervoltageError_;
    bool dcUndervoltageError_;
    bool doubleCanIdOnBus_;
    bool canCommsTimeoutError_;
    bool inverter1FaultError_;
    bool inverter2FaultError_;
    bool inverter3FaultError_;
    bool inverter4FaultError_;
    bool inverter5FaultError_;
    bool inverter6FaultError_;
    bool canSendError_;
    bool lostFramesOnCanBusError_;
    bool overspeedError_;
    bool cpuOverloaded_;
};

#endif // MOTORDETAILSPACKET_H