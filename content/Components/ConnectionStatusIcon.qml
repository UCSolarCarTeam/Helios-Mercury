import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Effects
import Mercury

Item {
    id: connectionStatusIcon
    width: 34
    height: 34

    // This is put in place just in case if therea are any errors getting connection from Telemetry and or signal strength
    property int latency: typeof pi !== "undefined" && pi.Latency !== undefined ? pi.Latency : 0
    property bool telemetryConnected: typeof pi !== "undefined" && pi.TelemetryConnected !== undefined ? pi.TelemetryConnected : false


    Component.onCompleted: {
        console.log("Telemetry connected:", telemetryConnected)
        console.log("Latency:", latency)
    }      
    
    DashIcon {
        id: connectionImage
        width: 34
        height: 34
        imageSource: "../Images/ConnectionStatusIcon.png"
        iconMaskColor: telemetryConnected ? Config.connectionStatusIconStable: Config.connectionStatusIconUnstable
    }  
    Text {
        text: latency <= 0 ? "No Signal" : latency + " ms"
        anchors.horizontalCenter: connectionImage.horizontalCenter
        anchors.top: connectionImage.bottom
        anchors.topMargin: -5
        anchors.horizontalCenterOffset: 0
        // Dynamic color based on latency thresholds
        color: latency > 1000 || latency <= 0 ? Config.connectionStatusIconUnstable
            : latency <= 100 ? Config.connectionStatusIconStable // green
            : latency <= 300 ? Config.connectionStatusIconModerate // yellow
            : Config.connectionStatusIconUnstable // red   
        font.pixelSize: Config.connectionStatusIconFont
        font.bold: true
    }    
}
