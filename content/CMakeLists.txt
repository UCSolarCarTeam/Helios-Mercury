### This file is automatically generated by Qt Design Studio.
### Do not change

qt_add_library(content STATIC)
qt6_add_qml_module(content
    URI "content"
    VERSION 1.0
    RESOURCE_PREFIX "/qt/qml"
    QML_FILES
        App.qml
        Clusters/RaceCluster.qml
        Clusters/DebugCluster.qml
        Clusters/Screen01.ui.qml
        Components/ArrowIndicator.qml
        Components/DashIcon.qml
        Components/CameraView.qml
        Components/Rnd.qml
        Components/RaceClusterIcons.qml
        Config/Config.qml
	Components/BatteryIcon.qml
        Components/ThreeQuarterGauge.qml
        Components/TemperatureGauge.qml
        Util/GaugeAnimation.qml
        Components/GaugeTemplate.qml
    RESOURCES
        fonts/fonts.txt
        Images/RaceClusterFrameBackground.png
        Images/RaceClusterFrameOutline.png
        Images/Arrow.png
        Images/Headlights.png
        Images/DaytimeRunningLights.png
	Images/Battery.png
        Images/ParkingBrake.png
        Images/Hot.png
        Images/Cool.png
        Images/TempBar.png
        Images/ThermometerIcon.png
        Images/AccelerationIcon.png
        Images/BoltIcon.png
)
