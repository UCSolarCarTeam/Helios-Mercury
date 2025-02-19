// MessageAggregatorTest.cpp
#include <QtTest>
#include <QJsonDocument>
#include <QJsonObject>
#include "../src/MessageAggregator/MessageAggregator.h"
//#include "MessageTransmitter.h"
//#include "PacketFactory.h"
#include "../src/Config/JsonDefinitions.h"
#include "../src/Config/ConfigManager.h"

// --- Fake Packet and Factory Classes --- //

/* A simple fake packet class whose toJson() method returns a JSON object
   identifying the packet type. */
class FakePacket {
public:
    explicit FakePacket(const QString &type) : type_(type) {}
    QJsonObject toJson() const {
        QJsonObject obj;
        obj["packetType"] = type_;
        return obj;
    }
private:
    QString type_;
};

/* A fake PacketFactory that returns a FakePacket for every packet type.
   (Assumes that the real PacketFactory interface provides these methods.) */
class FakePacketFactory : public PacketFactory {
public:
    FakePacket getKeyMotorPacket() { return FakePacket("KeyMotor"); }
    FakePacket getB3Packet() { return FakePacket("B3"); }
    FakePacket getTelemetryPacket() { return FakePacket("Telemetry"); }
    FakePacket getBatteryFaultsPacket() { return FakePacket("BatteryFaults"); }
    FakePacket getBatteryPacket() { return FakePacket("Battery"); }
    FakePacket getMbmsPacket() { return FakePacket("MBMS"); }
    FakePacket getProximitySensorsPacket() { return FakePacket("ProximitySensors"); }
    FakePacket getMotorDetailsPacket(int i) { return FakePacket("MotorDetails_" + QString::number(i)); }
    FakePacket getMpptPacket(int i) { return FakePacket("MPPT_" + QString::number(i)); }
};

// --- Fake Transmitter --- //

/* A simple fake MessageTransmitter. Its transmitMessage slot simply
   stores the last message so that it could be checked if needed. */
class FakeMessageTransmitter : public MessageTransmitter {
    Q_OBJECT
public:
    explicit FakeMessageTransmitter(QObject* parent = nullptr)
        : MessageTransmitter(), lastMessage_() {}
public slots:
    // Although transmitMessage is not virtual, the slot mechanism calls this version.
    void transmitMessage(const QByteArray &message) {
        lastMessage_ = message;
        // (Optionally, you could also emit a custom signal here for further testing.)
    }
public:
    QByteArray lastMessage_;
};

// --- The Test Class --- //

class MessageAggregatorTest : public QObject {
    Q_OBJECT
private slots:
    void testCreateJsonMessage();
    void testSignalEmitsPeriodically();
};

void MessageAggregatorTest::testCreateJsonMessage() {
    // Create fake dependencies.
    FakeMessageTransmitter fakeTransmitter;
    FakePacketFactory fakePacketFactory;

    // Create the MessageAggregator with the fake transmitter and packet factory.
    MessageAggregator aggregator(&fakeTransmitter, &fakePacketFactory);

    // Use a QSignalSpy to capture the jsonPacketReady signal.
    QSignalSpy spy(&aggregator, &MessageAggregator::jsonPacketReady);
    QVERIFY(spy.isValid());

    // Since createJsonMessage() is a slot (even if private) we can invoke it using QMetaObject.
    QMetaObject::invokeMethod(&aggregator, "createJsonMessage", Qt::DirectConnection);

    // Verify that the signal was emitted exactly once.
    QCOMPARE(spy.count(), 1);

    // Get the emitted JSON message.
    QByteArray jsonData = spy.takeFirst().at(0).toByteArray();

    // Parse the JSON.
    QJsonDocument doc = QJsonDocument::fromJson(jsonData);
    QVERIFY(!doc.isNull());
    QVERIFY(doc.isObject());
    QJsonObject obj = doc.object();

    // Verify that the basic keys are present.
    QVERIFY(obj.contains(JsonDefinitions::TITLE));
    QVERIFY(obj.contains(JsonDefinitions::TIMESTAMP));
    QVERIFY(obj.contains(JsonDefinitions::KEY_MOTOR));
    QVERIFY(obj.contains(JsonDefinitions::B3));
    QVERIFY(obj.contains(JsonDefinitions::TELEMETRY));
    QVERIFY(obj.contains(JsonDefinitions::BATTERY_FAULTS));
    QVERIFY(obj.contains(JsonDefinitions::BATTERY));
    QVERIFY(obj.contains(JsonDefinitions::MBMS));
    QVERIFY(obj.contains(JsonDefinitions::PROXIMITY_SENSORS));

    // Also check that the motor details and MPPT keys exist.
    int numMotors = ConfigManager::instance().getNumberOfMotors();
    for (int i = 0; i < numMotors; ++i) {
        QString key = JsonDefinitions::MOTOR_DETAILS + QString::number(i);
        QVERIFY(obj.contains(key));
    }
    int numMppts = ConfigManager::instance().getNumberOfMppts();
    for (int i = 0; i < numMppts; ++i) {
        QString key = JsonDefinitions::MPPT + QString::number(i);
        QVERIFY(obj.contains(key));
    }
}

void MessageAggregatorTest::testSignalEmitsPeriodically() {
    // Create fake dependencies.
    FakeMessageTransmitter fakeTransmitter;
    FakePacketFactory fakePacketFactory;

    // Create a MessageAggregator instance with the fakes.
    MessageAggregator aggregator(&fakeTransmitter, &fakePacketFactory);

    // Create a QSignalSpy to capture the jsonPacketReady signal.
    QSignalSpy spy(&aggregator, &MessageAggregator::jsonPacketReady);
    QVERIFY(spy.isValid());

    // Start the transmission timer (which uses the forward period defined in config.ini, defaulting to 500ms).
    aggregator.startTransmission();

    // Wait 1100ms: expecting the timer to trigger at least twice.
    QTest::qWait(1100);

    // Check that at least 2 jsonPacketReady signals have been emitted.
    QVERIFY(spy.count() >= 2);
}

QTEST_MAIN(MessageAggregatorTest)
#include "MessageAggregatorTest.moc"
