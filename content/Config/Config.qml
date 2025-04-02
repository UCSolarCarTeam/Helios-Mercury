pragma Singleton
import QtQuick 2.15

QtObject {
    property int windowWidth: 1920
    property int windowHeight: 550

    property color primary: "#3498DB"
    property color btnDisabled: "#111111"

    property color fontColor: "#fff"
    property int fontSize: 16
    property color valueLow: "#4CAF50"
    property color valueModerate: "#FFC107"
    property color valueHigh: "#FF5252"
    property color lightShadow: "#74dcff"

    property color faintGrey: "#AAAAAA"
    property int rndfontSize: 20

    property color fontColor: "#FFFFFF"

    property color needleColor: "#FF0000"
    property color outerArcColor: "#242627"

    property string fontStyle: "SF Pro"
    property color highContrast: "#A2180F"

    property int gaugeFontSizeXXS: 8
    property int gaugeFontSizeXS: 12
    property int gaugeFontSizeS: 18
    property int gaugeFontSizeM: 24
    property int gaugeFontSizeL: 28
    property int gaugeFontSizeXXL: 86

    property int contactorFontSize: 14
    property int contactorLabelFontSize: 12
    property color contactorDisconnectedColor: "#ff0000"
    property color contactorConnectedColor: "#00ff00"

    property int batteryFontSize: 18
    
    property color speedometerWhiteTicks: "#ffffff"
    property color speedometerGrayTicks: "#515253"

    // Wheel diameter in meters
    property double wheelDiameter: 0.50419
    property double rpmValue: (motorDetails0.CurrentRpmValue + motorDetails1.CurrentRpmValue) / 2

    property int gaugeFontSizeXL: 34

    property int tempGaugeFontSize: 16
    property int tempGaugeLabelFontSize: 20

    property int extraSmallGaugeSize: 120
    property int smallGaugeSize: 180
    property int mediumGaugeSize: 240
    property int largeGaugeSize: 300

    property int mpptmbmsFontSizeS: 12
}
