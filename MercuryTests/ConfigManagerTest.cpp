#include <QtTest/QtTest>
#include <QFile>
#include <QDir>
#include <QTemporaryDir>
#include <QTextStream>
#include <QDebug>

#include "../src/Config/ConfigManager.h"

/*!
 * \brief Unit test class for ConfigManager.
 */
class ConfigManagerTest : public QObject
{
    Q_OBJECT

private slots:
    void testNormalConfig();
    void testNoConfigFile();
    void testPartialConfig();
};

/*!
 * \brief Ensure normal config file can be read correctly
 */
void ConfigManagerTest::testNormalConfig()
{
    // Create a temporary directory for our config file
    QTemporaryDir tempDir;
    QVERIFY2(tempDir.isValid(), "Failed to create a temporary directory for normal config test.");

    QString configPath = tempDir.filePath("config.ini");

    // Write a "normal" config.ini with all keys
    {
        QFile file(configPath);
        QVERIFY2(file.open(QIODevice::WriteOnly | QIODevice::Text),
                 "Could not open config.ini for writing.");
        QTextStream out(&file);

        out << "; Hermes Specification File\n"
            << "\n"
            << "forwardPeriod=500\n"
            << "\n"
            << "[UnitNumbers]\n"
            << "numberOfMotors=2\n"
            << "numberOfMppts=4\n"
            << "\n"
            << "[JsonFormat]\n"
            << "packetTitle=Helios\n"
            << "\n"
            << "[SerialPort]\n"
            << "portName=/dev/pts/2\n"
            << "baudrate=115200\n"
            << "\n"
            << "[Mqtt]\n"
            << "telemetryTopic=packet\n"
            << "pingTopic=ping\n"
            << "pongTopic=pong\n"
            << "telemetryHostname=aedes.calgarysolarcar.ca\n"
            << "telemetryPort=1883\n"
            << "telemetryUsername=BEGONE\n"
            << "telemetryPassword=NiceTryBud\n"
            << "\n"
            << "[Logging]\n"
            << "logLevel=3\n"
            << "loggingEnabled=true\n";

        file.close();
    }

    // Instantiate ConfigManager using this normal config
    ConfigManager manager(configPath);

    // Verify all fields match the expected values
    QCOMPARE(manager.getForwardPeriod(), 500);
    QCOMPARE(manager.getNumberOfMotors(), 2);
    QCOMPARE(manager.getNumberOfMppts(), 4);
    QCOMPARE(manager.getPacketTitle(), QString("Helios"));

    QCOMPARE(manager.getPortName(), QString("/dev/pts/2"));
    QCOMPARE(manager.getBaudrate(), 115200);

    QCOMPARE(manager.getTelemetryTopic(), QString("packet"));
    QCOMPARE(manager.getPingTopic(), QString("ping"));
    QCOMPARE(manager.getPongTopic(), QString("pong"));
    QCOMPARE(manager.getTelemetryHostname(), QString("aedes.calgarysolarcar.ca"));
    QCOMPARE(manager.getTelemetryPort(), 1883);
    QCOMPARE(manager.getTelemetryUsername(), QString("BEGONE"));
    QCOMPARE(manager.getTelemetryPassword(), QString("NiceTryBud"));

    QCOMPARE(manager.getLogLevel(), 3);
    QVERIFY(manager.getLoggingEnabled());
}

/*!
 * \brief Ensure fallback values are loaded if no config file exists.
 */
void ConfigManagerTest::testNoConfigFile()
{
    QString nonExistentPath = QDir::temp().filePath("thisConfigDoesNotExist.ini");
    QFile::remove(nonExistentPath); // Just to be sure it's not present

    // Instantiate ConfigManager using non existent path
    ConfigManager manager(nonExistentPath);

    // Ensure fallback values are loaded
    QCOMPARE(manager.getForwardPeriod(), 500);
    QCOMPARE(manager.getNumberOfMotors(), 2);
    QCOMPARE(manager.getNumberOfMppts(), 4);
    QCOMPARE(manager.getPacketTitle(), QString("Helios"));
    QCOMPARE(manager.getPortName(), QString("/dev/pts/2"));
    QCOMPARE(manager.getBaudrate(), 115200);
    QCOMPARE(manager.getTelemetryTopic(), QString("packet"));
    QCOMPARE(manager.getPingTopic(), QString("ping"));
    QCOMPARE(manager.getPongTopic(), QString("pong"));
    QCOMPARE(manager.getTelemetryHostname(), QString("aedes.calgarysolarcar.ca"));
    QCOMPARE(manager.getTelemetryPort(), 1883);
    QCOMPARE(manager.getTelemetryUsername(), QString("BEGONE"));
    QCOMPARE(manager.getTelemetryPassword(), QString("NiceTryBud"));
    QCOMPARE(manager.getLogLevel(), 3);
    QVERIFY(manager.getLoggingEnabled());

}

/*!
 * \brief Test that missing keys default correctly, while provided keys override defaults.
 */
void ConfigManagerTest::testPartialConfig()
{
    // Create a temporary directory for the partial config file
    QTemporaryDir tempDir;
    QVERIFY2(tempDir.isValid(), "Failed to create a temporary directory for partial config test.");

    QString configPath = tempDir.filePath("partialConfig.ini");

    // Partially define some groups/keys, omitting others
    {
        QFile file(configPath);
        QVERIFY2(file.open(QIODevice::WriteOnly | QIODevice::Text),
                 "Could not open partialConfig.ini for writing.");

        QTextStream out(&file);
        // Overriding a few fields...
        out << "[UnitNumbers]\n"
            << "numberOfMotors=3\n"      // overrides default (2)
            << "numberOfMppts=1\n"       // overrides default (4)
            << "[SerialPort]\n"
            << "portName=/dev/ttyTest\n" // overrides default (/dev/ttyUSB0)
            << "baudrate=19200\n";       // overrides default (115200)

        // No forwardPeriod, no Mqtt group, no Logging group, etc.—so those remain default
        file.close();
    }

    // Instantiate ConfigManager with this partial config file
    ConfigManager manager(configPath);

    // Check that the *overridden* keys match what we wrote:
    QCOMPARE(manager.getNumberOfMotors(), 3);
    QCOMPARE(manager.getNumberOfMppts(), 1);
    QCOMPARE(manager.getPortName(), QString("/dev/ttyTest"));
    QCOMPARE(manager.getBaudrate(), 19200);

    // Check that all missing keys stay at their default values:
    QCOMPARE(manager.getForwardPeriod(), 500);
    QCOMPARE(manager.getPacketTitle(), QString("Hermes"));
    QCOMPARE(manager.getTelemetryTopic(), QString("packet"));
    QCOMPARE(manager.getPingTopic(), QString("ping"));
    QCOMPARE(manager.getPongTopic(), QString("pong"));
    QCOMPARE(manager.getTelemetryHostname(), QString("aedes.solarcar.ca"));
    QCOMPARE(manager.getTelemetryPort(), 1883);
    QCOMPARE(manager.getTelemetryUsername(), QString("YouDontBelongHere"));
    QCOMPARE(manager.getTelemetryPassword(), QString("QuitBeingNaughty"));
    QCOMPARE(manager.getLogLevel(), 3);
    QVERIFY(manager.getLoggingEnabled());
}


// Qt Test macro to generate a standalone test executable
QTEST_MAIN(ConfigManagerTest)
#include "ConfigManagerTest.moc"
