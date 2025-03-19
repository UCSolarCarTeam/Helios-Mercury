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
    QString getReceiverTopic() const;
    QString getTelemetryHostname() const;
    int getTelemetryPort() const;
    QString getTelemetryUsername() const;
    QString getTelemetryPassword() const;

    bool getLoggingEnabled() const;
    QString getLogPath() const;

    int getRfidPin0() const;
    int getRfidPin1() const;

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
    QString receiverTopic_;
    QString telemetryHostname_;
    int telemetryPort_;
    QString telemetryUsername_;
    QString telemetryPassword_;

    bool loggingEnabled_;
    QString logPath_;

    int rfidPin0_;
    int rfidPin1_;
};

#endif // CONFIGMANAGER_H
