#include "SerialReceiver.h"
#include "../Config/ConfigManager.h"
#include <QDebug>

namespace {
const int RETRY_PERIOD = 5000; // Reconnect attempt interval (ms)
}

/** Constructor */
SerialReceiver::SerialReceiver(PacketFactory* packetFactory, QObject* parent)
    : QObject(parent), packetFactory_(packetFactory), serialPort_(new QSerialPort(this)), connected_(false) {

    ConfigManager& config = ConfigManager::instance();
    portName_ = config.getPortName();

    connect(serialPort_, &QSerialPort::readyRead, this, &SerialReceiver::handleReadyRead);
    connect(serialPort_, &QSerialPort::errorOccurred, this, &SerialReceiver::handleError);

    monitorTimer_ = new QTimer(this);
    connect(monitorTimer_, &QTimer::timeout, this, &SerialReceiver::checkConnection);
    monitorTimer_->start(RETRY_PERIOD); // Check connection every 1s

    tryConnect(); // Attempt initial connection
}

/** Destructor */
SerialReceiver::~SerialReceiver() {
    if(serialPort_->isOpen()) {
        serialPort_->close();
    }
}

/** Attempt to connect */
void SerialReceiver::tryConnect() {
    if (serialPort_->isOpen()) {
        serialPort_->close();
    }

    serialPort_->setPortName(portName_);
    serialPort_->setBaudRate(ConfigManager::instance().getBaudrate());
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
        QTimer::singleShot(RETRY_PERIOD, this, &SerialReceiver::tryConnect);
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

/** Handle serial port errors */
void SerialReceiver::handleError(QSerialPort::SerialPortError error) {
    if (error == QSerialPort::ResourceError || error == QSerialPort::DeviceNotFoundError) {
        // qWarning() << "Serial port error: " << serialPort_->errorString();
        connected_ = false;
        serialPort_->close();
        QTimer::singleShot(RETRY_PERIOD, this, &SerialReceiver::tryConnect);
    }
}

/** Monitor connection status and detect disconnects */
void SerialReceiver::checkConnection() {
    if (serialPort_->isOpen() && connected_) {
        auto pinSignals = serialPort_->pinoutSignals();

        if (!(pinSignals & QSerialPort::DataCarrierDetectSignal) &&
            !(pinSignals & QSerialPort::DataSetReadySignal)) {
            // qWarning() << "Serial port lost signal (DCD/DSR down). Disconnect detected!";
            connected_ = false;
            serialPort_->close();
            QTimer::singleShot(RETRY_PERIOD, this, &SerialReceiver::tryConnect);
        }
        return;
    }

    if (!serialPort_->isOpen()) {
        // qWarning() << "Serial port disconnected. Reconnecting...";
        QTimer::singleShot(RETRY_PERIOD, this, &SerialReceiver::tryConnect);
    }
}
