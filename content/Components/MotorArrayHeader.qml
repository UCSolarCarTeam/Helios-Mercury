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

    function getValueColor(current) {
        if (current > 60){
            return Config.valueHigh;
        }
        if (current > 40){
            return Config.valueModerate;
        }
        return Config.valueLow;
    }

    // create function to format current value with color
    // function formatCurrentWithColor(value, label) 

    function formatCurrentWithColor(value, label) {
        const currentValue = Math.floor(value / 1000);
        return label + "<font color=\"" + getValueColor(currentValue) + "\">" + currentValue + "</font> A";
    }


    // create function to format motor label with value
    // function formatMotorText(motorId, current) {

    function formatMotorText(motorID, current) {
        return "Motor " + motorID + " Current: <font color=\"" + getValueColor(current) + "\">" + current + "</font> A";
    }

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
        anchors {
            left: motorArrayHeader.left
            leftMargin: 20
            top: motorArrayHeader.top
            bottom: motorArrayHeader.bottom
        }

        // motor 0 header
        StyledText {
            id: motor0Header
            text: formatMotorText(0, motorDetails0.BusCurrent)
        }

        // motor 1 header
        StyledText {
            id: motor1Header
            text: formatMotorText(1, motorDetails1.BusCurrent)
        }
    }

    Item {
        id: arrayCurrentSection
        width: motorArrayHeader.width / 2
        anchors {
            right: motorArrayHeader.right
            top: parent.top
            bottom: parent.bottom
        }

        // total array current 
        StyledText {
            id: totalArrayCurrentLabel
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 120
            text: "Array Current:"
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

            property real cellWidth: width / columns * 2.5
            property real cellHeight: height / rows

            Repeater {
                model: [
                    { id: "0, 0: ", current: mppt.Mppt0Ch0ArrayCurrent },
                    { id: "0, 1: ", current: mppt.Mppt0Ch1ArrayCurrent },
                    { id: "1, 0: ", current: mppt.Mppt1Ch0ArrayCurrent },
                    { id: "1, 1: ", current: mppt.Mppt1Ch1ArrayCurrent }
                ]

                StyledText {
                    width: arrayCurrentGrid.cellWidth
                    height: arrayCurrentGrid.cellHeight
                    text: formatCurrentWithColor(modelData.current, modelData.id)
                }
            }
        }
    }
}
