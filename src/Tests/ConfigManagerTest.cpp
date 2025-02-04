#include "ConfigManagerTest.h"

#include <QtTest/QtTest>
#include <QFile>
#include <QDir>
#include <QTemporaryDir>
#include <QTextStream>
#include <QDebug>

#include "src/Config/ConfigManager.h"

// Passes if default values are used when no config file exists
void ConfigManagerTest::testNoConfigFile()
{
    QString nonExistentPath = QDir::temp().filePath("this_config_does_not_exist.ini");
    QFile::remove(nonExistentPath); // Just to be sure it's not present

    ConfigManager manager(nonExistentPath);

    QCOMPARE(manager.getForwardPeriod(), 500);
    QCOMPARE(manager.getNumberOfMotors(), 2);
    QCOMPARE(manager.getNumberOfMppts(), 4);
    QCOMPARE(manager.getPacketTitle(), QString("Hermes"));
    QCOMPARE(manager.getPortName(), QString("/dev/ttyUSB0"));
    QCOMPARE(manager.getBaudrate(), 115200);
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

// Passes if unprovided config values default
void ConfigManagerTest::testPartialConfig()
{
    QTemporaryDir tempDir;
    QVERIFY2(tempDir.isValid(), "Failed to create temporary directory for partial config test.");

    QString configPath = tempDir.filePath("partial_config.ini");
    {
        QFile file(configPath);
        QVERIFY2(file.open(QIODevice::WriteOnly | QIODevice::Text),
                 "Could not create partial_config.ini");
        QTextStream out(&file);

        // Provide some keys, omit others

        out << "[UnitNumbers]\n"
            << "numberOfMotors=3\n"      // override default (2)
            << "numberOfMppts=1\n"       // override default (4)
            << "[SerialPort]\n"
            << "portName=/dev/ttyTest\n" // override default (/dev/ttyUSB0)
            << "baudrate=19200\n";       // override default (115200)
        // Notice no [Logging] group, so we rely on default for logLevel_ and loggingEnabled_
        file.close();
    }

    // 3. Instantiate ConfigManager with the partial config
    ConfigManager manager(configPath);

    // 4. Verify that the provided keys override defaults
    QCOMPARE(manager.getNumberOfMotors(), 3);
    QCOMPARE(manager.getNumberOfMppts(), 1);
    QCOMPARE(manager.getPortName(), QString("/dev/ttyTest"));
    QCOMPARE(manager.getBaudrate(), 19200);

    QCOMPARE(manager.getForwardPeriod(), 500);

    QCOMPARE(manager.getPacketTitle(), QString("Hermes"));

    QVERIFY(manager.getLoggingEnabled());
    QCOMPARE(manager.getLogLevel(), 3);
}

// RUN FUNCTION THAT EXECUTES THE TESTS
int runConfigManagerTests(int argc, char** argv)
{
    int status = 0;
    {
        ConfigManagerTest testObj;
        status |= QTest::qExec(&testObj, argc, argv);
    }
    return status;
}

#include "ConfigManagerTest.moc"
