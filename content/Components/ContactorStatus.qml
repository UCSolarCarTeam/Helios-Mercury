import QtQuick 2.15
import Mercury
import QtQuick.Layouts

Item {
    id: contactorStatusContainer
    width: 100
    height: 35
    RowLayout {
        id: contactorContainer
        width: 365
        height: 15
        spacing: 10
        Repeater {
            model: [
                { name: "CMN", isConnected: mbms.CommonContactorCommand, hasError: contactor.CommonContactorError },
                { name: "LV", isConnected: mbms.LvContactorCommand, hasError: contactor.LvContactorError },
                { name: "HV", isConnected: mbms.HvContactorCommand, hasError: contactor.HvContactorError },
                { name: "ARRAY", isConnected: mbms.ArrayContactorCommand, hasError: contactor.ArrayContactorError },
                { name: "CHARGE", isConnected: mbms.ChargeContactorCommand, hasError: contactor.ChargeContactorError }
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
                    font.weight: Font.Medium
                    color: Config.fontColor
                    anchors.bottom: contactorIcon.top
                    anchors.bottomMargin: 2
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                
                DashIcon {
                    id: contactorIcon
                    width: 30
                    height: 30
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
        Text {
            id: contactorStatusTitle
            height: 30
            width: 65
            text: "Contactor\nStatus"
            font.pixelSize: Config.fontSize1
            font.family: Config.fontStyle
            font.weight: Font.Bold
            color: Config.fontColor
            horizontalAlignment: Text.AlignHCenter
            anchors.right: contactorContainer.left
            anchors.rightMargin: 15
            verticalAlignment: contactorContainer.AlignVCenter
        }
    }
}