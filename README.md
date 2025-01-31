# Helios-Mercury

## Setup Guide

### Required Libraries
- Qt Core
- Qt Gui
- Qt Qml
- Qt Quick
- Qt Serial Port: Used to receive data from Sentinel
- Qt MQTT: Used to transmit JSON data to the Telemetry site
    - Both of the above libraries can be installed through Maintenance Tool if they were not originally installed with Qt
- Socat: Used to set up virtual serial ports
    - In a terminal, run the following command:
        - sudo apt install socat (for Linux)
        - brew install socat (for Mac)

#### Qt Versions
- Currently, we are using version 6.7.2

### Building From Terminal
In a terminal, navigate to the Helios-Mercury repository. Run the following commands:

#### Step 1
`mkdir build`

`cd build`

#### Step 2
For Linux:

`path/to/Qt/6.7.2/gcc_64/bin/qt-cmake ..`

For Mac:

`path/to/Qt/6.7.2/macos/bin/qt-cmake ..`

#### Step 3
`make`

### Before Running
We need to setup two virtual serial port using the socat command. These serial ports connect 
Mercury with Sentinel. In a terminal, run the following command:
- socat -d -d pty,raw,echo=0 pty,raw,echo=0

The terminal will output two virtual serial ports. Navigate to `Helios-Mercury/build` and open
the file named `config.ini` in a text editor. Under SerialPort, modify portname to one of the
serial ports from the terminal. Note: It cannot be the same port used for Sentinel. Mercury is
now ready to build and run.

### Running the Application
`./Helios-Mercury`


## Architecture Diagram
![Diagram](MercuryArchitectureDiagram.png)