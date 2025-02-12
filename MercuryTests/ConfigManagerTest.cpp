#include <QtTest/QtTest>
#include <QFile>
#include <QDir>
#include <QTemporaryDir>
#include <QTextStream>
#include <QDebug>

#include "../src/Config/ConfigManager.h"  // Adjust path as needed for your test subproject

/*!
 * \brief Unit test class for ConfigManager.
 */
class ConfigManagerTest : public QObject
{
    Q_OBJECT

private slots:
    void testNoConfigFile();
    void testPartialConfig();
};

/*!
 * \brief Ensure default values are loaded if no config file exists.
 */
void ConfigManagerTest::testNoConfigFile()
{
    // Create a path to config.ini
    QString configPath = QDir(QCoreApplication::applicationDirPath()).filePath("config.ini");
    QString backupPathOne = configPath + ".bak";
    // Create backup for config.ini
    bool copySuccess = QFile::copy(configPath, backupPathOne);
    QVERIFY2(copySuccess, qPrintable(QString("%1").arg(backupPathOne)));

    // Remove original config.ini
    QFile::remove(configPath);
    QVERIFY2(!QFile::exists(configPath),
             qPrintable(QString("Failed to remove config.ini at: %1").arg(configPath)));

    QString fallbackConfigPath = QDir(QCoreApplication::applicationDirPath()).filePath("../config.ini");
    QString backupPathTwo = fallbackConfigPath + ".bak";

    // Backup fallback config.ini
    copySuccess = QFile::copy(fallbackConfigPath, backupPathTwo);
    QVERIFY2(copySuccess, "Failed to create backup of config.ini");
    // Remove fallback config.ini to enforce default values
    QFile::remove(fallbackConfigPath);
    QVERIFY2(!QFile::exists(fallbackConfigPath),
             qPrintable(QString("Failed to remove fallback config.ini at: %1").arg(configPath)));

    // Create instance of ConfigManager
    ConfigManager& manager = ConfigManager::instance();

    // Verify that all getters return their default values
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

    // Restore fallback config.ini to its original path and remove backups
    copySuccess = QFile::copy(backupPathOne, configPath);
    QVERIFY2(copySuccess, "Failed to restore config.ini from backup");
    copySuccess = QFile::copy(backupPathTwo, fallbackConfigPath);
    QVERIFY2(copySuccess, "Failed to restore fallback config.ini from backup");

    QFile::remove(backupPathOne);
    QFile::remove(backupPathTwo);

}

/*!
 * \brief Test that missing keys default correctly, while provided keys override defaults.
 */
void ConfigManagerTest::testPartialConfig()
{
    // Replace current config with a partial config.ini
    QString configPath = QDir(QCoreApplication::applicationDirPath()).filePath("config.ini");
    QString backupPathOne = configPath + ".bak";

    // Create backup for config.ini
    bool copySuccess = QFile::copy(configPath, backupPathOne);
    QVERIFY2(copySuccess, qPrintable(QString("%1").arg(backupPathOne)));

    // Remove original config.ini
    QFile::remove(configPath);

    QString fallbackConfigPath = QDir(QCoreApplication::applicationDirPath()).filePath("config.ini");

    // Write a config file with missing sections/keys
    {
        QFile file(fallbackConfigPath);
        QVERIFY2(file.open(QIODevice::WriteOnly | QIODevice::Text),
                 "Could not create partial Config.ini");
        QTextStream out(&file);

        // Provide some keys, omit others
        out << "[UnitNumbers]\n"
            << "numberOfMotors=3\n"      // override default (2)
            << "numberOfMppts=1\n"       // override default (4)
            << "[SerialPort]\n"
            << "portName=/dev/ttyTest\n" // override default (/dev/ttyUSB0)
            << "baudrate=19200\n";       // override default (115200)
        // No [Logging] group, so we rely on default for logLevel_ and loggingEnabled_
        file.close();
    }

    // Instantiate ConfigManager with the partial config
    ConfigManager& manager = ConfigManager::instance();

    // Verify that the provided keys override defaults
    QCOMPARE(manager.getNumberOfMotors(), 3);
    QCOMPARE(manager.getNumberOfMppts(), 1);
    QCOMPARE(manager.getPortName(), QString("/dev/ttyTest"));
    QCOMPARE(manager.getBaudrate(), 19200);

    // Verify that missing keys fall back to default values
    QCOMPARE(manager.getForwardPeriod(), 500);
    QCOMPARE(manager.getPacketTitle(), QString("Hermes"));
    QVERIFY(manager.getLoggingEnabled());
    QCOMPARE(manager.getLogLevel(), 3);

    copySuccess = QFile::copy(backupPathOne, configPath);
    QVERIFY2(copySuccess, "Failed to restore config.ini from backup");
    QFile::remove(backupPathOne);

}

// Qt Test macro to generate a standalone test executable
QTEST_MAIN(ConfigManagerTest)
#include "ConfigManagerTest.moc"
