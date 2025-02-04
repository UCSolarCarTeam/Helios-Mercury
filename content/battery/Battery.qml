import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Studio.Components 1.0
import QtQuick.Shapes 1.0

Rectangle {
    id: battery
    width: 152
    height: 200 // Increased height for better visibility of the slider
    color: "transparent"
    property alias batteryPercentageTextText: batteryPercentageText.text
    property real batteryPercentage: 1 // Initially set to 100%

    RowLayout {
        id: batteryLayout
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 0

        Item {
            id: batteryContainer
            width: 70
            height: 70
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            clip: true // Ensures green fill does not overflow

            // Green Fill inside the battery (SvgPathItem, fills bottom to top)
            SvgPathItem {
                id: batteryFill
                width: 58
                height: (batteryVector.height) * battery.batteryPercentage
                strokeStyle: 1
                joinStyle: 0
                strokeColor: "transparent" // Remove red outline
                fillColor: "#00FF00" // Green fill color
                antialiasing: true
                anchors.bottom: batteryVector.bottom // Fill starts from the bottom
                anchors.horizontalCenter: batteryVector.horizontalCenter
                path: "M 31.120833555857338 5.833333206176758 L 26.25 5.833333206176758 L 26.25 0 L 8.75 0 L 8.75 5.833333206176758 L 3.879166444142659 5.833333206176758 C 2.8503474717338877 5.833333206176758 1.8636660277843473 6.24202948116465 1.1361811558405557 6.96951433725053 C 0.40869628389676405 7.69699919333641 0 8.683680615778002 0 9.7124995657603 L 0 54.454165702184035 C 0 56.58333237806955 1.7499997218449908 58.33333206176758 3.879166444142659 58.33333206176758 L 31.120833555857338 58.33333206176758 C 32.14965252826611 58.33333206176757 33.13633536299069 57.9246371775547 33.86382023493449 57.19715232146882 C 34.59130510687828 56.46966746538294 35 55.48298465216633 35 54.454165702184035 L 35 9.7124995657603 C 35 7.583332889874782 33.25000027815501 5.833333206176758 31.120833555857338 5.833333206176758 Z"
                z: -1
            }

            // Battery Outline
            SvgPathItem {
                id: batteryVector
                width: 58
                height: 58
                anchors.centerIn: parent
                strokeStyle: 1
                joinStyle: 0
                strokeColor: "#000000" // Black outline
                fillColor: "transparent" // Ensure only the outline is visible
                antialiasing: true
                path: "M 31.120833555857338 5.833333206176758 L 26.25 5.833333206176758 L 26.25 0 L 8.75 0 L 8.75 5.833333206176758 L 3.879166444142659 5.833333206176758 C 2.8503474717338877 5.833333206176758 1.8636660277843473 6.24202948116465 1.1361811558405557 6.96951433725053 C 0.40869628389676405 7.69699919333641 0 8.683680615778002 0 9.7124995657603 L 0 54.454165702184035 C 0 56.58333237806955 1.7499997218449908 58.33333206176758 3.879166444142659 58.33333206176758 L 31.120833555857338 58.33333206176758 C 32.14965252826611 58.33333206176757 33.13633536299069 57.9246371775547 33.86382023493449 57.19715232146882 C 34.59130510687828 56.46966746538294 35 55.48298465216633 35 54.454165702184035 L 35 9.7124995657603 C 35 7.583332889874782 33.25000027815501 5.833333206176758 31.120833555857338 5.833333206176758 Z"
                z: 2
            }
        }

        // Battery Percentage Text
        Text {
            id: batteryPercentageText
            width: 83
            height: 26
            color: "#898989"
            text: qsTr(Math.round(battery.batteryPercentage * 100) + "%")
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Medium
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.family: "SF Pro"
        }
    }

    // Slider to control the battery percentage
    Slider {
        id: batterySlider
        width: parent.width - 40
        anchors.top: batteryLayout.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        from: 0
        to: 1
        stepSize: 0.01
        value: battery.batteryPercentage // Bind slider value to battery percentage

        onValueChanged: {
            battery.batteryPercentage = batterySlider.value;
        }
    }

    // Battery Percentage Animation (optional)
    NumberAnimation on batteryPercentage {
        duration: 100 // Smooth transition when slider is adjusted
    }
}
