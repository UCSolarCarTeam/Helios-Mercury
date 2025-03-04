cmake_minimum_required(VERSION 3.16)

project(ReceiverTests LANGUAGES CXX)

enable_testing()

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Mqtt SerialPort Test)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Mqtt SerialPort Test)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(ReceiverTests ReceiverTest.cpp)
add_test(NAME ReceiverTest COMMAND ReceiverTest)

target_link_libraries(ReceiverTests PRIVATE
    Qt${QT_VERSION_MAJOR}::Test
    Qt6::SerialPort
    Qt6::Mqtt
    MercuryLib
)

