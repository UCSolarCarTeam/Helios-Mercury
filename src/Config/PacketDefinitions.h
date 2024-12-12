#ifndef PACKETDEFINITIONS_H
#define PACKETDEFINITIONS_H

#include <array>

namespace PacketDefinitions {
    const char FRAMING_BYTE = 0x00;

    const int MIN_PACKET_LENGTH = 4; //TODO: set to smallest packet

    const int ID_INDEX = 0;

    const int KEY_MOTOR_ID = 1;
    const int KEY_MOTOR_LENGTH = 4;

    const int MOTOR_DETAILS_0_ID = 2;
    const int MOTOR_DETAILS_0_LENGTH = 33;

    const int MOTOR_DETAILS_1_ID = 3;
    const int MOTOR_DETAILS_1_LENGTH = 33;

    const int B3_ID = 4;
    const int B3_LENGTH = 8;

    const int TELEMETRY_ID = 5;
    const int TELEMETRY_LENGTH = 33;

    const int BATTERY_FAULTS_ID = 6;
    const int BATTERY_FAULTS_LENGTH = 7;

    const int BATTERY_ID = 7;
    const int BATTERY_LENGTH = 48;

    const int MPPT_ID = 8;
    const int MPPT_LENGTH = 10;

    const int MBMS_ID = 9;
    const int MBMS_LENGTH = 26;

    const int PROXIMITY_SENSORS_ID = 10;
    const int PROXIMITY_SENSORS_LENGTH = 9;

    const int PI_ID = 11;
    const int PI_LENGTH = 4;

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
