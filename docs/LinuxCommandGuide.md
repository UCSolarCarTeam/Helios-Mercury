# Raspberry Pi / Alpine Linux Command Guide (VisComm)

The Mercury dashboard runs on a Raspberry Pi using Alpine Linux.

 When we work on the solar car software, we frequently connect to the Pi to:

• run the dashboard

• debug telemetry

• monitor CAN communication

• update software

The commands below are the most common commands we use when working with the solar car Raspberry Pi.

### Network Discovery (Finding the Raspberry Pi)

When the Pi is connected to the same network as our laptop, we first need to find its IP address.

Laptop

 ↓

 Scan local network

 ↓

 Identify Raspberry Pi

 ↓

 Connect using SSH

#### arp -a

What it does

Displays a table of devices that our computer has recently communicated with on the local network.

How we use it

When the Raspberry Pi connects to the network, it appears in this list as:

IP Address  ↓ MAC Address

Example:

192.168.1.15   b8:27:eb:45:3a:12

This tells us the Raspberry Pi's IP address is 192.168.1.15.

We can then use that address to connect to the Pi.

#### ipconfig

Shows the network configuration of our computer.

Important fields include:

• IPv4 address

• subnet mask

• default gateway

We use this command to confirm our laptop is connected to the same network as the Raspberry Pi.

#### ip a

Displays all network interfaces on a Linux machine.

Example interfaces:

eth0

wlan0

can0

This command is important because it shows:

• whether ethernet is active

• whether Wi-Fi is active

• whether the CAN interface (can0) exists

#### ping

example:

ping 192.168.1.15

Tests whether the Raspberry Pi is reachable over the network.

Expected output:

64 bytes from 192.168.1.15

If we receive responses, the network connection is working.

