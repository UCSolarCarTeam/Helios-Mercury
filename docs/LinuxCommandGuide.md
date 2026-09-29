# Linux, Raspberry Pi, and Network Command Guide

Interface Systems uses Linux in two different places:

```text
Ubuntu VM        -> development, Qt, virtual CAN testing
Raspberry Pi     -> in-car dashboard computer running Alpine Linux
```

The basic shell commands are similar, but package management is different:

```text
Ubuntu VM  -> apt
Alpine Pi  -> apk
```

Do not use `apt` instructions on the Alpine Raspberry Pi, and do not use `apk` instructions in the Ubuntu VM.

---

# 1. Basic File and Directory Commands

## `pwd`

Shows your current directory.

```bash
pwd
```

## `ls`

Lists files and folders.

```bash
ls
ls -la
```

`ls -la` also shows hidden files and more details.

## `cd`

Changes directory.

```bash
cd Helios-Mercury
cd ..
cd ~
```

## `mkdir`

Creates a directory.

```bash
mkdir telemetry_logs
```

## `cp`

Copies a file or folder.

```bash
cp config.ini.example config.ini
```

Copy a folder recursively:

```bash
cp -r source_folder destination_folder
```

## `mv`

Moves or renames a file.

```bash
mv old_name.txt new_name.txt
```

## `rm`

Deletes a file.

```bash
rm file.txt
```

Delete a directory recursively:

```bash
rm -r folder_name
```

Be careful with `rm`; it does not use a recycle bin.

## `cat`

Prints a text file to the terminal.

```bash
cat config.ini
```

## `grep`

Searches text.

```bash
grep "interface" config.ini
grep -R "interface" .
```

## `less`

Views a long text file one page at a time.

```bash
less Mercury.log
```

Press `q` to exit.

## `tail`

Shows the end of a file.

```bash
tail Mercury.log
```

Follow a log live:

```bash
tail -f Mercury.log
```

Stop with `Ctrl + C`.

---

# 2. Editing Files in the Linux Terminal

Quick changes inside the VM or Pi are often made with `nano` or `vi`.

## Nano

Open a file:

```bash
nano config.ini
```

Useful shortcuts:

```text
Ctrl + O  -> save
Enter     -> confirm filename
Ctrl + X  -> exit
Ctrl + W  -> search
```

## Vi

Open a file:

```bash
vi wiegand_test.py
```

Important commands:

| Key | Function |
|---|---|
| `i` | Enter insert mode |
| `Esc` | Leave insert mode |
| `:w` | Save |
| `:q` | Quit |
| `:wq` | Save and quit |
| `:q!` | Quit without saving |

---

# 3. Running Programs

Run a Python script:

```bash
python3 script.py
```

Example:

```bash
python3 wiegand_test.py
```

Stop a running foreground program with:

```text
Ctrl + C
```

Check running processes:

```bash
ps aux
```

Search for a process:

```bash
ps aux | grep Mercury
```

---

# 4. Network Commands

These commands are useful when working with the Ubuntu VM, Raspberry Pi, and other hardware.

## Linux: `ip a`

Shows network interfaces and addresses.

```bash
ip a
```

Shorter view:

```bash
ip -br addr
```

Example interfaces may include:

```text
eth0
enp0s17
wlan0
can0
vcan0
```

## `ip route`

Shows the routing table and default gateway.

```bash
ip route
```

## `ip neigh`

Shows nearby devices the Linux machine has learned on the local network.

```bash
ip neigh
```

## `ping`

Tests whether another device is reachable.

```bash
ping 192.168.1.15
```

On Linux, stop with `Ctrl + C`.

---

# 5. Finding the Raspberry Pi from Your Laptop

The laptop and Pi should normally be connected to the same network for direct SSH access.

## Windows

```powershell
ipconfig
arp -a
ping PI_IP_ADDRESS
```

`ipconfig` shows the laptop's IPv4 address, subnet mask, and default gateway.

`arp -a` shows devices your computer has recently learned about on the local network.

## macOS

```bash
ifconfig
arp -a
ping PI_IP_ADDRESS
```

## Ubuntu VM

```bash
ip -br addr
ip route
ip neigh
ping PI_IP_ADDRESS
```

The exact Pi IP address may change depending on the network.

---

# 6. Connecting to the Raspberry Pi with SSH

Once you know the Pi's IP address and current team username:

```bash
ssh USERNAME@PI_IP_ADDRESS
```

Example:

```bash
ssh admin@192.168.1.15
```

Use the username and authentication method given by a team lead. Do not put Pi passwords or private keys in the repository.

Root access should only be used when it is actually required:

```bash
ssh root@PI_IP_ADDRESS
```

Exit the remote session with:

```bash
exit
```

---

# 7. Copying Files to and from the Pi

## `scp`

Copy one file to the Pi:

```bash
scp config.ini admin@192.168.1.15:/home/admin/
```

Copy a file from the Pi back to your laptop:

```bash
scp admin@192.168.1.15:/home/admin/Mercury.log .
```

## `rsync`

Synchronize a directory:

```bash
rsync -av Helios-Mercury/ admin@192.168.1.15:/home/admin/Helios-Mercury/
```

Use `rsync` carefully. Make sure the source and destination are correct before running it.

---

# 8. Ubuntu VM Package Management (`apt`)

The development VM runs Ubuntu Linux.

Update the package list:

```bash
sudo apt update
```

Install packages:

```bash
sudo apt install git
```

Common Interface Systems development packages:

```bash
sudo apt install -y git build-essential cmake ninja-build python3 can-utils nano vim
```

Upgrade installed packages when appropriate:

```bash
sudo apt upgrade
```

Search for a package:

```bash
apt search PACKAGE_NAME
```

---

# 9. Raspberry Pi Package Management (`apk`)

The dashboard Raspberry Pi runs Alpine Linux.

Update package indexes:

```bash
apk update
```

Install a package:

```bash
apk add git
```

Upgrade installed packages:

```bash
apk upgrade
```

Search for a package:

```bash
apk search PACKAGE_NAME
```

Example:

```bash
apk search pigpio
```

Depending on how the Pi is configured, package-management commands may require root access.

---

# 10. CAN Interfaces on Linux

List network interfaces:

```bash
ip link show
```

Common CAN interface names:

```text
can0   -> physical CAN adapter / car CAN interface
vcan0  -> virtual CAN interface used in the Ubuntu VM
```

For creating and testing `vcan0`, see [CanSetupGuide.md](CanSetupGuide.md).

---

# 11. Useful Git Commands on Linux

Inside either the VM or Pi repository clone:

```bash
git status
git branch --show-current
git fetch
git pull
```

For the complete team Git workflow, see [Workflow.md](Workflow.md).

---

# 12. Quick Linux Troubleshooting

## Where am I?

```bash
pwd
```

## What files are here?

```bash
ls -la
```

## What IP address do I have?

```bash
ip -br addr
```

## Can I reach GitHub?

```bash
ping -c 4 github.com
```

## Can I reach the Pi?

```bash
ping PI_IP_ADDRESS
```

## What CAN interfaces exist?

```bash
ip link show
```

## Is Mercury running?

```bash
ps aux | grep Mercury
```

## What does Mercury's log say?

```bash
tail -f Mercury.log
```
