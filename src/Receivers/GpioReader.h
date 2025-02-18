#ifndef GPIOREADER_H
#define GPIOREADER_H

#include <QObject>
#include <QThread>
// #include <pigpio.h>
#include "../../imports/pigpio/pigpio.h"
#include "../PacketFactory/PacketFactory.h"

class GpioReader : public QThread {
    Q_OBJECT

public:
    explicit GpioReader(QObject* parent = nullptr, PacketFactory* packetFactory = nullptr);
    ~GpioReader();

    void begin(int pinData0, int pinData1);
    void stop();

signals:
    void onData(unsigned long data);

protected:
    void run() override;

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

#endif // GPIOREADER_H
