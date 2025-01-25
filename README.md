# Helios-Mercury

### Setup Guide

#### Required Libraries
- Qt Serial Port: Used to receive data from Sentinel
- Qt MQTT: Used to transmit JSON data to the Telemetry site
    - Both can be installed through Maintenance Tool if it was not originally installed with Qt
- Socat: Used to set up virtual serial ports
    - In a terminal, run the following command:
        - sudo apt install socat (for Linux)
        - brew install socat (for Mac)

#### Qt Versions
- Currently, we are using version 6.7.2


### Build Guide
Before building the application, we need to setup two virtual serial port using the socat command.
These serial ports connect Mercury with Sentinel. In a terminal, run the following command:
- socat -d -d pty,raw,echo=0 pty,raw,echo=0

The terminal will output two virtual serial ports. Navigate Helios-Mercury/build/{Qt build folder}.
If that path does not exist, make sure to build Mercury. This can be done easily in Qt Creator. 
In the deepest build folder, there should be a file named config.ini. Open this in a text editor.
Under SerialPort, modify portname to one of the serial ports from the terminal. Note: It cannot be
the same port used for Sentinel. Mercury is now ready to build and run.
