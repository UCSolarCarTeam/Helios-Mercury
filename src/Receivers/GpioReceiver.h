#ifndef GPIORECEIVER_H
#define GPIORECEIVER_H

#include <QObject>
#include <pigpio.h>
#include "../PacketFactory/PacketFactory.h"

class GpioReceiver : public QObject {
    Q_OBJECT

public:
    explicit GpioReceiver(PacketFactory* packetFactory = nullptr);
    ~GpioReceiver();

signals:
    void onData(unsigned long data);

private:
    bool rfidInitialized_;
    int rfidPin0_;
    int rfidPin1_;

    int bitCount_;
    static const int MAX_BITS = 26;
    bool rfidData_[MAX_BITS];

    PacketFactory* packetFactory_;

    void startRfidReading();
    void stopRfidReading();

    void reset();
    void emitData();
    static void data0ISR(int gpio, int level, uint32_t tick, void* userdata);
    static void data1ISR(int gpio, int level, uint32_t tick, void* userdata);
    static void dataISR(int gpio, int level, uint32_t tick, void* userdata, bool isData1);
};

#endif // GPIORECEIVER_H
