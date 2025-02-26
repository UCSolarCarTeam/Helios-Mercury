#include <QtTest/QtTest>
#include <QJsonObject>
#include <QJsonDocument>
#include "../src/PacketFactory/PacketFactory.h"
#include "../src/Config/ConfigManager.h"
// Import packet headers
#include "../src/PacketFactory/Packets/TelemetryPacket.h"
#include "../src/PacketFactory/Packets/BatteryPacket.h"
#include "../src/PacketFactory/Packets/B3Packet.h"
#include "../src/PacketFactory/Packets/BatteryFaultsPacket.h"
#include "../src/PacketFactory/Packets/KeyMotorPacket.h"
#include "../src/PacketFactory/Packets/MotorDetailsPacket.h"
#include "../src/PacketFactory/Packets/MbmsPacket.h"
#include "../src/PacketFactory/Packets/ProximitySensorsPacket.h"
#include "../src/PacketFactory/Packets/MpptPacket.h"

class PacketFactoryTest : public QObject
{
    Q_OBJECT

private slots:
    void testKeyMotorPacket();
    void testTelemetryPacket();
    void testProximitySensorsPacket();
    void testBatteryPacket();
    void testMbmsPacket();
    void testBatteryFaultsPacket();
    void testB3Packet();
    void testMotorDetailsPackets();
    void testMpptPackets();
};

// Verify if populatePacket() generates required fields for KeyMotor
void PacketFactoryTest::testKeyMotorPacket() {
    // Create instance of PacketFactory
    PacketFactory factory;
    // Make empty QByteArray, all fields will equal 0 for this test
    QByteArray data;
    // Get packet object to convert to JsonDoc
    auto& packet = factory.getKeyMotorPacket();
    packet.populatePacket(data);
    QJsonObject json = packet.toJson();
    QJsonDocument doc(json);
    qDebug() << doc.toJson();
    // Verify if required fields populate into packet, will populate as 0ss
    QVERIFY(!json.isEmpty());
    QVERIFY(json.contains("ControlMode"));
    QVERIFY(json.contains("DebugMode"));
    QVERIFY(json.contains("MotorMode"));
    QVERIFY(json.contains("MotorSetpoint"));
    QVERIFY(json.contains("SoftwareEnable"));
}

// Verify if populatePacket() generates required fields for B3
void PacketFactoryTest::testB3Packet() {
    PacketFactory factory;
    QByteArray data;
    auto &packet = factory.getB3Packet();
    packet.populatePacket(data);
    QJsonObject json = packet.toJson();
    QJsonDocument doc(json);
    qDebug() << doc.toJson(QJsonDocument::Indented);
    QVERIFY(!json.isEmpty());
    QVERIFY(json.contains("Acceleration"));
    QVERIFY(json.contains("BrakeLightSignalOut"));
    QVERIFY(json.contains("BrakeSwitch"));
    QVERIFY(json.contains("DaytimeRunningLightSignalOut"));
    QVERIFY(json.contains("ForwardIn"));
    QVERIFY(json.contains("ForwardSwitchIn"));
    QVERIFY(json.contains("HandbrakeSwitch"));
    QVERIFY(json.contains("HazardLightsIn"));
    QVERIFY(json.contains("HeadightsSwitchIn"));
    QVERIFY(json.contains("HeadlightSignalOut"));
    QVERIFY(json.contains("HornSignalOut"));
    QVERIFY(json.contains("HornSwitchIn"));
    QVERIFY(json.contains("Lap"));
    QVERIFY(json.contains("LeftSignalIn"));
    QVERIFY(json.contains("LeftSignalOut"));
    QVERIFY(json.contains("MotorReset"));
    QVERIFY(json.contains("Neutral"));
    QVERIFY(json.contains("RaceMode"));
    QVERIFY(json.contains("RegenBraking"));
    QVERIFY(json.contains("Reverse"));
    QVERIFY(json.contains("RightSignalIn"));
    QVERIFY(json.contains("RightSignalOut"));
    QVERIFY(json.contains("ZoomZoom"));
}

// Verify if populatePacket() generates required fields for Battery
void PacketFactoryTest::testBatteryPacket() {
    PacketFactory factory;
    QByteArray data;
    auto &packet = factory.getBatteryPacket();
    packet.populatePacket(data);
    QJsonObject json = packet.toJson();
    QJsonDocument doc(json);
    qDebug() << doc.toJson(QJsonDocument::Indented);
    QVERIFY(json.contains("AlwaysOnSignalStatus"));
    QVERIFY(json.contains("BatteryCell"));
    QVERIFY(json.contains("BatteryFan"));
    QVERIFY(json.contains("BatteryPack"));
    QVERIFY(json.contains("BatteryTemperature"));
    QVERIFY(json.contains("BmuAlive"));
    QVERIFY(json.contains("ChargeRelayEnabled"));
    QVERIFY(json.contains("ChargerSafetyEnabled"));
    QVERIFY(json.contains("DischargeRelayEnabled"));
    QVERIFY(json.contains("HighThermistorId"));
    QVERIFY(json.contains("IsChargingSignalStatus"));
    QVERIFY(json.contains("IsReadySignalStatus"));
    QVERIFY(json.contains("LowThermistorId"));
    QVERIFY(json.contains("MalfunctionIndicatorActive"));
    QVERIFY(json.contains("MultiPurposeInputSignalStatus"));
}

// Verify if populatePacket() generates required fields for BatteryFaults
void PacketFactoryTest::testBatteryFaultsPacket() {
    PacketFactory factory;
    QByteArray data;
    auto &packet = factory.getBatteryFaultsPacket();
    packet.populatePacket(data);
    QJsonObject json = packet.toJson();
    QJsonDocument doc(json);
    QVERIFY(json.contains("Errors"));
    QJsonObject errorsObj = json["Errors"].toObject();
    QStringList expectedErrors = {
        "AlwaysOnSupplyFault",
        "CanbusCommunicationFault",
        "ChargeLimitEnforcementFault",
        "ChargerSafetyRelayFault",
        "CurrentSensorFault",
        "DischargeLimitEnforcementFault",
        "FanMonitorFault",
        "HighVoltageIsolationFault",
        "InternalCommunicationFault",
        "InternalConversionFault",
        "InternalLogicFault",
        "InternalMemoryFault",
        "InternalThermistorFault",
        "LowCellVoltageFault",
        "OpenWiringFault",
        "PackVoltageSensorFault",
        "PowerSupply12VFault",
        "ThermistorFault",
        "VoltageRedundancyFault",
        "WeakCellFault",
        "WeakPackFault"
    };
    for (const QString &field : expectedErrors) {
        QVERIFY(errorsObj.contains(field));
        QCOMPARE(errorsObj[field].toBool(), false);
    }

    // Verify that the Warnings object exists and contains all expected fields with false values.
    QVERIFY(json.contains("Warnings"));
    QJsonObject warningsObj = json["Warnings"].toObject();
    QStringList expectedWarnings = {
        "CclReducedDueToAlternateCurrentLimit",
        "CclReducedDueToChargerLatch",
        "CclReducedDueToHighCellResistance",
        "CclReducedDueToHighCellVoltage",
        "CclReducedDueToHighPackVoltage",
        "CclReducedDueToHighSoc",
        "CclReducedDueToTemperature",
        "DclAndCclReducedDueToCommunicationFailsafe",
        "DclAndCclReducedDueToVoltageFailsafe",
        "DclReducedDueToHighCellResistance",
        "DclReducedDueToLowCellVoltage",
        "DclReducedDueToLowPackVoltage",
        "DclReducedDueToLowSoc",
        "DclReducedDueToTemperature"
    };
    for (const QString &field : expectedWarnings) {
        QVERIFY(warningsObj.contains(field));
        QCOMPARE(warningsObj[field].toBool(), false);
    }
}

// Verify if populatePacket() generates required fields for Mbms
void PacketFactoryTest::testMbmsPacket() {
    PacketFactory factory;
    QByteArray data;
    auto &packet = factory.getMbmsPacket();
    packet.populatePacket(data);
    QJsonObject json = packet.toJson();
    QJsonDocument doc(json);
    qDebug() << doc.toJson(QJsonDocument::Indented);
    QVERIFY(json.contains("AllowCharge"));
    QVERIFY(json.contains("AllowDischarge"));
    QVERIFY(json.contains("ArrayContactorError"));
    QVERIFY(json.contains("ArrayContactorState"));
    QVERIFY(json.contains("ArrayCurrent"));
    QVERIFY(json.contains("ArrayHighTemperatureCurrentTrip"));
    QVERIFY(json.contains("ArrayVoltage"));
    QVERIFY(json.contains("AuxillaryBatteryVoltage"));
    QVERIFY(json.contains("ChargeContactorError"));
    QVERIFY(json.contains("ChargeContactorState"));
    QVERIFY(json.contains("ChargeCurrent"));
    QVERIFY(json.contains("ChargeHighTemperatureCurrentTrip"));
    QVERIFY(json.contains("ChargeShouldTrip"));
    QVERIFY(json.contains("ChargeVoltage"));
    QVERIFY(json.contains("CommonContactorError"));
    QVERIFY(json.contains("CommonContactorState"));
    QVERIFY(json.contains("CommonCurrent"));
    QVERIFY(json.contains("ContactorDisconnectedUnexpectedlyTrip"));
    QVERIFY(json.contains("DischargeShouldTrip"));
    QVERIFY(json.contains("HighCellVoltageTrip"));
    QVERIFY(json.contains("HighCommonCurrentTrip"));
    QVERIFY(json.contains("HighVoltageEnableState"));
    QVERIFY(json.contains("LowCellVoltageTrip"));
    QVERIFY(json.contains("LvContactorError"));
    QVERIFY(json.contains("LvContactorState"));
    QVERIFY(json.contains("LvCurrent"));
    QVERIFY(json.contains("LvHighTemperatureCurrentTrip"));
    QVERIFY(json.contains("LvVoltage"));
    QVERIFY(json.contains("MotorContactorError"));
    QVERIFY(json.contains("MotorContactorState"));
    QVERIFY(json.contains("MotorCurrent"));
    QVERIFY(json.contains("MotorHighTemperatureCurrentTrip"));
    QVERIFY(json.contains("MotorVoltage"));
    QVERIFY(json.contains("OrionCanReceivedRecently"));
    QVERIFY(json.contains("OrionMessageTimeoutTrip"));
    QVERIFY(json.contains("ProtectionTrip"));
    QVERIFY(json.contains("StrobeBmsLight"));
}

// Verify if populatePacket() generates required fields for Mppt
void PacketFactoryTest::testMpptPackets() {
    PacketFactory factory;
    QByteArray data;
    for (int i = 0; i < 4; ++i) {
        auto &packet = factory.getMpptPacket(i);
        packet.populatePacket(data);
        QJsonObject json = packet.toJson();
        QJsonDocument doc(json);
        qDebug() << "MPPT" << i << ":" << doc.toJson(QJsonDocument::Indented);

        // Verify that each expected field is present.
        QVERIFY(json.contains("ArrayCurrent"));
        QVERIFY(json.contains("ArrayVoltage"));
        QVERIFY(json.contains("BatteryVoltage"));
        QVERIFY(json.contains("ChannelNumber"));
        QVERIFY(json.contains("IsAlive"));
        QVERIFY(json.contains("Temperature"));
    }
}

// Verify if populatePacket() generates required fields for MotorDetails
void PacketFactoryTest::testMotorDetailsPackets() {
    PacketFactory factory;
    QByteArray data;
    QStringList expectedTopFields = {
        "AbsoluteAngle", "ControlMode", "ControlValue", "CurrentMotorPower",
        "CurrentMotorTorque", "CurrentRpmValue", "DebugMode", "InverterPeakCurrent",
        "MotorMode", "MotorTemperature", "SoftwareEnable"
    };

    // Define the expected fields for MotorErrors.
    QStringList expectedErrors = {
        "CanCommsTimeoutError", "CanSendError", "ControllerDataReadingTimeout",
        "CpuOverload", "CpuTempTooHigh", "DcOvervoltageError", "DcUndervoltageError",
        "DclinkTempTooHigh", "DoubleCanIdOnBus", "ErrorInDclinkCommunication",
        "ErrorReadingEncoder", "ErrorReadingTempSensor", "HallTempTooHigh",
        "HwEnableNotSet", "InitError", "InvalidHallSector", "InvalidHallSensorSequence",
        "Inverter1FaultError", "Inverter1OvercurrentError", "Inverter1TempTooHigh",
        "Inverter2FaultError", "Inverter2OvercurrentError", "Inverter2TempTooHigh",
        "Inverter3FaultError", "Inverter3OvercurrentError", "Inverter3TempTooHigh",
        "Inverter4FaultError", "Inverter4OvercurrentError", "Inverter4TempTooHigh",
        "Inverter5FaultError", "Inverter5OvercurrentError", "Inverter5TempTooHigh",
        "Inverter6FaultError", "Inverter6OvercurrentError", "Inverter6TempTooHigh",
        "LostFramesOnCanBusError", "MotorStalled", "OverspeedError",
        "PositionSensorReadingError", "SettingsNotFound", "ZeroPositionOffsetNotSet"
    };

    // Define the expected fields for MotorWarnings.
    QStringList expectedWarnings = {
        "CanCommsTimeoutWarning", "CanSendWarning", "CpuOverload", "CpuTemperatureVeryHigh",
        "DcOvervoltageWarning", "DcUndervoltageWarning", "DclinkTemperatureVeryHigh",
        "DelayInDclinkCommunication", "DelayInReadingPosSensor", "DelayInReadingTempSensor",
        "HallTemperatureVeryHigh", "Inverter1FaultWarning", "Inverter1OverCurrentWarning",
        "Inverter1TempVeryHigh", "Inverter2FaultWarning", "Inverter2OverCurrentWarning",
        "Inverter2TempVeryHigh", "Inverter3FaultWarning", "Inverter3OverCurrentWarning",
        "Inverter3TempVeryHigh", "Inverter4FaultWarning", "Inverter4OverCurrentWarning",
        "Inverter4TempVeryHigh", "Inverter5FaultWarning", "Inverter5OverCurrentWarning",
        "Inverter5TempVeryHigh", "Inverter6FaultWarning", "Inverter6OverCurrentWarning",
        "Inverter6TempVeryHigh", "LostFramesOnCanBusWarning", "MotorAboutToStall",
        "OverspeedWarning", "StartAtHighRpm", "TorqueLimited"
    };

    for (int i = 0; i < 2; ++i) {
        auto &packet = factory.getMotorDetailsPacket(i);
        packet.populatePacket(data);
        QJsonObject json = packet.toJson();
        QJsonDocument doc(json);
        qDebug() << "MotorDetails" << i << ":" << doc.toJson(QJsonDocument::Indented);

        // Check top-level fields.
        for (const QString &field : expectedTopFields) {
            QVERIFY(json.contains(field));
        }

        // Check the MotorErrors object and its fields.
        QVERIFY(json.contains("MotorErrors"));
        QJsonObject errorsObj = json["MotorErrors"].toObject();
        for (const QString &field : expectedErrors) {
            QVERIFY(errorsObj.contains(field));
        }

        // Check the MotorWarnings object and its fields.
        QVERIFY(json.contains("MotorWarnings"));
        QJsonObject warningsObj = json["MotorWarnings"].toObject();
        for (const QString &field : expectedWarnings) {
            QVERIFY(warningsObj.contains(field));
        }
    }
}

// Verify if populatePacket() generates required fields for ProximitySensors
void PacketFactoryTest::testProximitySensorsPacket() {
    PacketFactory factory;
    QByteArray data;
    auto &packet = factory.getProximitySensorsPacket();
    packet.populatePacket(data);
    QJsonObject json = packet.toJson();
    QJsonDocument doc(json);
    qDebug() << doc.toJson(QJsonDocument::Indented);
    QVERIFY(json.contains("ProximitySensor1"));
    QVERIFY(json.contains("ProximitySensor2"));
    QVERIFY(json.contains("ProximitySensor3"));
    QVERIFY(json.contains("ProximitySensor4"));
}

// Verify if populatePacket() generates required fields for Telemetry
void PacketFactoryTest::testTelemetryPacket() {
    PacketFactory factory;
    QByteArray data;
    auto &packet = factory.getTelemetryPacket();
    packet.populatePacket(data);
    QJsonObject json = packet.toJson();
    QJsonDocument doc(json);
    qDebug() << doc.toJson(QJsonDocument::Indented);
    QVERIFY(json.contains("GpsAdditionalFlags"));
    QVERIFY(json.contains("GpsDay"));
    QVERIFY(json.contains("GpsFixStatusFlags"));
    QVERIFY(json.contains("GpsHour"));
    QVERIFY(json.contains("GpsLatitude"));
    QVERIFY(json.contains("GpsLongitude"));
    QVERIFY(json.contains("GpsMinute"));
    QVERIFY(json.contains("GpsMonth"));
    QVERIFY(json.contains("GpsSecond"));
    QVERIFY(json.contains("GpsValidityFlags"));
    QVERIFY(json.contains("GpsYear"));
    QVERIFY(json.contains("MpuAccelerationX"));
    QVERIFY(json.contains("MpuAccelerationY"));
    QVERIFY(json.contains("MpuAccelerationZ"));
    QVERIFY(json.contains("MpuRotationX"));
    QVERIFY(json.contains("MpuRotationY"));
    QVERIFY(json.contains("MpuRotationZ"));
    QVERIFY(json.contains("MpuTemperature"));
}

QTEST_MAIN(PacketFactoryTest)
#include "PacketFactoryTest.moc"
