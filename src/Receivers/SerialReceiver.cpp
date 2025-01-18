#include "SerialReceiver.h"
#include "../Config/ConfigManager.h"

#include <QDebug>

namespace {
    const int EMBEDDED_ACTIVITY_TIMEOUT = 3000; // Timeout in milliseconds (3 seconds)
}

SerialReceiver::SerialReceiver() {
    serialPort_ = new QSerialPort(this);

    ConfigManager& config = ConfigManager::instance();

    serialPort_->setPortName(config.getPortName());
    serialPort_->setBaudRate(config.getBaudrate());
    serialPort_->setDataBits(QSerialPort::Data8);
    serialPort_->setParity(QSerialPort::NoParity);
    serialPort_->setStopBits(QSerialPort::OneStop);

    //TODO: add retry period/detection mechinism for serial device
    if (serialPort_->open(QIODevice::ReadOnly)) {
        qDebug() << "Serial Port Opened: " << config.getPortName();
        connect(serialPort_, &QSerialPort::readyRead, this, &SerialReceiver::handleReadyRead);
    } else {
        qWarning() << "EXITING - Failed to open serial port (" << config.getPortName() << "): " << serialPort_->errorString();
        exit(1);
    }

    connect(&embeddedActivityTimer_, &QTimer::timeout, this, &SerialReceiver::resetEmbeddedActive);

}

SerialReceiver::~SerialReceiver() {
    if(serialPort_->isOpen()) {
        serialPort_->close();
    }
}

void SerialReceiver::handleReadyRead() {
    QByteArray data = serialPort_->readAll();

    qDebug() << "Data Received: " << data;

    if (!data.isEmpty()) {
        embeddedActive_ = true; // Mark the embedded system as active
        embeddedActivityTimer_.start(EMBEDDED_ACTIVITY_TIMEOUT); // Reset timer for activity

        emit dataReceived(data); // Emit signal with the received data
    } else {
        qDebug() << "Incoming data is empty";
    }
}

void SerialReceiver::resetEmbeddedActive() {
    embeddedActive_ = false; // Reset the activity flag
    embeddedActivityTimer_.stop(); // Stop the timer
}

bool SerialReceiver::isEmbeddedActive() const {
    return embeddedActive_;
}
