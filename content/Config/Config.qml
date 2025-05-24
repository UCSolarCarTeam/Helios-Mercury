pragma Singleton
import QtQuick 2.15

QtObject {
    property int windowWidth: 1920
    property int windowHeight: 550

    property string fontStyle: "SF Pro"

    // font sizes
    property int motorArrayFontSize: 16
    property int rndfontSize: 20

    property int gaugeFontSizeXXS: 8
    property int gaugeFontSizeXS: 12
    property int gaugeFontSizeS: 18
    property int gaugeFontSizeM: 24
    property int gaugeFontSizeL: 28
    property int gaugeFontSizeXL: 34
    property int gaugeFontSizeXXL: 86

    property int contactorFontSize: 14
    property int contactorLabelFontSize: 12

    property int batteryFontSize: 18

    property int headerFontSize: 18
    property int debugHeaderFontSize: 24

    property int tempGaugeFontSize: 16
    property int tempGaugeLabelFontSize: 20

    property int mpptmbmsFontSizeS: 12

    // Wheel diameter in meters
    property double wheelDiameter: 0.50419
    property double rpmValue: (motorDetails0.CurrentRpmValue + motorDetails1.CurrentRpmValue) / 2

    property int extraSmallGaugeSize: 120
    property int smallGaugeSize: 180
    property int mediumGaugeSize: 240
    property int largeGaugeSize: 300

    // color values 
    property color primary: pi.DarkMode ? "#3498DB" : "#0083DB"
    property color backplateColor: pi.DarkMode ? "#111111" : "#FFFFFF"
    property color btnDisabled: pi.DarkMode ? "#242424" : "#C2C2C2"
    property color valueLow: pi.DarkMode ? "#4CAF50" : "#4CAF50"
    property color valueModerate: pi.DarkMode ? "#FFC107" : "#FFC107"
    property color valueHigh: pi.DarkMode ? "#FF5252" : "#FF5252" 
    property color lightShadow: pi.DarkMode ? "#74DCFF" : "#74DCFF"
    property color faintGrey: pi.DarkMode ? "#AAAAAA" : "#5C5C5C"
    property color fontColor: pi.DarkMode ? "#FFFFFF" : "#111111"
    property color needleColor: "#FF0000" 
    property color outerArcColor: pi.DarkMode ? "#242627" : "#AEB8BD"
    property color contactorDisconnectedColor: "#ff0000"
    property color contactorConnectedColor: pi.DarkMode ? "#00ff00" : "#029902"
    property color speedometerWhiteTicks: pi.DarkMode ? "#ffffff" : "#111111"
    property color speedometerGrayTicks: pi.DarkMode ? "#515253" : "#97999c"
}
