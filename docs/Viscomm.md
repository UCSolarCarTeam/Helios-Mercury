# VisComm Dashboard Overview

Hi, I'm Mahmood, the 2026 VisComm Team Lead, and I work primarily on the dashboard side of the solar car software system.

This document is meant to give new VisComm recruits a clear overview of how the dashboard system and telemetry pipeline actually works.

When I first joined the team, I knew nothing about the frameworks and languages we used. I wish we had a central document explaining what we work on and how the system is structured. That is what this document aims to provide.

The goal is not for you to understand every technical detail immediately but rather to help you build a mental model of the system architecture, which will make the codebase much easier to understand later, and hopefully make you all big jits when it comes to C++/QML work.

# What the Dashboard / VisComm Team Does

The VisComm (Visual Communication) team is responsible for software systems that:
• Display real-time vehicle data to the driver

• Collect telemetry data from the car

• Transmit telemetry data to cloud servers

• Provide tools to monitor the car remotely

The VisComm team mainly works on 2 systems:

Driver Dashboard (The Important One)

Telemetry Communication Pipeline (The Nice One)

These systems allow both the driver and the race team to monitor the car's performance in real time.

# High-Level System Overview

The entire pipeline looks like this:

Car Electronics
     →
CAN Bus
     →
Mercury Dashboard Software
     →
Packet System
     →
Driver Dashboard UI
     →
Telemetry JSON Packet
     →
MQTT Messaging
     →
AWS Cloud Server
     →
Socket.io
     →
Telemetry Website

# The Car Communication System (CAN)

Inside the solar car there are many small computers called ECUs (Electronic Control Units).

Examples include:

• Battery Management System

• Motor Controllers

• Solar MPPT Controllers

• B3 Driver Input Board

• Contactor Controllers

• Sensor Systems

All of these systems communicate through a vehicle network called CAN.

## CAN (Controller Area Network)

CAN is a lightweight communication system used in vehicles where multiple electronic systems send messages over a shared network.

Each message on the network is called a CAN frame.

A CAN frame looks like:
CAN ID + Payload
Where:
• CAN ID identifies the type of message
• Payload contains the data (usually 8 bytes)
Example CAN messages:

0x610 ↓ Driver controls

0x300 ↓ Battery information

0x600 ↓ MPPT solar data

So in practice, the entire car is constantly sending numerical messages across the CAN network.

