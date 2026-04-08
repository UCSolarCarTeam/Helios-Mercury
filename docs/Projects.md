# VisComm Projects Overview

Basically a overview of all the projects viscomm works on. Some new recruits may be placed on certain projects on this list while other get placed on the overall dashboard. All projects are fun tho dw.

## Dashboard / Infotainment System

The primary project within VisComm is the development and maintenance of the vehicle’s **dashboard and infotainment system**.  The system receives **CAN bus signals and telemetry packets** from the vehicle’s embedded systems and converts them into real time visual information for the driver.

The dashboard presents critical vehicle information including, but not limited to:

- Battery voltage and battery system status  
- Vehicle speed and motor RPM  
- System temperatures  
- Vehicle faults and error messages  
- Network and telemetry connection status  
- Additional diagnostic and performance data

Most members of the VisComm team will be working on this project unless assigned to a specialized project. Work on the dashboard can involve **UI development in QML, backend logic in C++, telemetry handling, CAN signal integration, or system debugging and testing**.

# Telemetry Serialization Migration: JSON → Protocol Buffers

Over the year, the team began migrating the telemetry data format used by the dashboard and telemetry pipeline from **JSON to Protocol Buffers (Protobuf)**. This change focuses on improving the efficiency and scalability of real time vehicle data communication.

Originally, telemetry messages were transmitted using JSON. While JSON is easy to read and debug, it is relatively large and inefficient for highfrequency data streams. As the number of telemetry signals increased, message size and processing overhead became a performance concern. The old software manager also use to say the JSON system causes us to hemmorahge money in data costs so theres that too.

Protocol Buffers provide a **binary serialization format** that is significantly smaller and faster to encode and decode than JSON. By defining structured message schemas in `.proto` files, the system can generate efficient code for serializing and parsing telemetry data.

# RFID Identification System

The RFID project integrates a radio frequency identification (RFID) scanner with the vehicle dashboard system to enable automatic identification of authorized users interacting with the car’s systems. The scanner is connected to the Raspberry Pi that runs the dashboard software stack (on Alpine Linux).

When an RFID card is scanned, the reader outputs a digital signal. This signal is captured by the Raspberry Pi using GPIO interrupt pins. A Python service reads the incoming bitstream, reconstructs the RFID tag ID, and forwards the identifier to the dashboard software. The dashboard can then associate the scanned tag with a known user or role.

Overall the general theme of all of these projects minus the protobuff migration, is taking information/data on a machine level, and transforming it into readable and often nice looking things that we can look at. Plus companies like tesla and cisco love ts so we js gon keep doing it cause they eat it up when it comes time to apply for jobs.