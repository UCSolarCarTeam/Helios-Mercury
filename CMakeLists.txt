cmake_minimum_required(VERSION 3.21.1)

option(LINK_INSIGHT "Link Qt Insight Tracker library" ON)
option(BUILD_QDS_COMPONENTS "Build design studio components" ON)

project(Helios-Mercury LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

configure_file(${CMAKE_SOURCE_DIR}/config.ini.example ${CMAKE_BINARY_DIR}/config.ini COPYONLY)

find_package(Qt6 6.2 REQUIRED COMPONENTS Core Gui Qml Quick Mqtt SerialPort ShaderTools)

if (Qt6_VERSION VERSION_GREATER_EQUAL 6.3)
    qt_policy(SET QTP0001 NEW)
    qt_standard_project_setup()
endif()

# Pi Dependencies
if (CMAKE_SYSTEM_NAME STREQUAL "Linux" AND CMAKE_SYSTEM_PROCESSOR STREQUAL "aarch64")
    add_definitions(-DRUNNING_ON_PI)
    list(APPEND ADDITIONAL_SOURCES
        src/Receivers/GpioReceiver.h src/Receivers/GpioReceiver.cpp
    )
    set(PIGPIO_LIB pigpio)
else()
    set(PIGPIO_LIB "")
endif()

qt_add_executable(Helios-Mercury src/main.cpp
    src/Receivers/SerialReceiver.cpp src/Receivers/SerialReceiver.h
    src/StreamProcessor/StreamProcessor.cpp src/StreamProcessor/StreamProcessor.h
    src/PacketFactory/IPacket.h
    src/PacketFactory/PacketFactory.h src/PacketFactory/PacketFactory.cpp
    src/PacketFactory/Packets/B3Packet.h src/PacketFactory/Packets/B3Packet.cpp
    src/PacketFactory/Packets/BatteryFaultsPacket.h src/PacketFactory/Packets/BatteryFaultsPacket.cpp
    src/PacketFactory/Packets/BatteryPacket.h src/PacketFactory/Packets/BatteryPacket.cpp
    src/PacketFactory/Packets/KeyMotorPacket.h src/PacketFactory/Packets/KeyMotorPacket.cpp
    src/PacketFactory/Packets/MbmsPacket.h src/PacketFactory/Packets/MbmsPacket.cpp
    src/PacketFactory/Packets/MotorDetailsPacket.h src/PacketFactory/Packets/MotorDetailsPacket.cpp
    src/PacketFactory/Packets/MpptPacket.h src/PacketFactory/Packets/MpptPacket.cpp
    src/PacketFactory/Packets/ProximitySensorsPacket.h src/PacketFactory/Packets/ProximitySensorsPacket.cpp
    src/PacketFactory/Packets/TelemetryPacket.h src/PacketFactory/Packets/TelemetryPacket.cpp
    src/MessageAggregator/MessageAggregator.h src/MessageAggregator/MessageAggregator.cpp
    src/MessageTransmitter/MessageTransmitter.h src/MessageTransmitter/MessageTransmitter.cpp
    src/Config/ConfigManager.h src/Config/ConfigManager.cpp
    src/Config/JsonDefinitions.h
    src/Config/PacketDefinitions.h
    src/Mercury.h src/Mercury.cpp
    src/Config/PropertyDefinitions.h
    src/Receivers/TelemetryReceiver.h src/Receivers/TelemetryReceiver.cpp
    src/Config/Logger.h src/Config/Logger.cpp
    src/PacketFactory/Packets/PiPacket.h src/PacketFactory/Packets/PiPacket.cpp
    ${ADDITIONAL_SOURCES}
)

qt_add_resources(Helios-Mercury "configuration"
    PREFIX "/"
    FILES
        qtquickcontrols2.conf
)

target_link_libraries(Helios-Mercury PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
    Qt6::Mqtt
    Qt6::SerialPort
    Qt6::ShaderTools
    ${PIGPIO_LIB}
)

set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)
set(QML_IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY}
    CACHE STRING "Import paths for Qt Creator's code model"
    FORCE
)

if (BUILD_QDS_COMPONENTS)
    include(${CMAKE_CURRENT_SOURCE_DIR}/qmlcomponents)
endif()

include(${CMAKE_CURRENT_SOURCE_DIR}/qmlmodules)

if (LINK_INSIGHT)
    include(${CMAKE_CURRENT_SOURCE_DIR}/insight)
endif ()

include(GNUInstallDirs)
install(TARGETS Helios-Mercury
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

# make IDEs aware of the QML import path
set(QML_IMPORT_PATH ${PROJECT_BINARY_DIR}/qml CACHE PATH
    "Path to the custom QML components defined by the project")

qt6_add_shaders(Helios-Mercury "Helios-Mercury_shaders"
    PREFIX
        "/"
    FILES
        "content/Shaders/MovingColor.frag"
        "content/Shaders/ColorOverlay.frag"
)
