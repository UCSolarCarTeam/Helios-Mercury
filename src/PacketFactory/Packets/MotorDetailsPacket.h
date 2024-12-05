#ifndef MOTORDETAILSPACKET_H
#define MOTORDETAILSPACKET_H

#include "../IPacket.h"
#include "../../Config/PropertyDefinitions.h"

class MotorDetailsPacket : public IPacket {
    Q_OBJECT
    DEFINE_PROPERTY(short, ControlValue)

    DEFINE_PROPERTY(bool, ControlMode)
    DEFINE_PROPERTY(bool, MotorMode)
    DEFINE_PROPERTY(bool, SoftwareEnable)
    DEFINE_PROPERTY(bool, DebugMode)

    DEFINE_PROPERTY(short, CurrentMotorTorque)
    DEFINE_PROPERTY(short, CurrentRpmValue)
    DEFINE_PROPERTY(char, MotorTemperature)
    DEFINE_PROPERTY(short, InverterPeakCurrent)
    DEFINE_PROPERTY(short, CurrentMotorPower)
    DEFINE_PROPERTY(unsigned short, AbsuluteAngle)

    // Warning Flags
    DEFINE_PROPERTY(bool, MotorAboutToStall)
    DEFINE_PROPERTY(bool, DelayInReadingTempSensor)
    DEFINE_PROPERTY(bool, DelayInReadingPosSensor)
    DEFINE_PROPERTY(bool, Inverter1TempVeryHigh)
    DEFINE_PROPERTY(bool, Inverter2TempVeryHigh)
    DEFINE_PROPERTY(bool, Inverter3TempVeryHigh)
    DEFINE_PROPERTY(bool, Inverter4TempVeryHigh)
    DEFINE_PROPERTY(bool, Inverter5TempVeryHigh)
    DEFINE_PROPERTY(bool, Inverter6TempVeryHigh)
    DEFINE_PROPERTY(bool, CpuTemperatureVeryHigh)
    DEFINE_PROPERTY(bool, HallTemperatureVeryHigh)
    DEFINE_PROPERTY(bool, DclinkTemperatureVeryHigh)
    DEFINE_PROPERTY(bool, DelayInDclinkCommunication)
    DEFINE_PROPERTY(bool, Inverter1OverCurrentWarning)
    DEFINE_PROPERTY(bool, Inverter2OverCurrentWarning)
    DEFINE_PROPERTY(bool, Inverter3OverCurrentWarning)
    DEFINE_PROPERTY(bool, Inverter4OverCurrentWarning)
    DEFINE_PROPERTY(bool, Inverter5OverCurrentWarning)
    DEFINE_PROPERTY(bool, Inverter6OverCurrentWarning)
    DEFINE_PROPERTY(bool, DcOvervoltageWarning)
    DEFINE_PROPERTY(bool, DcUndervoltageWarning)
    DEFINE_PROPERTY(bool, CanCommsTimeout)
    DEFINE_PROPERTY(bool, Inverter1FaultWarning)
    DEFINE_PROPERTY(bool, Inverter2FaultWarning)
    DEFINE_PROPERTY(bool, Inverter3FaultWarning)
    DEFINE_PROPERTY(bool, Inverter4FaultWarning)
    DEFINE_PROPERTY(bool, Inverter5FaultWarning)
    DEFINE_PROPERTY(bool, Inverter6FaultWarning)
    DEFINE_PROPERTY(bool, CanSendWarning)
    DEFINE_PROPERTY(bool, LostFramesOnCanBusWarning)
    DEFINE_PROPERTY(bool, OverspeedWarning)
    DEFINE_PROPERTY(bool, CpuOverload)
    DEFINE_PROPERTY(bool, TorqueLimited)
    DEFINE_PROPERTY(bool, StartAtHighRpm)

    // Error Flags
    DEFINE_PROPERTY(bool, InitError)
    DEFINE_PROPERTY(bool, SettingsNotFound)
    DEFINE_PROPERTY(bool, MotorStalled)
    DEFINE_PROPERTY(bool, ControllerDataReadingTimeout)
    DEFINE_PROPERTY(bool, InvalidHallSensorSequence)
    DEFINE_PROPERTY(bool, InvalidHallSector)
    DEFINE_PROPERTY(bool, ErrorReadingTempSensor)
    DEFINE_PROPERTY(bool, PositionSensorReadingError)
    DEFINE_PROPERTY(bool, ErrorReadingEncoder)
    DEFINE_PROPERTY(bool, ZeroPositionOffsetNotSet)
    DEFINE_PROPERTY(bool, HwEnableNotSet)
    DEFINE_PROPERTY(bool, Inverter1TempTooHigh)
    DEFINE_PROPERTY(bool, Inverter2TempTooHigh)
    DEFINE_PROPERTY(bool, Inverter3TempTooHigh)
    DEFINE_PROPERTY(bool, Inverter4TempTooHigh)
    DEFINE_PROPERTY(bool, Inverter5TempTooHigh)
    DEFINE_PROPERTY(bool, Inverter6TempTooHigh)
    DEFINE_PROPERTY(bool, CpuTemperatureTooHigh)
    DEFINE_PROPERTY(bool, HallTemperatureTooHigh)
    DEFINE_PROPERTY(bool, DclinkTemperatureTooHigh)
    DEFINE_PROPERTY(bool, ErrorInDclinkCommunication)
    DEFINE_PROPERTY(bool, Inverter1OvercurrentError)
    DEFINE_PROPERTY(bool, Inverter2OvercurrentError)
    DEFINE_PROPERTY(bool, Inverter3OvercurrentError)
    DEFINE_PROPERTY(bool, Inverter4OvercurrentError)
    DEFINE_PROPERTY(bool, Inverter5OvercurrentError)
    DEFINE_PROPERTY(bool, Inverter6OvercurrentError)
    DEFINE_PROPERTY(bool, DcOvervoltageError)
    DEFINE_PROPERTY(bool, DcUndervoltageError)
    DEFINE_PROPERTY(bool, DoubleCanIdOnBus)
    DEFINE_PROPERTY(bool, CanCommsTimeoutError)
    DEFINE_PROPERTY(bool, Inverter1FaultError)
    DEFINE_PROPERTY(bool, Inverter2FaultError)
    DEFINE_PROPERTY(bool, Inverter3FaultError)
    DEFINE_PROPERTY(bool, Inverter4FaultError)
    DEFINE_PROPERTY(bool, Inverter5FaultError)
    DEFINE_PROPERTY(bool, Inverter6FaultError)
    DEFINE_PROPERTY(bool, CanSendError)
    DEFINE_PROPERTY(bool, LostFramesOnCanBusError)
    DEFINE_PROPERTY(bool, OverspeedError)
    DEFINE_PROPERTY(bool, CpuOverloaded)

public:
    MotorDetailsPacket();
    void populatePacket(const QByteArray& data) override;
    QJsonObject toJson() override;
};

#endif // MOTORDETAILSPACKET_H