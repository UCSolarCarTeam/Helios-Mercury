pragma Singleton
import QtQuick 2.15

QtObject {
    property int windowWidth: 1920
    property int windowHeight: 550

    property string fontStyle: "SF Pro"

    // font sizes
    property int fontSize0: 8
    property int fontSize1: 12
    property int fontSize2: 14
    property int fontSize3: 16
    property int fontSize4: 18
    property int fontSize5: 20
    property int fontSize6: 24
    property int fontSize7: 28
    property int fontSize8: 34
    property int fontSize9: 40
    property int fontSize10: 86

    // Wheel diameter in meters
    property double wheelDiameter: 0.50419
    property double rpmValue: (motorDetails0.CurrentRpmValue + motorDetails1.CurrentRpmValue) / 2

    // gauge sizes
    property int extraSmallGaugeSize: 120
    property int smallGaugeSize: 180
    property int mediumGaugeSize: 240
    property int largeGaugeSize: 300

    // color values 
    property color primary: darkModeEnabled ? "#3498DB" : "#0083DB"
    property color backplateColor: darkModeEnabled ? "#000000" : "#FFFFFF"
    property color btnDisabled: darkModeEnabled ? "#242424" : "#C2C2C2"
    property color valueLow: darkModeEnabled ? "#00ff00" : "#029902"
    property color valueModerate: "#FFC107"
    property color valueHigh: "#FF0000"
    property color lightShadow: "#74DCFF"
    property color faintGrey: darkModeEnabled ? "#AAAAAA" : "#5C5C5C"
    property color fontColor: darkModeEnabled ? "#FFFFFF" : "#111111"
    property color outerArcColor: darkModeEnabled ? "#242627" : "#AEB8BD"
    property color speedometerGrayTicks: darkModeEnabled ? "#515253" : "#97999c"

}
