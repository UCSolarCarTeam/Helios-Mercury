pragma Singleton
import QtQuick 2.15

QtObject {
    property int windowWidth: 1920
    property int windowHeight: 550

    property color primary: "#3498db"
    property color btnDisabled: "#111111"

    property color fontColor: "#ffffff"

    property color needleColor: "#ff0000"
    property color outerArcColor: "#242627"

    property string fontStyle: "SF Pro"
    property color highContrast: "#A2180F"

    property int gaugeFontSizeS: 18
    property int gaugeFontSizeM: 24
    property int gaugeFontSizeL: 36

    property int batteryFontSize: 18

}
