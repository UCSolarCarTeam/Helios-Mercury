#include "GpioReceiver.h"
#include "../Config/ConfigManager.h"
#include <QDebug>
#include <unistd.h>
#include <QCryptographicHash>


/** Initilizes Gpio pins defined in config.ini for rfid reading */
GpioReceiver::GpioReceiver(PacketFactory* packetFactory) 
    : packetFactory_(packetFactory), rfidData_{false},
      rfidInitialized_(false), bitCount_ (0) {
    
    ConfigManager& config = ConfigManager::instance();
    rfidPin0_ = config.getRfidPin0();
    rfidPin1_ = config.getRfidPin1();

    qDebug() << "Setting up RFID GPIOs";
    startRfidReading();
}

/** Stops RFID pin reading */
GpioReceiver::~GpioReceiver() {
    stopRfidReading();
    if (rfidInitialized_) {
        gpioTerminate();
    }
}

/** Attempts to open RFID GPIO pins and begins listening on success */
void GpioReceiver::startRfidReading() {
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

/** Stop function for clean up */
void GpioReceiver::stopRfidReading() {
    if (rfidInitialized_) {
        gpioSetAlertFunc(rfidPin0_, nullptr);
        gpioSetAlertFunc(rfidPin1_, nullptr);
    }
}

/** Reset Values for new RFID reading */
void GpioReceiver::reset() {
    std::fill(std::begin(rfidData_), std::end(rfidData_), false);
    bitCount_ = 0;
}

/** 
 *  Parses RFID inputs, hashes the result, converts to string
 *  then sets the RFID value in the pi packet
 * 
 *  IMPORTANT: this sensitive data and should always be hashed,
 *             the raw value should never be stored, transmitted,
 *             or displayed.
 */
void GpioReceiver::emitData() {
    unsigned long data = 0;

    for (int i = 1; i < MAX_BITS - 1; ++i) {
        if (rfidData_[i]) {
            data |= (1UL << (i - 1));
        }
    }

    QByteArray hashedRfid = QCryptographicHash::hash(QByteArray::number(data), QCryptographicHash::Md5);
    QString hashedRfidStr = QString(hashedRfid.toHex());
    packetFactory_->getPiPacket().setRfid(hashedRfidStr);
   
    reset();
}

//** Wrapper for Data0 ISR */
void GpioReceiver::data0ISR(int gpio, int level, uint32_t tick, void* context) {
    GpioReceiver* instance = static_cast<GpioReceiver*>(context);
    instance->dataISR(gpio, level, tick, false);
}

/** Wrapper for Data1 ISR */
void GpioReceiver::data1ISR(int gpio, int level, uint32_t tick, void* context) {
    GpioReceiver* instance = static_cast<GpioReceiver*>(context);
    instance->dataISR(gpio, level, tick, true);
}

/**
 * Generalized Interrupt Service Routine (ISR) for Data0 and Data1.
 * Called when falling edge is detected on the Data0 (rfidPin0) or Data1 (rfidPin1) GPIO pin.
 * 
 * @param gpio pin number.
 * @param level level of the GPIO pin (0 for falling).
 * @param tick tick count at the time of the interrupt.
 * @param isData1 indicates whether the ISR is for Data1 (true) or Data0 (false).
 */
void GpioReceiver::dataISR(int gpio, int level, uint32_t tick, bool isData1) {
    if (!rfidInitialized_) return;
    if (level == 0) { // Falling edge
        usleep(10000);
        if (bitCount_ < MAX_BITS) {
            rfidData_[bitCount_++] = isData1;
            if (bitCount_ == MAX_BITS) {
                emitData();
            }
        }
    }
}