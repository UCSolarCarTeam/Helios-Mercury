#include "GpioReceiver.h"
#include "../Config/ConfigManager.h"
#include <QDebug>
#include <unistd.h>
#include <algorithm>
#include <QCryptographicHash>
#include <QByteArray>
#include <QString>


// Constructor
GpioReceiver::GpioReceiver(PacketFactory* packetFactory) 
    : packetFactory_(packetFactory), rfidData_{false} {
    rfidInitialized_ = false;
    bitCount_ = 0;
    
    qDebug() << "Setting up RFID GPIOs";
    startRfidReading();
}

// Destructor
GpioReceiver::~GpioReceiver() {
    stopRfidReading();
    if (rfidInitialized_) {
        gpioTerminate();
    }
}

// Begin function to initialize GPIO pins
void GpioReceiver::startRfidReading() {
    ConfigManager& config = ConfigManager::instance();
    rfidPin0_ = config.getRfidPin0();
    rfidPin1_ = config.getRfidPin1();

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
        return;
    }

    qDebug() << "RFID GPIOs initlized";
    rfidInitialized_ = true;

    gpioSetMode(rfidPin0_, PI_INPUT);
    gpioSetMode(rfidPin1_, PI_INPUT);

    gpioSetAlertFuncEx(rfidPin0_, data0ISR, this);
    gpioSetAlertFuncEx(rfidPin1_, data1ISR, this);

    reset();
}

// Stop function to clean up
void GpioReceiver::stopRfidReading() {
    if (rfidInitialized_) {
        gpioSetAlertFunc(rfidPin0_, nullptr);
        gpioSetAlertFunc(rfidPin1_, nullptr);
    }
}

// Reset the internal state
void GpioReceiver::reset() {
    std::fill(std::begin(rfidData_), std::end(rfidData_), false);
    bitCount_ = 0;
    //data_ = 0;
    //timestamp_ = gpioTick();
}

// Emit data after receiving 26 bits
void GpioReceiver::emitData() {
    unsigned long data = 0;

    for (int i = 1; i < MAX_BITS - 1; ++i) {
        if (rfidData_[i]) {
            data |= (1UL << (i - 1));
        }
    }
    QByteArray hashedRfid = QCryptographicHash::hash(QByteArray::number(data), QCryptographicHash::Md5);

    QString hashedRfidStr = QString(hashedRfid.toHex());

    qDebug() << "GOT3" << hashedRfidStr;

    packetFactory_->getPiPacket().setRfid(1);
   
    reset();
}

// ISR for Data0 (logical 0)
void GpioReceiver::data0ISR(int gpio, int level, uint32_t tick, void* userdata) {
    GpioReceiver* instance = static_cast<GpioReceiver*>(userdata);
    if (!instance->rfidInitialized_) return;
    if (level == 0) { // Falling edge
        usleep(10000);
        if (instance->bitCount_ < MAX_BITS) {
            instance->rfidData_[instance->bitCount_++] = false;
            if (instance->bitCount_ == MAX_BITS) {
                instance->emitData();
            }
        }
    }
}

// ISR for Data1 (logical 1)
void GpioReceiver::data1ISR(int gpio, int level, uint32_t tick, void* userdata) {
    GpioReceiver* instance = static_cast<GpioReceiver*>(userdata);
    if (!instance->rfidInitialized_) return;
    if (level == 0) { // Falling edge
        usleep(10000);
        if (instance->bitCount_ < MAX_BITS) {
            instance->rfidData_[instance->bitCount_++] = true;
            if (instance->bitCount_ == MAX_BITS) {
                instance->emitData();
            }
        }
    }
}
