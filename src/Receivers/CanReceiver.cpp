#include "CanReceiver.h"
#include <QCanBus>
#include <QCanBusDevice>
#include <QDebug>

#include "../Config/ConfigManager.h"
#include "../Config/PacketDefinitions.h"

CanReceiver::CanReceiver() {
    ConfigManager& config = ConfigManager::instance();

    QString errorString;
    canDevice_ = QCanBus::instance()->createDevice("socketcan", config.getCanInterface(), &errorString);
    if(!canDevice_) {
        qWarning() << "Failed to Create CAN Device:" << errorString;
        return; //TODO: enter retry loop
    }

    if(!canDevice_->connectDevice()){
        qWarning() << "Failed to Connect to CAN Device";
        delete canDevice_;
        canDevice_ = nullptr;
        return; //TODO: enter retry loop
    }

    qDebug() << "Connected to CAN Interface";

    connect(canDevice_, &QCanBusDevice::framesReceived, this, &CanReceiver::handleReadyRead);
}

CanReceiver::~CanReceiver() {
    if(canDevice_) {
        canDevice_->disconnectDevice();
        delete canDevice_;
    }
}


/** Start Receiving Can frames and populating packet fields once connected to can interface */
void CanReceiver::handleReadyRead() {
    while (canDevice_->framesAvailable()){
        QCanBusFrame frame = canDevice_->readFrame();
        qDebug() << "Received CAN frame: " << frame.frameType();

        if(frame.frameType() != QCanBusFrame::DataFrame) {
            qWarning() << "(" << frame.frameType() << ") Invalid frame received with ID:" << frame.frameId() << "and payload:" << frame.payload();
            continue;
        }

        const int id = frame.frameId();
        const QByteArray payload = frame.payload();

        //TODO: Add Remaining Packets
        if(id >= PacketDefinitions::B3_ID_MIN && id <= PacketDefinitions::B3_ID_MAX){
            qDebug() << "TODO: populate B3 Packet";
        } else if(id >= PacketDefinitions::TELEMETRY_ID_MIN && id <= PacketDefinitions::TELEMETRY_ID_MAX){
            qDebug() << "TODO: populate Telemetry Packet";
        } else {
            qWarning() << "UNKNOWN ID:" << frame.frameId() << "With payload:" << frame.payload();
        }
    }
}
