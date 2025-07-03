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
                { name: "CMN", isConnected: ! contactor.CommonContactorClosed, hasError: contactor.CommonContactorError },
                { name: "MOTOR", isConnected: ! contactor.MotorContactorClosed, hasError: contactor.MotorContactorError },
                { name: "ARRAY", isConnected: ! contactor.ArrayContactorClosed, hasError: contactor.ArrayContactorError },
                { name: "CHARGE", isConnected: ! contactor.ChargeContactorClosed, hasError: contactor.ChargeContactorError }, 
                { name: "LV", isConnected: ! contactor.LvContactorClosed, hasError: contactor.LvContactorError }
            ]
            
            delegate: Item {
                id: contactorStatusFrame
                Layout.fillWidth: true
                Layout.fillHeight: true
                
                Text {
                    id: contactorTitle
                    text: modelData.name
                    font.pixelSize: Config.fontSize1
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
                    iconMaskColor: modelData.hasError ? Config.valueHigh : 
                                (modelData.isConnected ? Config.valueLow : Config.valueHigh)
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 2
                }
            }
        }
    }
}
