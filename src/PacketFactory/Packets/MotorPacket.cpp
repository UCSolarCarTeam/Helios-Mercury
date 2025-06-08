#include "MotorPacket.h"
#include "../../Config/JsonDefinitions.h"

MotorPacket::MotorPacket() {
    setTritiumId(0);
    setSerialNumber(0);

    setLimitFlags(0);
    setErrorFlags(0);
    setActiveMotor(0);
    setTxErrorCount(0);
    setRxErrorCount(0);

    setBusVoltage(0);
    setBusCurrent(0);

    setMotorVelocity(0);
    setVehicleVelocity(0);

    setPhaseCurrentB(0);
    setPhaseCurrentC(0);

    setVq(0);
    setVd(0);

    setIq(0);
    setId(0);

    setBemfq(0);
    setBemfd(0);

    setSupply15V(0);
    setReservedSupply15V(0);

    setSupply1V9(0);
    setSupply3V3(0);

    setReserved0A0(0);
    setReserved0A1(0);

    setMotorTemp(0);
    setHeatsinkTemp(0);

    setDspBoardTemp(0);
    setReservedDspBoardTemp(0);

    setReserved0D0(0);
    setReserved0D1(0);

    setOdometer(0);
    setDcBusAh(0);

    setSlipSpeed(0);
    setReservedSlipSpeed(0);

    initializeIdActionMap();
}


QJsonObject MotorPacket::toJson() {
    QJsonObject json;

    json["TritiumId"] = static_cast<double>(getTritiumId());
    json["SerialNumber"] = getSerialNumber();

    json["LimitFlags"] = getLimitFlags();
    json["ErrorFlags"] = getErrorFlags();
    json["ActiveMotor"] = getActiveMotor();
    json["TxErrorCount"] = getTxErrorCount();
    json["RxErrorCount"] = getRxErrorCount();

    json["BusVoltage"] = getBusVoltage();
    json["BusCurrent"] = getBusCurrent();

    json["MotorVelocity"] = getMotorVelocity();
    json["VehicleVelocity"] = getVehicleVelocity();

    json["PhaseCurrentB"] = getPhaseCurrentB();
    json["PhaseCurrentC"] = getPhaseCurrentC();

    json["Vq"] = getVq();
    json["Vd"] = getVd();

    json["Iq"] = getIq();
    json["Id"] = getId();

    json["Bemfq"] = getBemfq();
    json["Bemfd"] = getBemfd();

    json["Supply15V"] = getSupply15V();
    json["ReservedSupply15V"] = getReservedSupply15V();

    json["Supply1V9"] = getSupply1V9();
    json["Supply3V3"] = getSupply3V3();

    json["Reserved0A0"] = getReserved0A0();
    json["Reserved0A1"] = getReserved0A1();

    json["MotorTemp"] = getMotorTemp();
    json["HeatsinkTemp"] = getHeatsinkTemp();

    json["DspBoardTemp"] = getDspBoardTemp();
    json["ReservedDspBoardTemp"] = getReservedDspBoardTemp();

    json["Reserved0D0"] = getReserved0D0();
    json["Reserved0D1"] = getReserved0D1();

    json["Odometer"] = getOdometer();
    json["DcBusAh"] = getDcBusAh();

    json["SlipSpeed"] = getSlipSpeed();
    json["ReservedSlipSpeed"] = getReservedSlipSpeed();

    return json;
}
