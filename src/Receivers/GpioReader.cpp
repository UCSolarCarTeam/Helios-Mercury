#include "GpioReader.h"
#include <QDebug>
#include <unistd.h>
#include <algorithm>

// Constructor
GPIOReader::GPIOReader(QObject* parent, PacketFactory* packetFactory) : QThread(parent), packetFactory_(packetFactory) {
    begin(20, 21);
}

// Destructor
GPIOReader::~GPIOReader() {
    stop();
    gpioTerminate();
}

// Begin function to initialize GPIO pins
void GPIOReader::begin(int pinData0, int pinData1) {
    pinData0_ = pinData0;
    pinData1_ = pinData1;

    if (gpioInitialise() < 0) {
        qWarning() << "pigpio initialization failed.";
        return;
    }

    gpioSetMode(pinData0_, PI_INPUT);
    gpioSetMode(pinData1_, PI_INPUT);

    gpioSetAlertFuncEx(pinData0_, data0ISR, this);
    gpioSetAlertFuncEx(pinData1_, data1ISR, this);

    reset();
    running = true;
    start();
}

// Stop function to clean up
void GPIOReader::stop() {
    running = false;
    wait();
    gpioSetAlertFunc(pinData0_, nullptr);
    gpioSetAlertFunc(pinData1_, nullptr);
    gpioTerminate();
}

// Reset the internal state
void GPIOReader::reset() {
    std::fill(std::begin(bitData_), std::end(bitData_), false);
    bitCnt_ = 0;
    data_ = 0;
    timestamp_ = gpioTick();
}

// Emit data after receiving 26 bits
void GPIOReader::emitData() {
    for (int i = 1; i < MAX_BITS - 1; ++i) {
        if (bitData_[i]) {
            data_ |= (1UL << (i - 1));
        }
    }
    QByteArray dataArray = QByteArray::number(data_);
    packetFactory_->getPiPacket().populatePacket(dataArray);
    reset();
}

// ISR for Data0 (logical 0)
void GPIOReader::data0ISR(int gpio, int level, uint32_t tick, void* userdata) {
    GPIOReader* instance = static_cast<GPIOReader*>(userdata);
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
void GPIOReader::data1ISR(int gpio, int level, uint32_t tick, void* userdata) {
    GPIOReader* instance = static_cast<GPIOReader*>(userdata);
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

// Main run loop (can be used for additional logic)
void GPIOReader::run() {
    while (running) {
        usleep(10000); // Polling interval (10ms)
    }
}
