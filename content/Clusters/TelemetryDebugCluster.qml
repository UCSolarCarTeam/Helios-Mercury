import QtQuick 6.2
import QtQuick.Layouts
import QtQuick.Controls
import "../Components"
import Mercury

Item {
    id: telemetryDebugCluster
    width: 1920
    height: 550

    function numberToMonth(monthNumber) {
        switch (monthNumber) {
            case 1:
                return "January";
            case 2:
                return "February";
            case 3:
                return "March";
            case 4:
                return "April";
            case 5:
                return "May";
            case 6:
                return "June";
            case 7:
                return "July";
            case 8:
                return "August";
            case 9:
                return "September";
            case 10:
                return "October";
            case 11:
                return "November";
            case 12:
                return "December";
            default:
                return "Invalid Month Number";
        }
    }

    function formatTime12Hour(hour, minute, second) {
        let period = "AM";
        let formattedHour = parseInt(hour);

        if (formattedHour === 0) {
            formattedHour = 12;
        } else if (formattedHour === 12) {
            period = "PM";
        } else if (formattedHour > 12) {
            formattedHour -= 12;
            period = "PM";
        }

        const formattedMinute = (parseInt(minute) < 10 ? "0" : "") + minute;
        const formattedSecond = (parseInt(second) < 10 ? "0" : "") + second;

        return formattedHour + ":" + formattedMinute + ":" + formattedSecond + " " + period;
    }

    Image {
        id: raceClusterFrameBackground
        x: 1
        y: 2
        source: "../Images/RaceClusterFrameBackground.png"
    }

    Image {
        id: raceClusterFrameOutline
        anchors.fill: parent
        source: "../Images/RaceClusterFrameOutline.png"
    }

    Text {
        id: telemetryLabel
        color: Config.fontColor
        font.family: Config.fontStyle
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 13
        }
        text: "Telemetry"
        font.pixelSize: Config.debugHeaderFontSize
    }

    GridLayout {
        id: gaugeGrid
        width: 620
        height: 380
        columns: 3
        rowSpacing: 40
        columnSpacing: 20
        anchors {
            verticalCenter: telemetryDebugCluster.verticalCenter
            right: telemetryDebugCluster.right 
            rightMargin: 300
        }

        GaugeTemplate {
            id: telemetryMpuAccelerationXGauge
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "m/s\u00B2"
            gaugeTitle: "MPU Acceleration X"
            value: telemetry.MpuAccelerationX
            icon: "AccelerationIcon.png"
            iconWidth: 25
            iconHeight: 25
        }

        GaugeTemplate {
            id: telemetryMpuAccelerationYGauge
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "m/s\u00B2"
            gaugeTitle: "MPU Acceleration Y"
            value: telemetry.MpuAccelerationY
            icon: "AccelerationIcon.png"
            iconWidth: 25
            iconHeight: 25
        }

        GaugeTemplate {
            id: telemetryMpuAccelerationZGauge
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "m/s\u00B2"
            gaugeTitle: "MPU Acceleration Z"
            value: telemetry.MpuAccelerationZ
            icon: "AccelerationIcon.png"
            iconWidth: 25
            iconHeight: 25
        }

        GaugeTemplate {
            id: telemetryMpuRotationXGauge
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "°/s"
            gaugeTitle: "MPU Rotation X"
            value: telemetry.MpuRotationX
            icon: "RotationIcon.png"
            iconWidth: 25
            iconHeight: 25
        }

        GaugeTemplate {
            id: telemetryMpuRotationYGauge
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "°/s" 
            gaugeTitle: "MPU Rotation Y"
            value: telemetry.MpuRotationY
            icon: "RotationIcon.png"
            iconWidth: 25
            iconHeight: 25
        }

        GaugeTemplate {
            id: telemetryMpuRotationZGauge
            gaugeSize: Config.smallGaugeSize
            minValue: 0
            maxValue: 100
            units: "°/s" 
            gaugeTitle: "MPU Rotation Z"
            value: telemetry.MpuRotationZ
            icon: "RotationIcon.png"
            iconWidth: 25
            iconHeight: 25
        }
    }

    GaugeTemplate {
        id: telemetryMpuTemperatureGauge
        anchors {
            verticalCenter: telemetryDebugCluster.verticalCenter
            left: gaugeGrid.right
            leftMargin: 40
        }
        gaugeSize: Config.smallGaugeSize
        minValue: 0
        maxValue: 100
        units: "°" 
        gaugeTitle: "MPU Temperature"
        value: telemetry.MpuTemperature
        icon: "ThermometerIcon.png"
        iconWidth: 20
        iconHeight: 25
    }

    ColumnLayout {
        id: flagLayout
        width: implicitWidth
        anchors {
            verticalCenter: telemetryDebugCluster.verticalCenter
            horizontalCenter: telemetryDebugCluster.horizontalCenter
            horizontalCenterOffset: -270
        }
        Layout.alignment: Qt.AlignHCenter
        spacing: 100

        Repeater {
            model: [
                { label: "GPS Validity Flags: " + telemetry.GpsValidityFlags },
                { label: "GPS Fix Status Flags: " + telemetry.GpsFixStatusFlags },
                { label: "GPS Additional Flags: " + telemetry.GpsAdditionalFlags }
            ]

            delegate: Item {
                id: flagContainer
                Text {
                    id: flagText
                    width: implicitWidth
                    color: Config.fontColor
                    text: modelData.label
                    font.pixelSize: Config.telemetryFlagLabelFontSize
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Medium
                    font.family: Config.fontStyle
                    anchors {
                        verticalCenter: flagContainer.verticalCenter
                    }
                }

                DashIcon {
                    id: flagIcon
                    width: 30
                    height: 30
                    imageSource: "../Images/DirectionIcon.png"
                    iconMaskColor: Config.fontColor
                    anchors {
                        right: flagText.left
                        rightMargin: 10
                        verticalCenter: flagContainer.verticalCenter
                    }
                }
            }
        }
    }

    Text {
        id: telemetryDate
        width: implicitWidth
        color: Config.fontColor
        text: telemetry.GpsDay + " " + numberToMonth(telemetry.GpsMonth) + ", " + telemetry.GpsYear
        font.pixelSize: Config.debugHeaderFontSize
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.weight: Font.Medium
        font.family: Config.fontStyle
        anchors {
            horizontalCenter: parent.horizontalCenter
            horizontalCenterOffset: -160
            bottom: parent.bottom
            bottomMargin: 13
        }
    }

    Text {
        id: telemetryTime
        width: implicitWidth
        color: Config.fontColor
        text: formatTime12Hour(telemetry.GpsHour, telemetry.GpsMinute, telemetry.GpsSecond)
        font.pixelSize: Config.debugHeaderFontSize
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.weight: Font.Medium
        font.family: Config.fontStyle
        anchors {
            horizontalCenter: parent.horizontalCenter
            horizontalCenterOffset: 160
            bottom: parent.bottom
            bottomMargin: 13
        }
    }
}
