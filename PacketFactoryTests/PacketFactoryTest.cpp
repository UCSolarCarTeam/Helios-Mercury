#include <QtTest>

// add necessary includes here

class PacketFactoryTest : public QObject
{
    Q_OBJECT

public:
    PacketFactoryTest();
    ~PacketFactoryTest();

private slots:
    void test_case1();
};

PacketFactoryTest::PacketFactoryTest() {}

PacketFactoryTest::~PacketFactoryTest() {}

void PacketFactoryTest::test_case1() {}

QTEST_APPLESS_MAIN(PacketFactoryTest)

#include "PacketFactoryTest.moc"
