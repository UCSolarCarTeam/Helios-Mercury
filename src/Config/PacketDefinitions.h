#ifndef PACKETDEFINITIONS_H
#define PACKETDEFINITIONS_H

#include <array>

namespace PacketDefinitions {

    const int KEY_MOTOR_ID_MIN = 0x550;
    const int KEY_MOTOR_ID_MAX = 0x555;

    const int MOTOR_DETAILS_0_ID_MIN = 0x400;
    const int MOTOR_DETAILS_0_ID_MAX = 0x417;

    const int MOTOR_DETAILS_1_ID_MIN = 0x420;
    const int MOTOR_DETAILS_1_ID_MAX = 0x437;

    const int B3_ID_MIN = 0x610;
    const int B3_ID_MAX = 0x620;

    const int TELEMETRY_ID_MIN= 0x630;
    const int TELEMETRY_ID_MAX = 0x635;

    const int BATTERY_FAULTS_ID_MIN = 0x303;
    const int BATTERY_FAULTS_ID_MAX = 0x304;

    const int BATTERY_ID_MIN_0 = 0x300;
    const int BATTERY_ID_MAX_0 = 0x302;
    const int BATTERY_ID_MIN_1 = 0x304;
    const int BATTERY_ID_MAX_1 = 0x30A;

    const int MPPT_ID_MIN = 0x600;
    const int MPPT_ID_MAX = 0x607;

    const int MBMS_ID_MIN = 0x100;
    const int MBMS_ID_MAX = 0x105;

    const int PROXIMITY_SENSORS_ID_MIN = 0x700;
    const int PROXIMITY_SENSORS_ID_MAX = 0x703;

    const int CONTACTOR_ID_MIN = 0x200;
    const int CONTACTOR_ID_MAX = 0x214; 

}

#endif // PACKETDEFINITIONS_H
