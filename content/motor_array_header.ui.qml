import QtQuick

Rectangle {
    id: frame_1
    width: 1062
    height: 108
    color: "transparent"
    property alias motor_right_currentText: motor_right_current.text
    property alias total_arrays_currentText: total_arrays_current.text
    property alias motor_left_currentText: motor_left_current.text

    Text {
        id: motor_right_current
        color: "#a2180f"
        text: qsTr("Motor R Current: 100 A")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.rightMargin: 477
        font.weight: Font.Normal
        font.family: "Jost"
        anchors.bottomMargin: 50
    }

    Text {
        id: motor_left_current
        color: "#a2180f"
        text: qsTr("Motor L Current: 100 A")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.rightMargin: 477
        font.weight: Font.Normal
        font.family: "Jost"
        anchors.topMargin: 50
    }

    Text {
        id: total_arrays_current
        color: "#a2180f"
        text: qsTr("Total Arrays Current: 100 A")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
        anchors.rightMargin: -1
        font.weight: Font.Normal
        anchors.leftMargin: 478
        font.family: "Jost"
        anchors.bottomMargin: 21
        anchors.topMargin: 29
    }
}

/*##^##
Designer {
    D{i:0;uuid:"1daeb70c-049c-50c9-aec6-0203f1269e1e"}D{i:1;uuid:"4d77b6ee-b786-50ce-872f-e570e0c665a3"}
D{i:2;uuid:"1accc5b1-bd34-50cb-b912-239b38b33728"}D{i:3;uuid:"1716d487-9ce6-5d24-8890-1e0c2aafaff9"}
}
##^##*/

