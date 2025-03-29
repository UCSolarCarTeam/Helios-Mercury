#include "SerialReceiver.h"
#include "../Config/ConfigManager.h"
#include <QDebug>
#include <QDir>
#include <QFile>

namespace {
    const QString DEV_PATH = "/dev/";
    const QString DEV_PTS_PATH = "/dev/pts/";
}

/** Constructor */
SerialReceiver::SerialReceiver(PacketFactory* packetFactory)
    : packetFactory_(packetFactory), serialPort_(new QSerialPort(this)), connected_(false) {

    connect(serialPort_, &QSerialPort::readyRead, this, &SerialReceiver::handleReadyRead);

    ConfigManager& config = ConfigManager::instance();
    portName_ = config.getPortName();

    devWatcher_ = new QFileSystemWatcher(this);
    connect(devWatcher_, &QFileSystemWatcher::directoryChanged, this, &SerialReceiver::onDevDirectoryChanged);

    devWatcher_->addPath(DEV_PATH);
    devWatcher_->addPath(DEV_PTS_PATH);

    checkPortAvailability();
}

/** Destructor */
SerialReceiver::~SerialReceiver() {
    if(serialPort_->isOpen()) {
        serialPort_->close();
    }
}

/** Called when /dev/ directory changes */
void SerialReceiver::onDevDirectoryChanged() {
    // qDebug() << "SIGNAL RECIEVED, ENTERED DIRECTORY CHANGED";
    checkPortAvailability();
}

/** Check if the port is available in /dev/ */
void SerialReceiver::checkPortAvailability() {
    ConfigManager& config = ConfigManager::instance();
    portName_ = config.getPortName();

    QFile portFile(portName_);

    if (portFile.exists()) {
        if (!connected_) {
            qDebug() << "Detected port available:" << portName_;
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
