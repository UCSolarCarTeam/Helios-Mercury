# CAN Interface Setup (Virtual CAN for the VM)

When developing on the VM without physical CAN hardware, we use a **virtual CAN interface (`vcan0`)**.  
This allows the dashboard software to communicate with a simulated CAN bus.

## sudo ip link add dev vcan0 type vcan

Creates the Virtual CAN Interface

If the interface already exists, you may see: RTNETLINK answers: File exists

This simply means vcan0 was already created.

## sudo ip link set up vcan0

Enables the Interface

Once enabled, the VM can send and receive CAN messages through vcan0.

## ip link show vcan0

Verifys the Interface

• UP → the interface is active

• LOWER_UP → the link is operational

# Fixing the Interface if the Dashboard Uses the Wrong CAN Device

Sometimes the dashboard software is configured to use: can0

instead of: vcan0

This will cause connection errors on the VM.

Example error: failed to connect to can device on interface can0

## Step 1 — Check Available Interfaces

Run: ip link show

Look for: can0 vcan0

To check only the virtual interface: ip link show vcan0

## Step 2 — Find the Interface Configuration

The dashboard reads the CAN interface from configuration files.

Common locations: ./build/config.ini or ./build/Desktop_Qt_6_8_4-Debug/config.ini

If unsure where the interface is defined, search for it.

Terminal search: grep -R "interface" .

Or in VS Code: Ctrl + Shift + F

Search for: interface

## Step 3 — Open the Configuration File

Example: nano ./build/config.ini or nano ./build/Desktop_Qt_6_8_4-Debug/config.ini

## Step 4 — Change the Interface

Inside the file you may see: interface = can or interface = can0

Change it to: interface = vcan0

This tells the dashboard to connect to the virtual CAN bus.

## Step 5 — Save the File

## Step 6 — Check Other Config Files

If multiple config files exist, update them all.

Common files: ./build/config.ini and ./build/Desktop_Qt_6_8_4-Debug/config.ini

Each should contain: interface = vcan0

## Step 7 — Restart the Dashboard

After saving the changes, restart the dashboard software so it reads the updated configuration.