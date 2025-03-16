#include "GpioReceiver.h"
#include "../Config/ConfigManager.h"
#include <QDebug>
#include <unistd.h>
#include <algorithm>
#include <QCryptographicHash>
#include <QByteArray>
#include <QString>

// Constructor
GpioReceiver::GpioReceiver(PacketFactory* packetFactory) : packetFactory_(packetFactory), gpioInitialized(false) {
    // ConfigManager& config = ConfigManager::instance();
    // pin0_ = config.getPin0();
    // pin1_ = config.getPin1();
    // begin(pin0_, pin1_);
    qDebug() << "READER SETTING UP";
    begin(20,21);
}

// Destructor
GpioReceiver::~GpioReceiver() {
    stop();
    if (gpioInitialized) {
        gpioTerminate();
    }
}

// Begin function to initialize GPIO pins
void GpioReceiver::begin(int pinData0, int pinData1) {
    pinData0_ = pinData0;
    pinData1_ = pinData1;

    int result = gpioInitialise();

    // Check if the initialization failed
    if (result < 0) {
        if (result == -1) {
            qWarning() << "pigpio initialization failed: Unable to open pigpio library.";
        } else if (result == -2) {
            qWarning() << "pigpio initialization failed: Raspberry Pi not detected.";
        } else {
            qWarning() << "pigpio initialization failed with error code" << result;
        }
        gpioInitialized = false;
        return; // If initialization fails, skip GPIO setup
    }
    qDebug() << "SETUP GOOD";
    gpioInitialized = true;

    gpioSetMode(pinData0_, PI_INPUT);
    gpioSetMode(pinData1_, PI_INPUT);

    gpioSetAlertFuncEx(pinData0_, data0ISR, this);
    gpioSetAlertFuncEx(pinData1_, data1ISR, this);

    reset();
    running = true;
}

// Stop function to clean up
void GpioReceiver::stop() {
    running = false;
    if (gpioInitialized) {
        gpioSetAlertFunc(pinData0_, nullptr);
        gpioSetAlertFunc(pinData1_, nullptr);
    }
}

// Reset the internal state
void GpioReceiver::reset() {
    std::fill(std::begin(bitData_), std::end(bitData_), false);
    bitCnt_ = 0;
    data_ = 0;
    timestamp_ = gpioTick();
}

// Emit data after receiving 26 bits
void GpioReceiver::emitData() {
    for (int i = 1; i < MAX_BITS - 1; ++i) {
        if (bitData_[i]) {
            data_ |= (1UL << (i - 1));
        }
    }
    QByteArray hashedRfid = QCryptographicHash::hash(QByteArray::number(data_), QCryptographicHash::Md5);

    QString hashedRfidStr = QString(hashedRfid.toHex());

    qDebug() << "GOT3" << hashedRfidStr;

    packetFactory_->getPiPacket().setRfid(1);
   
    reset();
}

// ISR for Data0 (logical 0)
void GpioReceiver::data0ISR(int gpio, int level, uint32_t tick, void* userdata) {
    GpioReceiver* instance = static_cast<GpioReceiver*>(userdata);
    if (!instance->gpioInitialized) return;
    if (level == 0) { // Falling edge
        usleep(10000);
        if (instance->bitCnt_ < MAX_BITS) {
            instance->bitData_[instance->bitCnt_++] = false;
            if (instance->bitCnt_ == MAX_BITS) {
                instance->emitData();
            }
        }
    }
}

// ISR for Data1 (logical 1)
void GpioReceiver::data1ISR(int gpio, int level, uint32_t tick, void* userdata) {
    GpioReceiver* instance = static_cast<GpioReceiver*>(userdata);
    if (!instance->gpioInitialized) return;
    if (level == 0) { // Falling edge
        usleep(10000);
        if (instance->bitCnt_ < MAX_BITS) {
            instance->bitData_[instance->bitCnt_++] = true;
            if (instance->bitCnt_ == MAX_BITS) {
                instance->emitData();
            }
        }
    }
}
