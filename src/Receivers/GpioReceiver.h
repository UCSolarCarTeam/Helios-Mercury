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

    void begin(int pinData0, int pinData1);
    void stop();

signals:
    void onData(unsigned long data);

private:
    bool running = false;
    bool gpioInitialized = false;
    int pin0_;
    int pin1_;
    int pinData0_;
    int pinData1_;
    int bitCnt_ = 0;
    static const int MAX_BITS = 26;
    bool bitData_[MAX_BITS] = {false};
    unsigned long data_ = 0;
    unsigned long timestamp_;
    PacketFactory* packetFactory_;

    void reset();
    void emitData();
    static void data0ISR(int gpio, int level, uint32_t tick, void* userdata);
    static void data1ISR(int gpio, int level, uint32_t tick, void* userdata);
};

#endif // GPIORECEIVER_H
