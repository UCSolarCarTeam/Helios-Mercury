import QtQuick
import QtQuick.Controls
import Mercury

Item {
    id: motorArrayHeader
    width: 470
    height: 40

    function getValueColor(current) {
        if (current > 60)
            return Config.valueHigh;
        if (current > 40)
            return Config.valueModerate;
        return Config.valueLow;
    }

    function formatCurrentWithColor(value, label) {
        const currentValue = Math.floor(value / 1000);
        return label + ": <font color=\"" + getValueColor(currentValue) + "\">" + currentValue + "</font> A";
    }

    function formatMotorText(motorId, current) {
        return "Motor " + motorId + " Current: <font color=\"" + getValueColor(current) + "\">" + current + "</font> A";
    }

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
        width: motorArrayHeader.width / 2
        anchors {
            left: motorArrayHeader.left
            top: motorArrayHeader.top
            bottom: motorArrayHeader.bottom
            leftMargin: 20
        }

        StyledText {
            id: motor0Header
            width: motorHeadersColumn.width
            height: motorHeadersColumn.height / 2
            text: formatMotorText(0, motorDetails0.BusCurrent)
        }

        StyledText {
            id: motor1Header
            width: motorHeadersColumn.width
            height: motorHeadersColumn.height / 2
            text: formatMotorText(1, motorDetails1.BusCurrent)
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
            columns: 2
            rows: 2
            anchors {
                left: totalArrayCurrentLabel.right
                right: parent.right
                top: parent.top
                bottom: parent.bottom
            }
            
            property real cellWidth: width / columns * 1.3
            property real cellHeight: height / rows

            Repeater {
                model: [
                    { id: "0, 0", current: mppt.Mppt0Ch0ArrayCurrent },
                    { id: "0, 1", current: mppt.Mppt0Ch1ArrayCurrent },
                    { id: "1, 0", current: mppt.Mppt1Ch0ArrayCurrent },
                    { id: "1, 1", current: mppt.Mppt1Ch1ArrayCurrent }
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
