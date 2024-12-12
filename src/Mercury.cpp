#include "Mercury.h"
#include "Config/ConfigManager.h"
#include "PacketFactory/PacketFactory.h"
#include "Receivers/SerialReceiver.h"
#include "Receivers/TelemetryReceiver.h"
#include "Receivers/GPIOReader.h"
#include "StreamProcessor/StreamProcessor.h"
#include "MessageTransmitter/MessageTransmitter.h"
#include "MessageAggregator/MessageAggregator.h"

#include <QQmlContext>


Mercury::Mercury(int &argc, char **argv) : QGuiApplication(argc, argv) {

     qDebug() << "Firing 'er up";

    //load in settings and initialize Packet factory
    ConfigManager& config = ConfigManager::instance();
    PacketFactory* packetFactory = new PacketFactory();

    //initialize SerialReceiver which will begin to listen to serial port for incoming data
    SerialReceiver* serialReceiver = new SerialReceiver();

    //initialize TelemetryReceiver which will listen to telemetry MQTT service for incoming data
    TelemetryReceiver* telemetryReceiver = new TelemetryReceiver();
    //initialize GPIOReader which will read GPIO data and forward directly to the PiPacket
    GPIOReader* gpioReader = new GPIOReader(nullptr, packetFactory);

    //initialize StreamProcessor which will process incoming data via signal/slot connected to serialReceiver
    StreamProcessor* streamProcessor = new StreamProcessor(serialReceiver, packetFactory);

    //initialize MessageTransmitter which will transmit data every period of time deinifed in config.ini
    MessageTransmitter* messageTransmitter = new MessageTransmitter();

    //initialize MessageAggregator which will aggregate all packets into one json message and transmit
    MessageAggregator* messageAggregator = new MessageAggregator(messageTransmitter, packetFactory);
    messageAggregator->startTransmission();

    //initialize QML engine and set context properties
    KeyMotorPacket &keyMotorPacket = packetFactory->getKeyMotorPacket();
    MotorDetailsPacket &motorDetails0Packet = packetFactory->getMotorDetailsPacket(0);
    MotorDetailsPacket &motorDetails1Packet = packetFactory->getMotorDetailsPacket(1);
    B3Packet &b3Packet = packetFactory->getB3Packet();
    TelemetryPacket &telemetryPacket = packetFactory->getTelemetryPacket();
    BatteryFaultsPacket &batteryFaultsPacket = packetFactory->getBatteryFaultsPacket();
    BatteryPacket &batteryPacket = packetFactory->getBatteryPacket();
    MpptPacket &mppt0Packet = packetFactory->getMpptPacket(0);
    MpptPacket &mppt1Packet = packetFactory->getMpptPacket(1);
    MpptPacket &mppt2Packet = packetFactory->getMpptPacket(2);
    MpptPacket &mppt3Packet = packetFactory->getMpptPacket(3);
    MbmsPacket &mbmsPacket = packetFactory->getMbmsPacket();
    ProximitySensorsPacket &proximitySensorsPacket = packetFactory->getProximitySensorsPacket();


    engine_.rootContext()->setContextProperty("keyMotor", &keyMotorPacket);
    engine_.rootContext()->setContextProperty("motorDetails0", &motorDetails0Packet);
    engine_.rootContext()->setContextProperty("motorDetails1", &motorDetails1Packet);
    engine_.rootContext()->setContextProperty("b3", &b3Packet);
    engine_.rootContext()->setContextProperty("telemetry", &telemetryPacket);
    engine_.rootContext()->setContextProperty("batteryFaults", &batteryFaultsPacket);
    engine_.rootContext()->setContextProperty("battery", &batteryPacket);
    engine_.rootContext()->setContextProperty("mppt0", &mppt0Packet);
    engine_.rootContext()->setContextProperty("mppt1", &mppt1Packet);
    engine_.rootContext()->setContextProperty("mppt2", &mppt2Packet);
    engine_.rootContext()->setContextProperty("mppt3", &mppt3Packet);
    engine_.rootContext()->setContextProperty("mbms", &mbmsPacket);
    engine_.rootContext()->setContextProperty("proximitySensors", &proximitySensorsPacket);

    const QUrl url(u"qrc:/qt/qml/Main/main.qml"_qs);
    QObject::connect(
        &engine_,
        &QQmlApplicationEngine::objectCreated,
        this,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    engine_.addImportPath(QCoreApplication::applicationDirPath() + "/qml");
    engine_.addImportPath(":/");

    engine_.load(url);

    if (engine_.rootObjects().isEmpty()) {
        QCoreApplication::exit(-1);
    }
}
