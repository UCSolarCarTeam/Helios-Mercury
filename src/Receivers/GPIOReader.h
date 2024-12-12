#ifndef GPIOREADER_H
#define GPIOREADER_H

#include <QObject>
#include <QThread>
#include <pigpio.h>
#include "../PacketFactory/PacketFactory.h"

class GPIOReader : public QThread {
    Q_OBJECT

public:
    explicit GPIOReader(QObject* parent = nullptr, PacketFactory* packetFactory = nullptr);
    ~GPIOReader();

    void begin(int pinData0, int pinData1);
    void stop();

signals:
    void onData(unsigned long data);

protected:
    void run() override;

private:
    bool running = false;
    int _pinData0, _pinData1;
    int _bitCnt = 0;
    static const int MAX_BITS = 26;
    bool _bitData[MAX_BITS] = {false};
    unsigned long _data = 0;
    unsigned long _timestamp;
    PacketFactory* packetFactory_;

    void reset();
    void emitData();
    static void data0ISR(int gpio, int level, uint32_t tick, void* userdata);
    static void data1ISR(int gpio, int level, uint32_t tick, void* userdata);
};

#endif // GPIOREADER_H
