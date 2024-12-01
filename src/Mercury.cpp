#include "Mercury.h"
#include "Config/ConfigManager.h"
#include "PacketFactory/PacketFactory.h"
#include "Receivers/SerialReceiver.h"
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

    //initialize StreamProcessor which will process incoming data via signal/slot connected to serialReceiver
    StreamProcessor* streamProcessor = new StreamProcessor(serialReceiver, packetFactory);

    //initialize MessageTransmitter which will transmit data every period of time deinifed in config.ini
    MessageTransmitter* messageTransmitter = new MessageTransmitter();

    //initialize MessageAggregator which will aggregate all packets into one json message and transmit
    MessageAggregator* messageAggregator = new MessageAggregator(messageTransmitter, packetFactory);
    messageAggregator->startTransmission();

    ProximitySensorsPacket &proxPack = packetFactory->getProximitySensorsPacket();

    engine_.rootContext()->setContextProperty("prox", &proxPack);

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
