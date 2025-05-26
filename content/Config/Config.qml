pragma Singleton
import QtQuick 2.15

QtObject {
    property bool darkMode: false

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

    property int driverNameFontSize: 20

    property int telemetryFlagLabelFontSize: 24

    property int rpmGaugeFontSize: 40
    property int rpmLabelFontSize: 12

    property color rpmLabelFontColor: "#7a7a7a"

    // Wheel diameter in meters
    property double wheelDiameter: 0.50419
    property double rpmValue: (motorDetails0.CurrentRpmValue + motorDetails1.CurrentRpmValue) / 2

    property int extraSmallGaugeSize: 120
    property int smallGaugeSize: 180
    property int mediumGaugeSize: 240
    property int largeGaugeSize: 300

    // color values 
    property color primary: darkMode ? "#3498DB" : "#0083DB"
    property color backplateColor: darkMode ? "#111111" : "#FFFFFF"
    property color btnDisabled: darkMode ? "#242424" : "#C2C2C2"
    property color valueLow: darkMode ? "#4CAF50" : "#4CAF50"
    property color valueModerate: darkMode ? "#FFC107" : "#FFC107"
    property color valueHigh: darkMode ? "#FF5252" : "#FF5252" 
    property color lightShadow: darkMode ? "#74DCFF" : "#74DCFF"
    property color faintGrey: darkMode ? "#AAAAAA" : "#5C5C5C"
    property color fontColor: darkMode ? "#FFFFFF" : "#111111"
    property color needleColor: "#FF0000" 
    property color outerArcColor: darkMode ? "#242627" : "#AEB8BD"
    property color contactorDisconnectedColor: "#ff0000"
    property color contactorConnectedColor: darkMode ? "#00ff00" : "#029902"
    property color speedometerWhiteTicks: darkMode ? "#ffffff" : "#111111"
    property color speedometerGrayTicks: darkMode ? "#515253" : "#97999c"
}
