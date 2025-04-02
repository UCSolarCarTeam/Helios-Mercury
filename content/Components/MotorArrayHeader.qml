import QtQuick
import QtQuick.Controls
import Mercury

Item {
    id: motorArrayHeader
    width: 440
    height: 40

    // Function Changes the Color on the current value
    function getValueColor(current) {
        if (current > 60)
            return Config.valueHigh;
        if (current > 40)
            return Config.valueModerate;
        return Config.valueLow;
    }

    //  Function Formats the current value with color in the correct unit
    function formatCurrentWithColor(value, label) {
        const currentValue = Math.floor(value / 1000);
        return label + ": <font color=\"" + getValueColor(currentValue) + "\">" + currentValue + "</font> A";
    }

    Text {
        id: motor0
        anchors.left: parent.left
        anchors.top: parent.top
        width: 120
        height: 16
        font.pixelSize: Config.fontSize
        color: Config.fontColor
        text: "Motor 0 Current: <font color=\"" + getValueColor(motorDetails0.InverterPeakCurrent) + "\">" + motorDetails0.InverterPeakCurrent + "</font> A"
        textFormat: Text.RichText
    }

    Text {
        id: motor1
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width: 120
        height: 16
        font.pixelSize: Config.fontSize
        color: Config.fontColor
        text: "Motor 1 Current: <font color=\"" + getValueColor(motorDetails1.InverterPeakCurrent) + "\">" + motorDetails1.InverterPeakCurrent + "</font> A"
        textFormat: Text.RichText
    }

    Row {
        id: arrayCurrentRow
        x: 182
        width: 255
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        Text {
            id: totalArrayCurrentLabel
            width: 120
            height: 16
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 120
            text: "Array Current:"
            font.pixelSize: Config.fontSize
            color: Config.fontColor
        }

        Grid {
            id: arrayCurrentGrid
            columns: 2
            rows: 2
            spacing: 10

            Text {
                id: totalArrayCurrent0s
                width: 90
                height: 16
                font.pixelSize: Config.fontSize
                color: Config.fontColor
                textFormat: Text.RichText
                text: formatCurrentWithColor(mppt0.ArrayCurrent, "0")
            }

            Text {
                id: totalArrayCurrent1
                width: 90
                height: 16
                font.pixelSize: Config.fontSize
                color: Config.fontColor
                text: formatCurrentWithColor(mppt1.ArrayCurrent, "1")
                textFormat: Text.RichText
            }

            Text {
                id: totalArrayCurrent2
                width: 90
                height: 16
                font.pixelSize: Config.fontSize
                color: Config.fontColor
                text: formatCurrentWithColor(mppt2.ArrayCurrent, "2")
                textFormat: Text.RichText
            }

            Text {
                id: totalArrayCurrent3
                width: 90
                height: 16
                font.pixelSize: Config.fontSize
                color: Config.fontColor
                text: formatCurrentWithColor(mppt3.ArrayCurrent, "3")
                textFormat: Text.RichText
            }
        }
    }
}
