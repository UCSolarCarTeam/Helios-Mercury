# Interface Systems Overview

Welcome to Interface Systems. This page gives new recruits a high-level picture of what our team does, what we work with, how Mercury fits into the solar car, and how our software connects with the work done by other teams.

You do not need to understand every part of the system on day one. The goal is to give you a mental model of how data moves through the car and where Interface Systems fits into that flow. Once that makes sense, the C++, QML, CAN, Linux, and telemetry work becomes much easier to follow.

## Quick Jump

- [What Interface Systems Does](#what-interface-systems-does)
- [What We Work With](#what-we-work-with)
- [How We Work With Other Teams](#how-we-work-with-other-teams)
- [High-Level System Architecture](#high-level-system-architecture)
- [CAN and Vehicle Data](#can-and-vehicle-data)
- [Mercury Dashboard Software](#mercury-dashboard-software)
- [Dashboard UI and QML](#dashboard-ui-and-qml)
- [Telemetry Pipeline](#telemetry-pipeline)
- [Other Interface Systems Projects](#other-interface-systems-projects)
- [How We Develop and Test](#how-we-develop-and-test)
- [What New Recruits Should Learn First](#what-new-recruits-should-learn-first)
- [Documentation](#documentation)

# What Interface Systems Does

Interface Systems sits between the car’s embedded systems and telemetry pipeline. We test CAN signals, handle C++ packets, build Qt/QML dashboard features, and maintain telemetry pathways through MQTT and AWS.

Our main jobs are to:

- Display real-time vehicle data to the driver
- Receive and interpret CAN messages from the car
- Convert raw machine-level data into useful software values
- Build and maintain the Mercury dashboard
- Send telemetry data from the car to remote monitoring systems
- Support hardware and software interfaces such as RFID and CAN adapters
- Debug communication problems between vehicle systems, the dashboard, and telemetry services

The two biggest systems we work on are:

1. **Mercury Driver Dashboard**
2. **Telemetry Communication Pipeline**

The general theme of Interface Systems is simple: take low-level information coming from the car and turn it into something useful, readable, and reliable for the driver and race team.

# What We Work With

Most Interface Systems work touches some combination of the following:

| Area | Technologies / Hardware |
|---|---|
| Dashboard backend | C++, Qt 6.8.4, CMake |
| Dashboard UI | QML, Qt Quick |
| Vehicle communication | CAN, SocketCAN, `can0`, `vcan0`, CAN adapters |
| Development | VS Code, Qt Creator, Git, GitHub |
| Linux testing | Ubuntu 24.04 VM, VirtualBox, GCC, Ninja, `can-utils` |
| Dashboard computer | Raspberry Pi, Alpine Linux |
| Telemetry | JSON, MQTT, AWS, Socket.io |
| Supporting scripts / hardware | Python, RFID reader, GPIO |

You won’t necessarily work with all of these technologies at once. Depending on the project your team lead assigns you, you may work with several of them or focus mainly on just two or three.

# How We Work With Other Teams

Interface Systems depends heavily on the rest of the solar car because most of the data we display originates somewhere else in the vehicle.

Other vehicle systems produce information such as:

- Battery voltage, current, temperatures, faults, and status
- Motor speed, motor state, and controller information
- MPPT and solar-array data
- Driver inputs from the B3 board
- Contactor and power-system state
- Sensor measurements and status information

Those systems transmit data over the car's CAN network. Interface Systems receives those messages, interprets the payloads, stores the values in Mercury's packet system, and decides how they should be displayed or forwarded through telemetry.

A typical cross-team change looks like this:

```text
Another team adds or changes a vehicle signal
                ↓
CAN ID / payload format is defined or updated
                ↓
Interface Systems updates CAN parsing
                ↓
Parsed value is exposed through Mercury packets
                ↓
QML displays the value to the driver
                ↓
Telemetry can forward the value for remote monitoring
                ↓
Both teams test the full path on the VM, Pi, or car
```

Because of this, Interface Systems often acts as the final software layer connecting embedded vehicle systems to the driver and race team.

# High-Level System Architecture

At a high level, vehicle information moves through the system like this:

```text
Car Electronics / ECUs
        ↓
      CAN Bus
        ↓
Mercury C++ Backend
        ↓
   Packet System
        ↓
   QML Dashboard
        ↓
      Driver
```

Some of the same packet data is also sent through the telemetry pipeline:

```text
Mercury Packet Data
        ↓
   JSON Telemetry
        ↓
       MQTT
        ↓
    AWS Server
        ↓
    Socket.io
        ↓
Telemetry Website
        ↓
    Race Team
```

So Mercury is not just a UI. It is one of the main integration points between the car's embedded systems, the driver display, and remote telemetry.

# CAN and Vehicle Data

The solar car contains multiple ECUs and embedded controllers. Examples include:

- Battery Management System
- Motor Controllers
- MPPT Controllers
- B3 Driver Input Board
- Contactor Controllers
- Sensor Systems

These devices communicate using **CAN**, or Controller Area Network.

A CAN frame can be thought of as:

```text
CAN ID + Payload
```

The **CAN ID** identifies the type of message, while the **payload** contains the actual data bytes.

Examples used in the car include IDs associated with driver controls, battery information, and MPPT data. Mercury continuously listens to the CAN interface and passes incoming frames to the appropriate parsing logic.

On the Raspberry Pi, Mercury normally communicates with the physical CAN interface:

```text
can0
```

Inside the Ubuntu development VM, we do not have the physical vehicle CAN bus, so we create a virtual CAN interface:

```text
vcan0
```

This lets us test CAN-related dashboard behaviour without needing the actual car.

For setup and testing instructions, see the [CAN Setup Guide](docs/CanSetupGuide.md).

# Mercury Dashboard Software

**Mercury** is the main dashboard application used by Interface Systems.

Mercury is responsible for:

- Receiving CAN frames
- Parsing raw CAN data
- Converting that data into structured packet values
- Providing those values to the QML interface
- Displaying vehicle information to the driver
- Building telemetry data for remote monitoring

Mercury is primarily built with:

```text
C++
Qt 6.8.4
QML / Qt Quick
CMake
Qt SerialBus
Qt MQTT
```

The backend handles communication, parsing, configuration, and application logic. The frontend uses QML to turn those values into gauges, indicators, warnings, status displays, and other driver-facing components.

# Dashboard UI and QML

The dashboard UI is built with **QML**, Qt's declarative user-interface language.

The QML layer reads values made available by Mercury and turns them into visual information. For example, the UI may use values similar to:

```text
batteryPacket.packVoltage
b3Packet.acceleration
mpptPacket.inputPower
```

When packet values change, the relevant dashboard components update.

This separation is important:

```text
CAN frame
   ↓
C++ parses the data
   ↓
Packet stores the useful value
   ↓
QML displays the value
```

Most dashboard tickets will involve one or more stages of this path.

# Telemetry Pipeline

Mercury also helps send vehicle information to systems outside the car.

The current telemetry path uses **JSON** data and **MQTT** messaging. At a high level:

```text
Vehicle data
    ↓
Mercury packets
    ↓
JSON telemetry packet
    ↓
MQTT
    ↓
AWS
    ↓
Socket.io
    ↓
Telemetry website
```

This allows people outside the vehicle to monitor important car information while the car is operating.

# Other Interface Systems Projects

Not every recruit will work only on the main dashboard. Interface Systems also works on supporting systems and hardware/software integrations.

Examples include:

### RFID Identification

The RFID system connects an RFID reader to the Raspberry Pi. A Python service reads the incoming GPIO signal, reconstructs the RFID tag ID, and makes that identifier available to the dashboard system.

### CAN Integration and Testing

We work with physical CAN adapters on the car and `vcan0` inside the development VM. This includes debugging CAN connectivity, validating messages, and making sure Mercury is listening on the correct interface.

### Telemetry and Networking

Interface Systems also works with the network path between Mercury, MQTT services, AWS, and the telemetry website. This can involve debugging missing data, network connections, or incorrect packet values.

See the [Projects Overview](docs/Projects.md) for more information about current and past Interface Systems projects.


# What New Recruits Should Learn First

You do not need to memorize the entire architecture immediately. Start by understanding these pieces in roughly this order:

1. What Interface Systems is responsible for
2. How CAN moves information around the car
3. How Mercury receives and parses CAN frames
4. How Mercury packet objects store useful values
5. How QML reads packet values and displays them
6. How to build and run Mercury locally
7. How to use the Ubuntu VM and `vcan0`
8. How the Git and VSC ticket workflow works
9. How Mercury runs on the Raspberry Pi
10. How telemetry leaves the car and reaches the monitoring website

Once those pieces connect, the codebase becomes much easier to navigate.

# Documentation

If you are a new recruit, start with the machine setup guide and work downward.

### Setup

- [Machine Setup Guide](docs/MachineSetupGuide.md) - Windows and Apple MacBook setup, VS Code, extensions, Qt 6.8.4, and cloning Mercury
- [VM Setup Guide](docs/VMSetupGuide.md) - VirtualBox, Ubuntu, Qt inside the VM, required packages, networking, and the VM Mercury clone
- [CAN Setup Guide](docs/CanSetupGuide.md) - `vcan0`, `can0`, `config.ini`, `candump`, `cansend`, and CAN troubleshooting

### Development Reference

- [Workflow Guide](docs/Workflow.md) - VSC branch workflow, commits, pushing, pull requests, and host-to-VM testing
- [Linux / Raspberry Pi Command Guide](docs/LinuxCommandGuide.md) - Ubuntu, Alpine Linux, SSH, networking, file transfer, package management, nano, vi, and common commands
- [Projects Overview](docs/Projects.md) - Interface Systems projects and areas recruits may work on

### Architecture
- [Mercury Architecture Diagram](MercuryArchitectureDiagram.png)
- [High-Level Overview Diagram](HighLevelOverview.png)

## Repository

```text
https://github.com/UCSolarCarTeam/Helios-Mercury.git
```

Main branch:

```text
master
```
