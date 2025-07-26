#include "ConfigManager.h"

#include <QSettings>
#include <QFile>
#include <QCoreApplication>
#include <QDir>

/** Singleton instance of ConfigManager */
ConfigManager& ConfigManager::instance() {
    static ConfigManager instance(QDir(QCoreApplication::applicationDirPath()).filePath("config.ini"));
    return instance;
}

/** Read ini file and assign settings values */
ConfigManager::ConfigManager(const QString& path){
    qDebug() << "Reading Config File at: " << path;

    QString configPath = path;

    if (!QFile::exists(configPath)) {
        qDebug() << "WARNING: Config file does not exist at path:" << configPath;
        qDebug() << "Trying ../config.ini";
        QString fallbackPath = QDir(QCoreApplication::applicationDirPath()).filePath("../config.ini");
        if (QFile::exists(fallbackPath)) {
            qDebug() << "Reading fallback Config File at: " << fallbackPath;
            configPath = fallbackPath;
        } else {
            qDebug() << "WARNING: Fallback config file does not exist at path:" << fallbackPath;
            qDebug() << "Default settings will be used, this may cause unexpected behavior";
        }
    }

    QSettings settings(configPath, QSettings::IniFormat);
    

    forwardPeriod_ = settings.value("forwardPeriod", 500).toInt();

    settings.beginGroup("UnitNumbers");
    numberOfMotors_ = settings.value("numberOfMotors", 2).toInt();
    numberOfMppts_ = settings.value("numberOfMppts", 4).toInt();
    settings.endGroup();

    settings.beginGroup("JsonFormat");
    packetTitle_ = settings.value("packetTitle", "Hermes").toString();
    settings.endGroup();

    settings.beginGroup("SerialPort");
    portName_ = settings.value("portName", "/dev/ttyUSB0").toString();
    baudrate_ = settings.value("baudrate", 115200).toInt();
    settings.endGroup();

    settings.beginGroup("Can");
    canInterface_ = settings.value("interface", "can0").toString();
    settings.endGroup();

    settings.beginGroup("Mqtt");
    telemetryTopic_ = settings.value("telemetryTopic", "packet").toString();
    pingTopic_ = settings.value("pingTopic", "ping").toString();
    pongTopic_ = settings.value("pongTopic", "pong").toString();
    receiverTopic_ = settings.value("receiverTopic", "telemetryToCar").toString();
    telemetryHostname_ = settings.value("telemetryHostname", "aedes.IDontWantToKeepConnecting.ca").toString();
    telemetryPort_ = settings.value("telemetryPort", 1883).toInt();
    telemetryUsername_ = settings.value("telemetryUsername", "YouDontBelongHere").toString();
    telemetryPassword_ = settings.value("telemetryPassword", "QuitBeingNaughty").toString();
    settings.endGroup();

    settings.beginGroup("Logging");
    loggingEnabled_ = settings.value("loggingEnabled", true).toBool();
    logPath_ = settings.value("logPath", "Mercury.log").toString();
    settings.endGroup();

    settings.beginGroup("Gpio");
    rfidPin0_ = settings.value("rfidPin0", 20).toInt();
    rfidPin1_ = settings.value("rfidPin1", 21).toInt();
    settings.endGroup();

    settings.beginGroup("ColorMode");
    darkMode_ = settings.value("darkMode", true).toBool();
    settings.endGroup();

    settings.beginGroup("Units");
    metric_ = settings.value("metric", true).toBool();
    settings.endGroup();
}

//Getters
int ConfigManager::getForwardPeriod() const { return forwardPeriod_; }

int ConfigManager::getNumberOfMotors() const { return numberOfMotors_; }

int ConfigManager::getNumberOfMppts() const { return numberOfMppts_; }

QString ConfigManager::getPacketTitle() const { return packetTitle_; }

QString ConfigManager::getPortName() const { return portName_; }

int ConfigManager::getBaudrate() const { return baudrate_; }

QString ConfigManager::getCanInterface() const { return canInterface_; }

QString ConfigManager::getTelemetryTopic() const { return telemetryTopic_; }

QString ConfigManager::getPingTopic() const { return pingTopic_; }

QString ConfigManager::getPongTopic() const { return pongTopic_; }

QString ConfigManager::getReceiverTopic() const { return receiverTopic_; }

QString ConfigManager::getTelemetryHostname() const { return telemetryHostname_; }

int ConfigManager::getTelemetryPort() const { return telemetryPort_; }

QString ConfigManager::getTelemetryUsername() const { return telemetryUsername_; }

QString ConfigManager::getTelemetryPassword() const { return telemetryPassword_; }

bool ConfigManager::getLoggingEnabled() const { return loggingEnabled_; }

QString ConfigManager::getLogPath() const { return logPath_; }

int ConfigManager::getRfidPin0() const { return rfidPin0_; }

int ConfigManager::getRfidPin1() const { return rfidPin1_; }

bool ConfigManager::getDarkMode() const { return darkMode_; }

bool ConfigManager::getMetric() const { return metric_; }
