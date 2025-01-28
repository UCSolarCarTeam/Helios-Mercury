// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import Mercury

Window {
    width: 1920
    height: 550

    visible: true
    title: "Mercury"

    property bool rawMode: Qt.application.arguments.indexOf("-raw") !== -1

    Loader {
        id: dashLoader
        anchors.fill: parent
        source: rawMode ? "Clusters/Screen01.ui.qml" : (b3.RaceMode ? "Clusters/RaceCluster.qml" : "Clusters/DebugCluster.qml")
    }

    // Screen Background to black
    Rectangle {
        anchors.fill: parent
        color: "black"
        z: -6969
    }
}
