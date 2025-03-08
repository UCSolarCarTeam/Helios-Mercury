#ifndef CONFIGMANAGER_H
#define CONFIGMANAGER_H

#include <QString>

class ConfigManager {

public:
    static ConfigManager& instance();

    ConfigManager(const ConfigManager&) = delete;
    ConfigManager& operator=(const ConfigManager&) = delete;

    int getForwardPeriod() const;

    int getNumberOfMotors() const;
    int getNumberOfMppts() const;

    QString getPacketTitle() const;

    QString getPortName() const;
    int getBaudrate() const;

    QString getTelemetryTopic() const;
    QString getPingTopic() const;
    QString getPongTopic() const;
    QString getTelemetryHostname() const;
    int getTelemetryPort() const;
    QString getTelemetryUsername() const;
    QString getTelemetryPassword() const;

    bool getLoggingEnabled() const;
    QString getLogPath() const;

    int getPin0() const;
    int getPin1() const;

private:
    ConfigManager(const QString& path);

    int forwardPeriod_;
    int numberOfMotors_;
    int numberOfMppts_;
    QString packetTitle_;
    QString portName_;
    int baudrate_;
    QString telemetryTopic_;
    QString pingTopic_;
    QString pongTopic_;
    QString telemetryHostname_;
    int telemetryPort_;
    QString telemetryUsername_;
    QString telemetryPassword_;
    bool loggingEnabled_;
    int pin0_;
    int pin1_;
    QString logPath_;
};

#endif // CONFIGMANAGER_H
