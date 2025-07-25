#ifndef PACKETDEFINITIONS_H
#define PACKETDEFINITIONS_H

#include <array>

namespace PacketDefinitions {
    const char FRAMING_BYTE = 0x00;

    const int MIN_PACKET_LENGTH = 4; //TODO: set to smallest packet

    const int ID_INDEX = 0;

    const int KEY_MOTOR_ID = 1;
    const int KEY_MOTOR_LENGTH = 4;
    const int KEY_MOTOR_ID_MIN = 0x550;
    const int KEY_MOTOR_ID_MAX = 0x555;

    const int MOTOR_DETAILS_0_ID = 2;
    const int MOTOR_DETAILS_0_LENGTH = 33;
    const int MOTOR_DETAILS_0_ID_MIN = 0x400;
    const int MOTOR_DETAILS_0_ID_MAX = 0x417;

    const int MOTOR_DETAILS_1_ID = 3;
    const int MOTOR_DETAILS_1_LENGTH = 33;
    const int MOTOR_DETAILS_1_ID_MIN = 0x420;
    const int MOTOR_DETAILS_1_ID_MAX = 0x437;

    const int B3_ID = 4;
    const int B3_LENGTH = 7;
    const int B3_ID_MIN = 0x610;
    const int B3_ID_MAX = 0x620;

    const int TELEMETRY_ID = 5;
    const int TELEMETRY_LENGTH = 33;
    const int TELEMETRY_ID_MIN= 0x630;
    const int TELEMETRY_ID_MAX = 0x635;

    const int BATTERY_FAULTS_ID = 6;
    const int BATTERY_FAULTS_LENGTH = 7;
    const int BATTERY_FAULTS_ID_MIN = 0x303;
    const int BATTERY_FAULTS_ID_MAX = 0x304;

    const int BATTERY_ID = 7;
    const int BATTERY_LENGTH = 48;
    const int BATTERY_ID_MIN_0 = 0x300;
    const int BATTERY_ID_MAX_0 = 0x302;
    const int BATTERY_ID_MIN_1 = 0x304;
    const int BATTERY_ID_MAX_1 = 0x30A;

    const int MPPT_ID = 8;
    const int MPPT_LENGTH = 10;
    const int MPPT_ID_MIN = 0x600;
    const int MPPT_ID_MAX = 0x607;

    const int MBMS_ID = 9;
    const int MBMS_LENGTH = 26;
    const int MBMS_ID_MIN = 0x100;
    const int MBMS_ID_MAX = 0x105;

    const int PROXIMITY_SENSORS_ID = 10;
    const int PROXIMITY_SENSORS_LENGTH = 9;
    const int PROXIMITY_SENSORS_ID_MIN = 0x700;
    const int PROXIMITY_SENSORS_ID_MAX = 0x703;

    const int CONTACTOR_ID_MIN = 0x200;
    const int CONTACTOR_ID_MAX = 0x214; 

    const std::array<int, 11> packetLength = {
        -69,
        KEY_MOTOR_LENGTH,
        MOTOR_DETAILS_0_LENGTH, 
        MOTOR_DETAILS_1_LENGTH,
        B3_LENGTH,
        TELEMETRY_LENGTH,
        BATTERY_FAULTS_LENGTH, 
        BATTERY_LENGTH, 
        MPPT_LENGTH, 
        MBMS_LENGTH,
        PROXIMITY_SENSORS_LENGTH
    };
}

#endif // PACKETDEFINITIONS_H
