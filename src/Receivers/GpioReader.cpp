#include "GpioReader.h"
#include <QDebug>
#include <unistd.h>
#include <algorithm>

// Constructor
GpioReader::GpioReader(QObject* parent, PacketFactory* packetFactory) : QThread(parent), packetFactory_(packetFactory), gpioInitialized(false) {
    begin(20, 21);
}

// Destructor
GpioReader::~GpioReader() {
    stop();
    if (gpioInitialized) {
        gpioTerminate();
    }
}

// Begin function to initialize GPIO pins
void GpioReader::begin(int pinData0, int pinData1) {
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

    gpioInitialized = true;

    gpioSetMode(pinData0_, PI_INPUT);
    gpioSetMode(pinData1_, PI_INPUT);

    gpioSetAlertFuncEx(pinData0_, data0ISR, this);
    gpioSetAlertFuncEx(pinData1_, data1ISR, this);

    reset();
    running = true;
    start();
}

// Stop function to clean up
void GpioReader::stop() {
    running = false;
    wait();
    if (gpioInitialized) {
        gpioSetAlertFunc(pinData0_, nullptr);
        gpioSetAlertFunc(pinData1_, nullptr);
    }
}

// Reset the internal state
void GpioReader::reset() {
    std::fill(std::begin(bitData_), std::end(bitData_), false);
    bitCnt_ = 0;
    data_ = 0;
    timestamp_ = gpioTick();
}

// Emit data after receiving 26 bits
void GpioReader::emitData() {
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
void GpioReader::data0ISR(int gpio, int level, uint32_t tick, void* userdata) {
    GpioReader* instance = static_cast<GpioReader*>(userdata);
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
void GpioReader::data1ISR(int gpio, int level, uint32_t tick, void* userdata) {
    GpioReader* instance = static_cast<GpioReader*>(userdata);
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

// Main run loop (can be used for additional logic)
void GpioReader::run() {
    while (running) {
        usleep(10000); // Polling interval (10ms)
    }
}
