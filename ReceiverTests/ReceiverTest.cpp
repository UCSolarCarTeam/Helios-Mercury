#include <QtTest>
#include "../src/Receivers/SerialReceiver.h"
#include "../src/Receivers/TelemetryReceiver.h"
#include "../src/Config/ConfigManager.h"
#include <QMqttTopicName>

static QStringList debugMessages;

// Custom message handler to capture qDebug() output.
static void customDebugMessageHandler(QtMsgType, const QMessageLogContext &, const QString &msg)
{
    debugMessages << msg;
}

class ReceiverTest : public QObject
{
    Q_OBJECT

private slots:
    void testSerialReceiverHandleEmptyData();
    void testTelemetryReceiverOnMessage();
    void testTelemetryReceiverPingTopic();
    void testDisconnectedRetryMessage();
};

// Note: Open a serial port on terminal for this test case
// Verfies if dataReceived signal
void ReceiverTest::testSerialReceiverHandleEmptyData() {
    SerialReceiver receiver;
    QSignalSpy spy(&receiver, SIGNAL(dataReceived(QByteArray)));

    // Invoke handleReadyRead without any data in the QSerialPort buffer.
    bool invoked = QMetaObject::invokeMethod(&receiver, "handleReadyRead", Qt::DirectConnection);
    QVERIFY(invoked);

    // Since there is no data, no signal should be emitted.
    QCOMPARE(spy.count(), 0);
}

// Simple simulation to verify onMessageReceived works
void ReceiverTest::testTelemetryReceiverOnMessage()
{
    TelemetryReceiver receiver;

    // Create a dummy topic (one that is not the ping topic).
    QMqttTopicName dummyTopic("NotPingTopic");
    QByteArray dummyMessage("Test Message");

    // This simulates receiving a message on an unregistered topic.
    bool invoked = QMetaObject::invokeMethod(&receiver, "onMessageReceived",
                                             Qt::DirectConnection,
                                             Q_ARG(QByteArray, dummyMessage),
                                             Q_ARG(QMqttTopicName, dummyTopic));

    // We simply verify that the method was invoked.
    QVERIFY(invoked);
}

// Note: test on open Telemetry port
void ReceiverTest::testTelemetryReceiverPingTopic() {
    TelemetryReceiver receiver;

    // Retrieve the internal QMqttClient via QObject::findChild.
    QMqttClient* client = receiver.findChild<QMqttClient*>();
    QVERIFY(client);

    // Connect to the client's errorChanged signal to detect if publish() would have failed.
    QSignalSpy errorSpy(client, SIGNAL(errorChanged(QMqttClient::ClientError)));

    // Get the ping topic from the configuration.
    QString pingTopic = ConfigManager::instance().getPingTopic();
    QMqttTopicName topic(pingTopic);
    QByteArray dummyMessage("Ping");

    // This triggers TelemetryReceiver::onMessageReceived, which should call sendPong.
    emit client->messageReceived(dummyMessage, topic);

    QTest::qWait(1000);

    // Verify that no error was signaled during sendPong.
    QCOMPARE(errorSpy.count(), 0);

    // Also verify that the client is still connected.
    QVERIFY(client->state() == QMqttClient::Connected);
}

void ReceiverTest::testDisconnectedRetryMessage() {
    // Clear captured messages and install our custom handler.
    debugMessages.clear();
    qInstallMessageHandler(customDebugMessageHandler);

    TelemetryReceiver receiver;
    QMqttClient* client = receiver.findChild<QMqttClient*>();
    QVERIFY(client);

    // Force a disconnection. If the client is connected, disconnectFromHost() should emit disconnected.
    client->disconnectFromHost();

    // Wait 1 sec so that QTimer::singleShot has a chance to fire.
    QTest::qWait(1000);

    // Check the debug messages for the expected retry message.
    bool found = false;
    for (const QString &msg : debugMessages) {
        if (msg.contains("Connection to RECEIVER Service Failed - retrying in 5s..."))
            found = true;
    }
    QVERIFY(found);

    // Restore the default message handler.
    qInstallMessageHandler(nullptr);
}


QTEST_MAIN(ReceiverTest)
#include "ReceiverTest.moc"
