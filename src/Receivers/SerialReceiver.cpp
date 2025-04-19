#include "SerialReceiver.h"
#include "../Config/ConfigManager.h"
#include <QDebug>
#include <QDir>
#include <QFile>

/** Constructor */
SerialReceiver::SerialReceiver(PacketFactory* packetFactory)
    : packetFactory_(packetFactory), serialPort_(new QSerialPort(this)),
    devWatcher_(new QFileSystemWatcher(this)), retryTimer_(new QTimer(this)), connected_(false) {

    connect(serialPort_, &QSerialPort::readyRead, this, &SerialReceiver::handleReadyRead);

    retryTimer_->setInterval(2000); // Retry every 2 seconds

    connect(retryTimer_, &QTimer::timeout, this, [=]() {
        qDebug() << "[TIMER] Retrying connection to" << portName_;
        checkPortAvailability();

        if (QFile::exists(portName_)) {
            qDebug() << "[TIMER] Port back, Stopping retry timer. Adding path back";
            retryTimer_->stop();
            devWatcher_->addPath(portName_);
        }
    });

    connect(devWatcher_, &QFileSystemWatcher::fileChanged, this, [=](const QString &path) {
        qDebug() << "[Watcher] File changed:" << path;

        if (!devWatcher_->files().contains(path)) {
            qDebug() << "[Watcher] File removed. Starting retry.";
            if (!retryTimer_->isActive()) retryTimer_->start();
        }
        checkPortAvailability();
    });
}

/** Destructor */
SerialReceiver::~SerialReceiver() {
    if(serialPort_->isOpen()) {
        serialPort_->close();
    }
}

/** Handle incoming serial data */
void SerialReceiver::handleReadyRead() {
    QByteArray data = serialPort_->readAll();

    qDebug() << "Data Recieved: " << data;

    if(data.isEmpty()) {
        qDebug() << "Incoming data is empty";
        return;
    }

    emit dataReceived(data);
}

/** Check if the port is available in /dev/ */
void SerialReceiver::checkPortAvailability() {
    ConfigManager& config = ConfigManager::instance();
    portName_ = config.getPortName();

    QFile portFile(portName_);

    if (portFile.exists()) {
        if (!connected_) {
            tryConnect();
        }
    } else {
        if (connected_) {
            qDebug() << "Serial port disconnected: " << portName_;
            connected_ = false;
            serialPort_->close();
            packetFactory_->getPiPacket().setEmbeddedState(false);
        }
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
        connected_ = false;
        packetFactory_->getPiPacket().setEmbeddedState(false);
    }
}

void SerialReceiver::setPortPath(const QString &path) {
    portName_ = path;
    qDebug() << "[SETPATH] ADDING PATH";
    if(devWatcher_->addPath(path)) {
        qDebug() << "[SETPATH] SUCCESSFULLY ADDED PATH";
        qDebug() << "[SETPATH] FILES: " << devWatcher_->files();
        qDebug() << "CONTAINS PATH" << devWatcher_->files().contains(portName_);
    }
    checkPortAvailability();
}
