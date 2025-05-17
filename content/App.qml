// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import Mercury

Window {
    minimumWidth: Config.windowWidth
    minimumHeight: Config.windowHeight
    maximumWidth: Config.windowWidth
    maximumHeight: Config.windowHeight

    visible: true
    title: "Mercury"

    property bool rawMode: Qt.application.arguments.indexOf("-raw") !== -1
    property int clusterNum: 0
    property var clusters: [
        "Clusters/RaceCluster.qml",
        "Clusters/BatteryDebugCluster.qml",
        "Clusters/MotorDebugCluster.qml",
        "Clusters/DriverControlsDebugCluster.qml",
        "Clusters/MpptMbmsDebugCluster.qml",
        "Clusters/TelemetryDebugCluster.qml",
        "Clusters/Motor0ErrorWarningDebugCluster.qml",
        "Clusters/Motor1ErrorWarningDebugCluster.qml"
    ]

    Loader {
        id: dashLoader
        anchors.fill: parent
        source: rawMode ? "Clusters/Screen01.ui.qml" : clusters[clusterNum]

        // When the Loader is completed, set up the connection.
        Component.onCompleted: {
            if (!rawMode) {
                b3.onRaceModeChanged.connect(function() {
                    // Increment the screen counter
                    if (b3.RaceMode) {
                        clusterNum = (clusterNum + 1) % clusters.length;
                    }
                });
            }
        }
    }

    // Screen Background to black
    Rectangle {
        anchors.fill: parent
        color: "black"
        z: -6969
    }
}
