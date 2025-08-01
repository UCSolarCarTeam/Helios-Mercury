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

    QString getCanInterface() const;

    QString getTelemetryTopic() const;
    QString getPingTopic() const;
    QString getPongTopic() const;
    QString getReceiverTopic() const;
    QString getTelemetryHostname() const;
    int getTelemetryPort() const;
    QString getTelemetryUsername() const;
    QString getTelemetryPassword() const;

    bool getLoggingEnabled() const;
    QString getLogPath() const;

    bool getDarkMode() const;

    bool getMetric() const;

private:
    ConfigManager(const QString& path);

    int forwardPeriod_;
    int numberOfMotors_;
    int numberOfMppts_;
    QString packetTitle_;

    QString canInterface_;

    QString telemetryTopic_;
    QString pingTopic_;
    QString pongTopic_;
    QString receiverTopic_;
    QString telemetryHostname_;
    int telemetryPort_;
    QString telemetryUsername_;
    QString telemetryPassword_;

    bool loggingEnabled_;
    QString logPath_;

    bool darkMode_;

    bool metric_;
};

#endif // CONFIGMANAGER_H
