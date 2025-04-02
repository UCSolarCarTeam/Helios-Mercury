import QtQuick
import QtQuick.Controls
import Mercury

Item {
    id: motorArrayHeader
    width: 440
    height: 40

    // Common function for color determination
    function getValueColor(current) {
        if (current > 60)
            return Config.valueHigh;
        if (current > 40)
            return Config.valueModerate;
        return Config.valueLow;
    }

    // Reusable function to format current with color
    function formatCurrentWithColor(value, label) {
        const currentValue = Math.floor(value / 1000);
        return label + ": <font color=\"" + getValueColor(currentValue) + "\">" + currentValue + "</font> A";
    }

    // Function to create formatted motor current text
    function formatMotorText(motorId, current) {
        return "Motor " + motorId + " Current: <font color=\"" + getValueColor(current) + "\">" + current + "</font> A";
    }

    // Common text properties component
    component StyledText: Text {
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font {
            pixelSize: Config.motorArrayFontSize
            weight: Font.Medium
            family: Config.fontStyle
        }
        color: Config.fontColor
        textFormat: Text.RichText
    }

    // Left column with motor headers
    Column {
        id: motorHeadersColumn
        width: motorArrayHeader.width / 2
        anchors.left: motorArrayHeader.left
        anchors.top: motorArrayHeader.top
        anchors.bottom: motorArrayHeader.bottom

        StyledText {
            id: motor0Header
            width: motorHeadersColumn.width
            height: motorHeadersColumn.height / 2
            text: formatMotorText(0, motorDetails0.InverterPeakCurrent)
        }

        StyledText {
            id: motor1Header
            width: motorHeadersColumn.width
            height: motorHeadersColumn.height / 2
            text: formatMotorText(1, motorDetails1.InverterPeakCurrent)
        }
    }

    // Right section with array current information
    Item {
        id: arrayCurrentSection
        width: motorArrayHeader.width / 2
        anchors.left: motorHeadersColumn.right
        //anchors.rightMargin: 20
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        StyledText {
            id: totalArrayCurrentLabel
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 120
            text: "Array Current:"
        }

        Grid {
            id: arrayCurrentGrid
            anchors.left: totalArrayCurrentLabel.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            columns: 2
            rows: 2
            
            // Calculate the cell size based on the grid dimensions
            property real cellWidth: width / columns * 1.3
            property real cellHeight: height / rows

            // Create array current indicators using a more concise approach
            Repeater {
                model: [
                    { id: "0", current: mppt0.ArrayCurrent },
                    { id: "1", current: mppt1.ArrayCurrent },
                    { id: "2", current: mppt2.ArrayCurrent },
                    { id: "3", current: mppt3.ArrayCurrent }
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