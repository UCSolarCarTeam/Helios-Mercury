# Interface Systems Projects Overview

Interface Systems works on several parts of the solar car software stack. Some recruits will work mainly on the Mercury dashboard, while others may be assigned to more specialized projects involving CAN, telemetry, networking, hardware integration, or telemetry serialization.

You will not necessarily work with every part of the stack at once. Depending on the project your team lead assigns you, you may work across several technologies or focus mainly on two or three.

## Dashboard / Infotainment System

The main Interface Systems project is the development and maintenance of the vehicle's dashboard and infotainment system.

The Mercury dashboard receives data from the vehicle's embedded systems over CAN, processes that data through the C++ backend, and displays useful information to the driver through the Qt/QML interface.

The dashboard presents information such as:

- Battery voltage and battery system status
- Vehicle speed and motor RPM
- System temperatures
- Vehicle faults and warnings
- Network and telemetry connection status
- Additional diagnostic and performance data

Work on Mercury can involve:

- QML user interface development
- C++ backend development
- CAN signal integration
- Packet parsing and processing
- Debugging and testing
- Raspberry Pi and Linux development

Most Interface Systems recruits will work with Mercury in some form.

## CAN Integration and Testing

A major part of Interface Systems is connecting the software side of the car to the embedded systems developed by other teams.

Vehicle systems transmit data over the CAN bus using CAN IDs and payloads. Interface Systems is responsible for making sure Mercury can correctly receive, interpret, and use this data.

Work in this area can involve:

- Adding support for new CAN messages
- Updating C++ packet classes
- Testing CAN signals
- Debugging incorrect or missing data
- Simulating CAN traffic using `vcan0`
- Testing with physical CAN adapters and vehicle hardware
- Working with other teams when CAN definitions or signals change

This is one of the main ways Interface Systems works with the rest of the solar car software and electrical systems.

## Telemetry Integration

Mercury also sends vehicle data into the telemetry pipeline so the car can be monitored remotely.

The current system uses **JSON telemetry packets** and **MQTT** to transmit data toward the telemetry infrastructure and AWS services.

Work in this area can involve:

- Building and updating telemetry packets
- Adding new vehicle signals to telemetry
- Debugging MQTT communication
- Maintaining telemetry pathways through AWS
- Working with the Telemetry team when new data needs to appear remotely
- Testing the full path from the car to cloud services

## Telemetry Serialization Migration: JSON → Protocol Buffers

Mercury currently uses **JSON** for telemetry, but Interface Systems is actively working on migrating the telemetry pipeline to **Protocol Buffers (Protobuf)**.

JSON is easy to read and debug, but it is relatively large and inefficient for high-frequency vehicle data. As the number of telemetry signals grows, message size, processing overhead, and data usage become more important.

Protobuf uses a compact binary format defined through `.proto` schemas. This allows telemetry messages to be smaller and more efficient to serialize and transmit.

Work on this project can involve:

- Designing and updating `.proto` schemas
- Generating serialization code
- Integrating Protobuf with the existing C++ telemetry pipeline
- Comparing JSON and Protobuf message sizes
- Updating packet handling and transmission logic
- Testing compatibility with the telemetry infrastructure

For now, recruits should understand that:

**Current telemetry format:** JSON

**Active migration project:** Protocol Buffers

## RFID Identification System

The RFID project connects an RFID reader to the Raspberry Pi running the dashboard software.

When an RFID card is scanned, the reader outputs a digital signal. This signal is captured by the Raspberry Pi using GPIO interrupts. A Python service reads the incoming bitstream, reconstructs the RFID tag ID, and forwards that information to the dashboard software.

The dashboard can then associate the scanned tag with a known user or role.

Work on this project can involve:

- Raspberry Pi GPIO
- Python
- Linux
- Hardware/software integration
- RFID signal processing
- Dashboard integration

## Raspberry Pi and Vehicle Integration

Mercury ultimately runs on a Raspberry Pi inside the solar car.

Because of this, Interface Systems also works with:

- Alpine Linux
- SSH
- Networking
- CAN adapters
- Raspberry Pi hardware
- RFID hardware
- Deployment and debugging on the actual vehicle

Testing something locally is only part of the process. Features may also need to be verified inside the Linux VM, on the Raspberry Pi, and eventually with the real vehicle hardware.

## General Theme

Most Interface Systems projects follow the same general idea:

**Take low-level vehicle data and turn it into something useful for people or other software systems.**

For example:

```text
CAN Signal
↓
C++ Packet
↓
QML Dashboard Element

or:


Vehicle Data
↓
JSON Telemetry Packet
↓
MQTT
↓
AWS / Telemetry

The exact project you work on may change, but understanding how data moves through the car's software stack is the main idea behind Interface Systems.