import QtQuick 2.15
import Mercury
import QtQuick.Layouts

Item {
    id: contactorStatusContainer
    width: 400
    height: 35
    
    RowLayout {
        id: contactorContainer
        width: 400
        height: 35
        spacing: 10
        
        Repeater {
            model: [
                { name: "CMN", isConnected: mbms.CommonContactorState, hasError: mbms.CommonContactorError },
                { name: "MOTOR", isConnected: mbms.MotorContactorState, hasError: mbms.MotorContactorError },
                { name: "ARRAY", isConnected: mbms.ArrayContactorState, hasError: mbms.ArrayContactorError },
                { name: "CHARGE", isConnected: mbms.ChargeContactorState, hasError: mbms.ChargeContactorError }, 
                { name: "LV", isConnected: mbms.LvContactorState, hasError: mbms.LvContactorError }
            ]
            
            delegate: Item {
                id: contactorStatusFrame
                Layout.fillWidth: true
                Layout.fillHeight: true
                
                Text {
                    id: contactorTitle
                    text: modelData.name
                    font.pixelSize: Config.contactorLabelFontSize
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: Config.fontStyle
                    color: Config.fontColor
                    anchors.bottom: contactorIcon.top
                    anchors.bottomMargin: 2
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                
                DashIcon {
                    id: contactorIcon
                    width: 20
                    height: 20
                    imageSource: modelData.hasError ? "../Images/Exclamation.png" : 
                                (modelData.isConnected ? "../Images/ContactorConnected.png" : "../Images/ContactorDisconnected.png")
                    iconMaskColor: modelData.hasError ? Config.contactorDisconnectedColor : 
                                (modelData.isConnected ? Config.contactorConnectedColor : Config.contactorDisconnectedColor)
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 2
                }
            }
        }
    }
}
