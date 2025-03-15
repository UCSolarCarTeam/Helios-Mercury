#include "SerialReceiver.h"
#include "../Config/ConfigManager.h"

#include <QDebug>
#include <QTimer>

namespace {
const int RETRY_PERIOD = 5000; // milliseconds
}

SerialReceiver::SerialReceiver(PacketFactory* packetFactory) : packetFactory_(packetFactory ){
    serialPort_ = new QSerialPort(this);

    ConfigManager& config = ConfigManager::instance();

    serialPort_->setPortName(config.getPortName());
    serialPort_->setBaudRate(config.getBaudrate());
    serialPort_->setDataBits(QSerialPort::Data8);
    serialPort_->setParity(QSerialPort::NoParity);
    serialPort_->setStopBits(QSerialPort::OneStop);

    //TODO: add retry period/detection mechinism for serial device
    // if (serialPort_->open(QIODevice::ReadOnly)) {
    //     qDebug() << "Serial Port Opened: " << config.getPortName();
    //     connect(serialPort_, &QSerialPort::readyRead, this, &SerialReceiver::handleReadyRead);
    // } else {
    //     qWarning() << "EXITING - Failed to open serial port (" << config.getPortName() << "): " << serialPort_->errorString();
    //     exit(1);
    // }

    if (serialPort_->open(QIODevice::ReadOnly)) {
        qDebug() << "Serial Port Opened: " << config.getPortName();
        connect(serialPort_, &QSerialPort::readyRead, this, &SerialReceiver::handleReadyRead);
        packetFactory_->getPiPacket().setEmbeddedState(true);
    } else {
        qWarning() << "EXITING - Failed to open serial port (" << config.getPortName() << "): " << serialPort_->errorString();
        packetFactory_->getPiPacket().setEmbeddedState(false);
        retryConnection();
    }
}

SerialReceiver::~SerialReceiver() {
    if(serialPort_->isOpen()) {
        serialPort_->close();
    }
}

/** Retry the serial port connection after a delay */
void SerialReceiver::retryConnection() {
    qWarning() << "Retrying to open serial port in " << RETRY_PERIOD / 1000 << " seconds...";
    QTimer::singleShot(RETRY_PERIOD, this, &SerialReceiver::attemptReconnect);
}

/** Attempt to reconnect to the serial port */
void SerialReceiver::attemptReconnect() {
    if (serialPort_->open(QIODevice::ReadOnly)) {
        qWarning() << "Failed to open serial port on retry, trying again in " << RETRY_PERIOD / 1000 << " seconds...";
        retryConnection();
    } else {
        qDebug() << "Successfully opened serial port on retry.";
        connect(serialPort_, &QSerialPort::readyRead, this, &SerialReceiver::handleReadyRead);
    }
}

void SerialReceiver::handleReadyRead() {
    QByteArray data = serialPort_->readAll();

    qDebug() << "Data Received: " << data;

    if (data.isEmpty()) {
        qDebug() << "Incoming data is empty";
    }

    emit dataReceived(data); // Emit signal with the received data

}
