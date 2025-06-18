#include "CanReceiver.h"
#include <QCanBus>
#include <QCanBusDevice>
#include <QDebug>

#include "../Config/ConfigManager.h"
#include "../Config/PacketDefinitions.h"

CanReceiver::CanReceiver(PacketFactory* packetFactory){
    ConfigManager& config = ConfigManager::instance();

    packetFactory_ = packetFactory;

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
        
        if(frame.frameType() != QCanBusFrame::DataFrame) {
            qWarning() << "(" << frame.frameType() << ") Invalid frame received with ID:" << frame.frameId() << "and payload:" << frame.payload();
            continue;
        }

        const int id = frame.frameId();
        const QByteArray payload = frame.payload();

        // Handle all packet types based on their ID ranges
        if(id >= PacketDefinitions::KEY_MOTOR_ID_MIN && id <= PacketDefinitions::KEY_MOTOR_ID_MAX) {
            // Key Motor Data (0x550-0x555)
            packetFactory_->getKeyMotorPacket().IPacket::populatePacket(id, payload);
        }
        else if(id >= PacketDefinitions::MOTOR_DETAILS_0_ID_MIN && id <= PacketDefinitions::MOTOR_DETAILS_0_ID_MAX) {
            // Left Motor Details (0x400-0x417)
            packetFactory_->getMotorDetailsPacket(0).IPacket::populatePacket(id, payload);  // Added index 0
        }
        else if(id >= PacketDefinitions::MOTOR_DETAILS_1_ID_MIN && id <= PacketDefinitions::MOTOR_DETAILS_1_ID_MAX) {
            // Right Motor Details (0x420-0x437)
            packetFactory_->getMotorDetailsPacket(1).IPacket::populatePacket(id, payload);  // Added index 1
        }
        else if(id >= PacketDefinitions::B3_ID_MIN && id <= PacketDefinitions::B3_ID_MAX) {
            // Driver Controls & Power Board Data (0x610-0x620)
            packetFactory_->getB3Packet().IPacket::populatePacket(id, payload);
        }
        else if(id >= PacketDefinitions::TELEMETRY_ID_MIN && id <= PacketDefinitions::TELEMETRY_ID_MAX) {
            // Telemetry Data (0x630-0x635)
            packetFactory_->getTelemetryPacket().IPacket::populatePacket(id, payload);
        }
        else if(id >= PacketDefinitions::BATTERY_FAULTS_ID_MIN && id <= PacketDefinitions::BATTERY_FAULTS_ID_MAX) {
            // Battery Faults Data (0x303-0x304)
            packetFactory_->getBatteryFaultsPacket().IPacket::populatePacket(id, payload);
        }
        else if((id >= PacketDefinitions::BATTERY_ID_MIN_0 && id <= PacketDefinitions::BATTERY_ID_MAX_0) ||
                (id >= PacketDefinitions::BATTERY_ID_MIN_1 && id <= PacketDefinitions::BATTERY_ID_MAX_1)) {
            // Battery Data (0x300-0x302 and 0x304-0x30A)
            packetFactory_->getBatteryPacket().IPacket::populatePacket(id, payload);
        }
        else if(id >= PacketDefinitions::MPPT_ID_MIN && id <= PacketDefinitions::MPPT_ID_MAX) {
            // MPPT Data (0x600-0x607)
            packetFactory_->getMpptPacket(0).IPacket::populatePacket(id, payload);  // Added index 0
        }
        else if(id >= PacketDefinitions::MBMS_ID_MIN && id <= PacketDefinitions::MBMS_ID_MAX) {
            // MBMS Data (0x100-0x105)
            packetFactory_->getMbmsPacket().IPacket::populatePacket(id, payload);
        }
        else if(id >= PacketDefinitions::PROXIMITY_SENSORS_ID_MIN && id <= PacketDefinitions::PROXIMITY_SENSORS_ID_MAX) {
            // Proximity Sensors Data (0x700-0x703)
            packetFactory_->getProximitySensorsPacket().IPacket::populatePacket(id, payload);
        }
        else {
            qWarning() << "UNKNOWN ID: 0x" << QString::number(id, 16).toUpper() 
                       << "With payload:" << payload.toHex();
        }
    }
}
