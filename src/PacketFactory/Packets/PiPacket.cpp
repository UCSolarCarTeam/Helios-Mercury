#include "PiPacket.h"
#include "../../Config/JsonDefinitions.h"
#include <QNetworkInterface>

PiPacket::PiPacket() {
    setRfid(NULL);
    setDriverName("Unknown");
    setLatency(-69);
    setIsTelemetryConnected(false);
    setIp(findIp());
}

/**
    Finds the ip used by the pi to ease connections when debugging

    Looks for the interface that uses Ethernet and is ipv4 protocol and returns the first match
*/
QString PiPacket::findIp() const {
    foreach(const QNetworkInterface &interface, QNetworkInterface::allInterfaces()){
        if(interface.type() == QNetworkInterface::Ethernet){
            foreach (const QNetworkAddressEntry &entry, interface.addressEntries()) {
                QHostAddress address = entry.ip();
                if (address.protocol() == QAbstractSocket::IPv4Protocol) {
                    return address.toString();
                }
            }
        }
    }
    return "NO ETH INTERFACE";
}

QJsonObject PiPacket::toJson() {
    QJsonObject json;

    json[JsonDefinitions::RFID] = Rfid_;

    return json;
}
