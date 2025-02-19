// MessageTransmitterTest.cpp
#include <QtTest>
#include "../src/MessageTransmitter/MessageTransmitter.h"
#include <QMqttClient>
#include <QTimer>

// --- Custom Debug Message Handler --- //
// We capture debug messages so we can check for the "Publishing" output.
static QStringList debugMessages;

void testMessageHandler(QtMsgType type, const QMessageLogContext & /*context*/, const QString &msg)
{
    if (type == QtDebugMsg)
        debugMessages << msg;
}

// --- The Test Class --- //

class MessageTransmitterTest : public QObject
{
    Q_OBJECT

private slots:
    void testTransmitMessageWhenDisconnected();
    void testReconnect();
};

void MessageTransmitterTest::testTransmitMessageWhenDisconnected() {
    // Install the custom message handler.
    qInstallMessageHandler(testMessageHandler);
    debugMessages.clear();

    // Create a MessageTransmitter instance.
    MessageTransmitter transmitter;

    // Clear any messages that may have been produced during setup.
    debugMessages.clear();

    // Prepare a test message.
    QByteArray testMessage("Test message");

    // Call transmitMessage().
    transmitter.transmitMessage(testMessage);

    // "Publishing to TELEMETRY MQTT Service" should NOT print since service disconnected
    bool foundPublishingMessage = false;
    for (const QString &msg : debugMessages) {
        if (msg.contains("Publishing to TELEMETRY MQTT Service")) {
            foundPublishingMessage = true;
            break;
        }
    }
    QVERIFY(!foundPublishingMessage);
    // (The test verifies that no publish attempt was made in the disconnected state.)
}

void MessageTransmitterTest::testReconnect() {
    // Install our custom debug message handler.
    qInstallMessageHandler(testMessageHandler);
    debugMessages.clear();

    MessageTransmitter transmitter;

    // In our case, RETRY_PERIOD is 5 seconds, so waiting 6 seconds for retry logic
    QTest::qWait(6000);

    // The disconnect handler should have printed the retry message since we aren't connected
    bool foundRetryMessage = false;
    for (const QString &msg : debugMessages) {
        if (msg.contains("Connection to TELEMETRY MQTT Service Failed - retrying in 5s...")) {
            foundRetryMessage = true;
            break;
        }
    }
    QVERIFY(foundRetryMessage);

    // Restore the default message handler.
    qInstallMessageHandler(nullptr);
}

QTEST_MAIN(MessageTransmitterTest)
#include "MessageTransmitterTest.moc"
