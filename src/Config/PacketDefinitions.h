#ifndef PACKETDEFINITIONS_H
#define PACKETDEFINITIONS_H

namespace PacketDefinitions {
    const int MBMS_ID_MIN = 0x100;
    const int MBMS_ID_MAX = 0x105;

    const int CONTACTORS_ID_MIN = 0x210;
    const int CONTACTORS_ID_MAX = 0x214;

    const int BATTERY_ID_MIN = 0x300;
    const int BATTERY_ID_MAX = 0x30A;

    const int MPPT_ID_MIN = 0x600;
    const int MPPT_ID_MAX = 0x607;

    const int MOTOR_ID_MIN = 0x420;
    const int MOTOR_ID_MAX = 0x437;

    const int KEY_MOTOR_ID_MIN = 0x500;
    const int KEY_MOTOR_ID_MAX = 0x503;

    const int B3_ID_MIN = 0x610;
    const int B3_ID_MAX = 0x620;

    const int TELEMETRY_ID_MIN= 0x630;
    const int TELEMETRY_ID_MAX = 0x635;

    const int PROXIMITY_SENSORS_ID_MIN = 0x700;
    const int PROXIMITY_SENSORS_ID_MAX = 0x703;
}

#endif // PACKETDEFINITIONS_H
