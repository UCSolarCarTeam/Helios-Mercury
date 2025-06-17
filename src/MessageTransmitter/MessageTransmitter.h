#ifndef MESSAGETRANSMITTER_H
#define MESSAGETRANSMITTER_H

#include <QByteArray>
#include <QMqttClient>
#include <QObject>

class MessageTransmitter : public QObject {
    Q_OBJECT

    Q_PROPERTY(bool telemetryConnected READ isTelemetryConnected NOTIFY telemetryConnectedChanged)    
public:
    MessageTransmitter();

    void setupTelemetryClient();
    bool isTelemetryConnected() const;    

public slots:
    void transmitMessage(const QByteArray& message);

signals:
    void telemetryConnectedChanged();

private slots:
    void onTelemetryStateChanged(QMqttClient::ClientState state);    

private:
    QMqttClient* telemetryClient_;
    QString telemetryTopic_;
    bool telemetryConnected_ = false;    
};

#endif // MESSAGETRANSMITTER_H