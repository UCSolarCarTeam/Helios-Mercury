#include "SerialReceiver.h"
#include "../Config/ConfigManager.h"
#include <QDebug>
#include <QFile>
#include <filesystem>
#include <chrono>
#include <thread>

namespace fs = std::filesystem;

/** Constructor */
SerialReceiver::SerialReceiver(PacketFactory* packetFactory)
    : packetFactory_(packetFactory), serialPort_(new QSerialPort(this)), connected_(false), monitoring_(true)
{
    connect(serialPort_, &QSerialPort::readyRead, this, &SerialReceiver::handleReadyRead);

    ConfigManager& config = ConfigManager::instance();
    portName_ = config.getPortName();

    tryConnect();

    // Start monitoring thread
    monitorThread_ = std::thread(&SerialReceiver::monitorPortAvailability, this);
}

/** Destructor */
SerialReceiver::~SerialReceiver() {
    monitoring_ = false;

    if (monitorThread_.joinable())
        monitorThread_.join();

    if (serialPort_->isOpen()) {
        serialPort_->close();
    }
}

/** Handle incoming serial data */
void SerialReceiver::handleReadyRead() {
    QByteArray data = serialPort_->readAll();
    qDebug() << "Data Received: " << data;

    if (data.isEmpty()) {
        qDebug() << "Incoming data is empty";
        return;
    }

    emit dataReceived(data);
}

/** Monitor port presence using filesystem polling */
void SerialReceiver::monitorPortAvailability() {
    bool previouslyExists = QFile::exists(portName_);

    while (monitoring_) {
        bool currentlyExists = QFile::exists(portName_);

        if (currentlyExists && !previouslyExists) {
            qDebug() << "[CONNECTED] Port appeared";
            QMetaObject::invokeMethod(this, "tryConnect", Qt::QueuedConnection);
        } else if (!currentlyExists && previouslyExists) {
            qDebug() << "[DISCONNECTED] Port disappeared";
            QMetaObject::invokeMethod(this, "disconnectPort", Qt::QueuedConnection);
        }

        previouslyExists = currentlyExists;
        std::this_thread::sleep_for(std::chrono::milliseconds(500));
    }
}


/** Attempt to connect */
void SerialReceiver::tryConnect() {
    if (serialPort_->isOpen()) {
        serialPort_->close();
    }

    ConfigManager& config = ConfigManager::instance();

    serialPort_->setPortName(config.getPortName());
    serialPort_->setBaudRate(config.getBaudrate());
    serialPort_->setDataBits(QSerialPort::Data8);
    serialPort_->setParity(QSerialPort::NoParity);
    serialPort_->setStopBits(QSerialPort::OneStop);

    if (serialPort_->open(QIODevice::ReadOnly)) {
        qDebug() << "Serial Port Opened: " << config.getPortName();
        connected_ = true;
        packetFactory_->getPiPacket().setEmbeddedState(true);
    } else {
        qDebug() << "Failed to open serial port";
        connected_ = false;
        packetFactory_->getPiPacket().setEmbeddedState(false);
    }
}

void SerialReceiver::disconnectPort() {
    if (connected_) {
        qDebug() << "[DISCONNECTED] Port disappeared";
        connected_ = false;
        serialPort_->close();
        packetFactory_->getPiPacket().setEmbeddedState(false);
    }
}

