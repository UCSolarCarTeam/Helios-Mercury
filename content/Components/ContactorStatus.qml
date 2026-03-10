import QtQuick 2.15
import Mercury
import QtQuick.Layouts


RowLayout {
    id: contactorContainer
    height: 35
    width: 500
    spacing: 50
    Text {
        id: contactorStatusTitle
        text: "Contactor\nStatus"
        font.pixelSize: Config.fontSize1
        font.family: Config.fontStyle
        font.weight: Font.Bold
        color: Config.fontColor
        horizontalAlignment: Text.AlignHCenter
    }
    Repeater {
        model: [
            { name: "CMN", isConnected: mbms.CommonContactorCommand, hasError: contactor.CommonContactorError },
            { name: "LV", isConnected: mbms.LvContactorCommand, hasError: contactor.LvContactorError },
            { name: "MOTOR", isConnected: mbms.MotorContactorCommand, hasError: contactor.MotorContactorError },
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
                anchors.bottomMargin: 5
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
            }
        }
    }

    TelemetryIcon {
        id: telemetryIcon
    }
}

