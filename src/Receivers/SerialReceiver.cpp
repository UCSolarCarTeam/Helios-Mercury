#include "SerialReceiver.h"
#include "../Config/ConfigManager.h"

#include <QDebug>
#include <QTimer>

namespace {
const int RETRY_PERIOD = 5000; // milliseconds
}

/** Constructor: Initializes SerialReceiver and sets up the serial port */
SerialReceiver::SerialReceiver(PacketFactory* packetFactory)
    : packetFactory_(packetFactory), serialPort_(new QSerialPort(this)) {

    ConfigManager& config = ConfigManager::instance();
    portName_ = config.getPortName();

    setupSerialPort();
}

/** Destructor: Ensure serial port is closed on cleanup */
SerialReceiver::~SerialReceiver() {
    if (serialPort_->isOpen()) {
        serialPort_->close();
    }
}

/** Configure serial port settings */
void SerialReceiver::setupSerialPort() {
    ConfigManager& config = ConfigManager::instance();

    serialPort_->setPortName(portName_);
    serialPort_->setBaudRate(config.getBaudrate());
    serialPort_->setDataBits(QSerialPort::Data8);
    serialPort_->setParity(QSerialPort::NoParity);
    serialPort_->setStopBits(QSerialPort::OneStop);

    // Connect error handling and data reading slots
    connect(serialPort_, &QSerialPort::readyRead, this, &SerialReceiver::handleReadyRead);
    connect(serialPort_, &QSerialPort::errorOccurred, this, &SerialReceiver::handleError);

    // Start connection attempt
    retryConnection();
}

/** Attempt to open the serial port, retry if it fails */
void SerialReceiver::retryConnection() {
    qDebug() << "Attempting to open serial port:" << portName_;

    if (serialPort_->open(QIODevice::ReadOnly)) {
        qDebug() << "Serial port connected:" << portName_;
        packetFactory_->getPiPacket().setEmbeddedState(true);
    } else {
        qWarning() << "Failed to open serial port (" << portName_ << "). Retrying in " << RETRY_PERIOD / 1000 << " seconds...";
        packetFactory_->getPiPacket().setEmbeddedState(false);

        // Use QTimer to schedule the next reconnection attempt
        QTimer::singleShot(RETRY_PERIOD, this, &SerialReceiver::attemptReconnect);
    }
}

/** Reconnection attempt slot */
void SerialReceiver::attemptReconnect() {
    qDebug() << "Retrying serial port connection...";
    if (!serialPort_->isOpen()) {
        retryConnection(); // Recursively retry until success
    }
}

/** Handle incoming data from the serial port */
void SerialReceiver::handleReadyRead() {
    QByteArray data = serialPort_->readAll();
    qDebug() << "Data received:" << data;

    if (data.isEmpty()) {
        qDebug() << "⚠Incoming data is empty";
        return;
    }

    emit dataReceived(data);
}

/** Handle serial port errors and trigger retry */
void SerialReceiver::handleError(QSerialPort::SerialPortError error) {
    if (error == QSerialPort::ResourceError || error == QSerialPort::DeviceNotFoundError) {
        qWarning() << "Serial port error:" << serialPort_->errorString();
        packetFactory_->getPiPacket().setEmbeddedState(false);

        serialPort_->close();
        QTimer::singleShot(RETRY_PERIOD, this, &SerialReceiver::attemptReconnect);
    }
}
