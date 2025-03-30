import QtQuick 2.15
import Mercury
import QtQuick.Layouts

Item {
    id: contactorStatusContainer
    
    property var contactorData: []
    
    RowLayout {
        id: layout
        anchors.fill: parent
        spacing: 10
        
        Text {
            id: contactorSectionTitle
            text: qsTr("Contactor\n Status")
            color: Config.fontColor
            font.pixelSize: Config.contactorFontSize
            Layout.fillHeight: true
            Layout.bottomMargin: 4
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: Config.fontStyle
        }
        
        Repeater {
            model: contactorData
            
            Item {
                id: contactorStatusFrame
                Layout.fillWidth: true
                Layout.fillHeight: true
                
                Text {
                    id: contactorTitle
                    text: modelData.name
                    font.pixelSize: Config.gaugeFontSizeXS
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
                    imageSource: modelData.isConnected ? "../Images/ContactorConnected.png" : "../Images/ContactorDisconnected.png"
                    iconMaskColor: modelData.isConnected ? Config.contactorConnectedColor : Config.contactorDisconnectedColor
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 2
                }
            }
        }
    }
}
