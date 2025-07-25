#include "Mercury.h"
#include "Config/ConfigManager.h"
#include "PacketFactory/PacketFactory.h"
#include "Receivers/SerialReceiver.h"
#include "Receivers/CanReceiver.h"
#include "Receivers/TelemetryReceiver.h"
#include "StreamProcessor/StreamProcessor.h"
#include "MessageTransmitter/MessageTransmitter.h"
#include "MessageAggregator/MessageAggregator.h"

#include <QQmlContext>

// Include the GpioReceiver header file only if the program is running on a Pi
#ifdef RUNNING_ON_PI
#include "Receivers/GpioReceiver.h"
#endif


Mercury::Mercury(int &argc, char **argv) : QGuiApplication(argc, argv) {

     qDebug() << "Firing 'er up";

    //load in settings and initialize Packet factory
    ConfigManager& config = ConfigManager::instance();
    PacketFactory* packetFactory = new PacketFactory();

    //Initialize GPIO Receiver if on Pi
    #ifdef RUNNING_ON_PI
        GpioReceiver* gpioReceiver = new GpioReceiver(packetFactory);
    #endif

    //initialize TelemetryReceiver which will listen to telemetry MQTT service for incoming data
    TelemetryReceiver* telemetryReceiver = new TelemetryReceiver(&packetFactory->getPiPacket());

    //Initialize either the can or serial receiver depending on mode of input
    if(config.getCanEnabled()){
        //initialize CanReceiver which will begin to listen to CAN interface for incoming data
        CanReceiver* canReceiver = new CanReceiver(packetFactory);
        //TODO: link packets to CanReceiver so they can be populated
    }else{
        //initialize SerialReceiver which will begin to listen to serial port for incoming data
        SerialReceiver* serialReceiver = new SerialReceiver();

        //initialize StreamProcessor which will process incoming data via signal/slot connected to serialReceiver
        StreamProcessor* streamProcessor = new StreamProcessor(serialReceiver, packetFactory);
    }

    // makes boolean variable named darkModeEnabled available
    engine_.rootContext()->setContextProperty("darkModeEnabled", config.getDarkMode());

    // makes boolean variable named isMetric available
    engine_.rootContext()->setContextProperty("isMetric", config.getMetric());

    //initialize MessageTransmitter which will transmit data every period of time deinifed in config.ini
    MessageTransmitter* messageTransmitter = new MessageTransmitter(&packetFactory->getPiPacket());

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
    MpptPacket &mpptPacket = packetFactory->getMpptPacket();
    MbmsPacket &mbmsPacket = packetFactory->getMbmsPacket();
    ProximitySensorsPacket &proximitySensorsPacket = packetFactory->getProximitySensorsPacket();
    PiPacket &piPacket = packetFactory->getPiPacket();
    ContactorPacket &contactorPacket = packetFactory->getContactorPacket();


    engine_.rootContext()->setContextProperty("keyMotor", &keyMotorPacket);
    engine_.rootContext()->setContextProperty("motorDetails0", &motorDetails0Packet);
    engine_.rootContext()->setContextProperty("motorDetails1", &motorDetails1Packet);
    engine_.rootContext()->setContextProperty("b3", &b3Packet);
    engine_.rootContext()->setContextProperty("telemetry", &telemetryPacket);
    engine_.rootContext()->setContextProperty("batteryFaults", &batteryFaultsPacket);
    engine_.rootContext()->setContextProperty("battery", &batteryPacket);
    engine_.rootContext()->setContextProperty("mppt", &mpptPacket);
    engine_.rootContext()->setContextProperty("mbms", &mbmsPacket);
    engine_.rootContext()->setContextProperty("proximitySensors", &proximitySensorsPacket);
    engine_.rootContext()->setContextProperty("pi", &piPacket);
    engine_.rootContext()->setContextProperty("contactor", &contactorPacket);

    qmlRegisterSingletonType(QUrl("qrc:/qt/qml/content/Config/Config.qml"), "Mercury", 1, 0, "Config");

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
