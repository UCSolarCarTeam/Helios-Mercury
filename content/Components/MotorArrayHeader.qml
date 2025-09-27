import QtQuick
import QtQuick.Controls
import Mercury

Item {
    id: motorArrayHeader
    width: 470
    height: 40
    // complete function to determine color based on current value, if current value is above 60, 
    // return Config.valueHigh, if current value is above 40, return Config.valueModerate, else return Config.valueLow
    // function formatCurrentWithColor(value, label)

    // create function to format current value with color
    // function formatCurrentWithColor(value, label) 
    
    // create function to format motor label with value 
    // function formatMotorText(motorId, current) {

    // component that can be used to style text
    component StyledText: Text {
        verticalAlignment: Text.AlignVCenter
        font {
            pixelSize: Config.fontSize3
            weight: Font.Medium
            family: Config.fontStyle
        }
        color: Config.fontColor
        textFormat: Text.RichText
    }

    Column {
        id: motorHeadersColumn

        // motor 0 header
        StyledText {
            id: motor0Header
        }

        // motor 1 header
        StyledText {
            id: motor1Header
        }
    }

    Item {
        id: arrayCurrentSection
        width: motorArrayHeader.width / 2
        anchors {
            left: motorHeadersColumn.right
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }

        // total array current 
        StyledText {
            id: totalArrayCurrentLabel
        }
        
        // array current grid
        Grid {
            id: arrayCurrentGrid
            columns: 2
            rows: 2
            anchors {
                left: totalArrayCurrentLabel.right
                right: parent.right
                top: parent.top
                bottom: parent.bottom
            }

        }
    }
}
