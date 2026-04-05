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

Example: 192.168.1.15   b8:27:eb:45:3a:12

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

Example interfaces: eth0 wlan0 can0

This command is important because it shows:

• whether ethernet is active

• whether Wi-Fi is active

• whether the CAN interface (can0) exists

#### ping

example: ping 192.168.1.15

Tests whether the Raspberry Pi is reachable over the network.

Expected output: 64 bytes from 192.168.1.15

If we receive responses, the network connection is working.

# Remote Access (Connecting to the Pi)

Once we know the IP address, we connect to the Raspberry Pi using SSH.

Laptop

 ↓

 SSH connection

 ↓

Remote terminal on Raspberry Pi

#### **ssh admin@IP_ADDRESS**

Connects to the Raspberry Pi using SSH (Secure Shell).

Example: ssh admin@192.168.1.15

Explanation:

• **ssh** → secure shell protocol used to remotely access another computer  

• **admin** → user account on the Raspberry Pi  

• **IP_ADDRESS** → address of the Raspberry Pi on the local network  

This command opens a remote terminal session on the Raspberry Pi, allowing us to run commands directly on the dashboard computer.

#### **ssh root@IP_ADDRESS**

Logs into the Raspberry Pi as the root (administrator) user.

Example: ssh root@192.168.1.15

Root access allows:

• installing software  

• modifying system configuration  

• restarting services  

• accessing protected system directories  

#### **exit**

Closes the SSH session.

Example: exit

Returns you to your local computer terminal.

# Transferring Files to the Pi

Sometimes we need to copy files or update the dashboard code remotely.

Laptop  

→ Secure transfer  

→ Raspberry Pi filesystem  

#### **scp**

Securely copies a file from your computer to the Raspberry Pi.

Example: scp config.ini admin@192.168.1.15:/home/admin/

#### **rsync**

Synchronizes folders between your computer and the Raspberry Pi.

Example: rsync -av Helios-Mercury/ admin@192.168.1.15:/home/admin/

# File System Navigation

Once connected to the Pi, we use these commands to move around the filesystem and manage files.

#### **ls**

Lists files and folders in the current directory.

Example: ls

#### **cd**

Changes the current directory.

Example: cd Helios-Mercury

#### **pwd**

Shows the full path of the current directory.

Example: pwd

#### **mkdir**

Creates a new directory.

Example: mkdir telemetry_logs

#### **rm**

Deletes a file from the filesystem.

Example: rm file.txt

# Editing Files on the Pi

Most quick edits are done directly on the Raspberry Pi using a terminal text editor.

#### **vi**

Opens a file in the terminal-based editor.

Example: vi wiegand_test.py

##### Important **vi** Commands

These commands are used while inside the `vi` editor.

| Key | Function |

|----|----|

| **i** | Enter insert mode (allows you to type and edit text) |

| **Esc** | Exit insert mode |

| **:wq** | Save the file and exit the editor |

# Running Programs

To run Python scripts: python3 script.py

Example: python3 wiegand_test.py

To stop, CTRL C

# Alpine Linux Package Management

Alpine Linux uses the **apk** package manager to install, update, and manage software packages.

#### **apk update**

Updates the package index so the system knows about the latest available software.

Example: apk update

#### **apk add**

Installs a software package.

Example: apk add git

#### **apk upgrade**

Updates installed packages to the latest available versions.

Example: apk upgrade

#### **apk search**

Searches the repository for available packages.

Example: apk search pigpio