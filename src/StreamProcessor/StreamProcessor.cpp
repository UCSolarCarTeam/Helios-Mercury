#include "StreamProcessor.h"
#include "../Config/PacketDefinitions.h"

#include <QDebug>

/** 
 * Takes in serialReceiver to connect signal and slot for data recieved 
 * and packetFactory to store all packet data in a single instance 
 */
StreamProcessor::StreamProcessor(SerialReceiver* SerialReceiver, PacketFactory* packetFactory) : packetFactory_(packetFactory) {
    buffer_.resize(1);
    buffer_.fill(PacketDefinitions::FRAMING_BYTE);
    QObject::connect(SerialReceiver, &SerialReceiver::dataReceived, this, &StreamProcessor::processData);
}

/** 
 * Processes data recieved from serial port
 * Fired every time data is recieved from serial port
 * 
 * Data is processed in the following steps:
 * 1. Append data to buffer
 * 2. Extract all packets from buffer
 * 3. For each packet:
 *     a. Decode packet
 *     b. Check checksum
 *     c. Identify and verify size then send to packet factory
 */
void StreamProcessor::processData(const QByteArray& data) {
    qDebug() << "Starting data processing";

    //append to data string
    buffer_.append(data);

    //disect all packets from buffer at occurances of 0x00
    QList<QByteArray> bytePackets = extractPackets();

    if(bytePackets.isEmpty()) {
        qDebug() << "Failed to Extract Packets from buffer: " << buffer_;
        return;
    };

    //process each packet
    for(const QByteArray& bytePacket : bytePackets) {
        qDebug() << "Byte Packet: " << bytePacket;
        //decode packet
        QByteArray decodedPacket = decodePacket(bytePacket);

        if(decodedPacket.isNull()) {
            qDebug() << "Packet is too small - figure it out: " << bytePacket;
            continue;
        };

        //checksum
        if(!isValidChecksum(decodedPacket)) continue;

        //identify and verify size then send to packet factory
        validateAndForwardPacket(decodedPacket);
    }
}

/** Extract bytes between FRAMING_BYTES (this is a packet) */
QList<QByteArray> StreamProcessor::extractPackets() {
    QList<QByteArray> packets;
    while (true) {
        //Find start of packet at the framing byte
        int startOfPacketIndex = buffer_.indexOf(PacketDefinitions::FRAMING_BYTE);

        if(startOfPacketIndex == -1) break;

        buffer_ = buffer_.mid(startOfPacketIndex);

        //Find end of packet (next occurance of framing byte)
        int endOfPacketIndex = buffer_.indexOf(PacketDefinitions::FRAMING_BYTE, 1);

        if(endOfPacketIndex == -1) break;

        //extract packet and remove from buffer
        QByteArray packet = buffer_.mid(1, endOfPacketIndex - 1);
        buffer_.remove(0, endOfPacketIndex);

        packets.append(packet);
    }

    return packets;
}

/** 
 * Decodes the byte packet to insert 0x00s into there proper position 
 * 
 * Packets recieved have been encoded using bytestuffing. This function unstuffs
 * the packet.
 * 
 * First byte of packet points to the index of where the next 0x00 should be.
 * Then that byte points to the next encoded zero and so on until the 
 * end of packet is reached.
 * */
QByteArray StreamProcessor::decodePacket(QByteArray packet) {

    QByteArray decodedPacket;
    const int length = packet.size();
    int indexOfZero = 0;

    if(length < PacketDefinitions::MIN_PACKET_LENGTH) return NULL;

    while(indexOfZero < length) {
        const int indexOfNextZero = static_cast<unsigned char>(packet.at(indexOfZero)) + indexOfZero;

        // appends between current zero and next zero
        for (int i = indexOfZero + 1; i < indexOfNextZero && i < length; ++i) {
            decodedPacket.append(packet.at(i));
        }

        // replaces encoded value with 0x00
        if(indexOfNextZero < 0xFF && indexOfNextZero < length){
            decodedPacket.append(char(0x00));
        }

        indexOfZero = indexOfNextZero;
    }

    return decodedPacket;
}

/** Checks if Checksum (last 2 bytes at this stage) is valid and drops those bytes from the packet */
bool StreamProcessor::isValidChecksum(QByteArray& decodedPacket){
    const int endOfPacketIndex = decodedPacket.size() - 1;

    //extract last 2 bytes in checksum and flip
    const quint16 checksum = (static_cast<quint16>(decodedPacket.at(endOfPacketIndex - 1)) & 0xFF) |
                        (static_cast<quint16>(decodedPacket.at(endOfPacketIndex)) << 8);

    //remove checksum bytes from packet
    decodedPacket.chop(sizeof(checksum));

    const quint16 calculatedChecksum = qChecksum(QByteArrayView(decodedPacket));

    if(calculatedChecksum == checksum){
        qDebug() << "Checksum Passed";
        return true;
    }

    qDebug() << "Calculated =" << QByteArray::number(calculatedChecksum, 16) 
             << "retrieved =" << QByteArray::number(checksum, 16);
    qDebug() << "Error decoding data, checksum doesn't match. Data is: " << decodedPacket;

    return false;
}

/** 
 * Checks if PacketBody has valid ID and size. If so, it sends that data
 * to the packet factory for the respective packet to be populated
 * */
void StreamProcessor::validateAndForwardPacket(QByteArray& packetBody) {
    const int id = packetBody.at(PacketDefinitions::ID_INDEX);

    if(PacketDefinitions::packetLength[id] != packetBody.size()) {
        qDebug() << "Packet length is incorrect for ID: " << id;
        qDebug() << "Got: " << packetBody.size() << " Expected: " << PacketDefinitions::packetLength[id];
        return;
    }

    switch(id){
        case PacketDefinitions::KEY_MOTOR_ID:
            qDebug() << "Key Motor Packet";
            packetFactory_->getKeyMotorPacket().populatePacket(packetBody);
            return;
        case PacketDefinitions::MOTOR_DETAILS_0_ID:
            qDebug() << "Motor Details 0 Packet";
            packetFactory_->getMotorDetailsPacket(0).populatePacket(packetBody);
            return;
        case PacketDefinitions::MOTOR_DETAILS_1_ID:
            qDebug() << "Motor Details 1 Packet";
            packetFactory_->getMotorDetailsPacket(1).populatePacket(packetBody);
            return;
        case PacketDefinitions::B3_ID:
            qDebug() << "B3 Packet";
            packetFactory_->getB3Packet().populatePacket(packetBody);
            return;
        case PacketDefinitions::TELEMETRY_ID:
            qDebug() << "Telemetry Packet";
            packetFactory_->getTelemetryPacket().populatePacket(packetBody);
            return;
        case PacketDefinitions::BATTERY_FAULTS_ID:
            qDebug() << "Battery Faults Packet";
            packetFactory_->getBatteryFaultsPacket().populatePacket(packetBody);
            return;
        case PacketDefinitions::BATTERY_ID:
            qDebug() << "Battery Packet";
            packetFactory_->getBatteryPacket().populatePacket(packetBody);
            return;
        case PacketDefinitions::MPPT_ID: {
            //TODO: This step is currently done twice, once here and once in the populatePacket function - fix this
            const unsigned char mpptNum = static_cast<unsigned char>(packetBody.at(1)) & 0x03;
            qDebug() << "MPPT Packet: " << mpptNum;
            packetFactory_->getMpptPacket(mpptNum).populatePacket(packetBody);
            return;
        }
        case PacketDefinitions::MBMS_ID:
            qDebug() << "MBMS Packet";
            packetFactory_->getMbmsPacket().populatePacket(packetBody);
            return;
        case PacketDefinitions::PROXIMITY_SENSORS_ID:
            qDebug() << "Proximity Sensors Packet";
            packetFactory_->getProximitySensorsPacket().populatePacket(packetBody);
            return;
        default:
            qWarning() << "Unknown Packet ID: " << id;
            return;
    }
}
