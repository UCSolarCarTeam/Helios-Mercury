#include "SerialReceiver.h"
#include "../Config/ConfigManager.h"
#include <QDebug>
#include <QDir>
#include <QFile>

/** Constructor */
SerialReceiver::SerialReceiver(PacketFactory* packetFactory)
    : packetFactory_(packetFactory), serialPort_(new QSerialPort(this)),
    devWatcher_(new QFileSystemWatcher(this)), retryTimer_(new QTimer(this)), connected_(false) {

    ConfigManager& config = ConfigManager::instance();
    portName_ = config.getPortName();

    retryTimer_->setInterval(5000);
    retryTimer_->start();

    connect(retryTimer_, &QTimer::timeout, this, [=]() {
        ConfigManager& config = ConfigManager::instance();
        qDebug() << "[TIMER] Trying connection to" << portName_;

        // packetFactory_->getPiPacket().setEmbeddedState(false);

        QFile portFile(portName_);
        if (portFile.exists()) {
            qDebug() << "[TIMER] FILE EXISTS";
        } else { qDebug() << "[TIMER] FILE DOES NOT EXIST"; }

        if(!serialPort_->isOpen()){
            serialPort_->setPortName(config.getPortName());
            serialPort_->setBaudRate(config.getBaudrate());
            serialPort_->setDataBits(QSerialPort::Data8);
            serialPort_->setParity(QSerialPort::NoParity);
            serialPort_->setStopBits(QSerialPort::OneStop);
        }

        if (serialPort_->open(QIODevice::ReadOnly)) {
            qDebug() << "Serial Port Opened: " << config.getPortName();
            connect(serialPort_, &QSerialPort::readyRead, this, &SerialReceiver::handleReadyRead);
            if(devWatcher_->addPath(portName_)) {
                qDebug() << "[SETPATH] SUCCESSFULLY ADDED PATH";
                qDebug() << "[SETPATH] FILES: " << devWatcher_->files();
                qDebug() << "CONTAINS PATH" << devWatcher_->files().contains(portName_);
            }
            // connected_ = true;
            packetFactory_->getPiPacket().setEmbeddedState(true);
            retryTimer_->stop();
        }
        qDebug() << "[SECONDCHECK] FILES: " << devWatcher_->files();
    });

    connect(devWatcher_, &QFileSystemWatcher::fileChanged, this, [=](const QString &path) {
        qDebug() << "[Watcher] File changed:" << path;

        if (!devWatcher_->files().contains(path)) {
            qDebug() << "[Watcher] File removed. Starting retry.";
            if (!retryTimer_->isActive()) retryTimer_->start();
            serialPort_->close();
        }
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
