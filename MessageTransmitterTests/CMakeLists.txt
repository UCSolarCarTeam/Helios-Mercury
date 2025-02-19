cmake_minimum_required(VERSION 3.16)

project(MessageTransmitterTests LANGUAGES CXX)

enable_testing()

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Mqtt Test)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Mqtt Test)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(MessageTransmitterTests MessageTransmitterTest.cpp)
add_test(NAME MessageTransmitterTest COMMAND MessageTransmitterTest)

target_link_libraries(MessageTransmitterTests
    PRIVATE Qt${QT_VERSION_MAJOR}::Test
    Qt6::Mqtt
    MercuryLib
)

