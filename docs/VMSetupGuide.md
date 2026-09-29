# Solar Car Virtual Machine Setup

The Linux VM is used for Linux-specific Mercury testing and virtual CAN testing.

The host laptop and VM use separate copies of the Mercury repository. Saving a file on the host does **not** automatically update the VM. Git is used to move work between them.

---

# 1. Windows VM Setup

## Install VirtualBox

Install Oracle VirtualBox.

The currently verified team environment uses VirtualBox 7.x.

Verify from PowerShell:

```powershell
& "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" --version
```

## Use the Team Ubuntu VM

If a team VM image or VDI is provided, use that rather than building a new environment from scratch.

The currently verified Windows team VM is:

```text
Ubuntu 24.04 LTS
Architecture: x86_64
RAM: 8 GB
CPUs: 8
Network: Bridged Adapter
Clipboard: Bidirectional
Drag and Drop: Bidirectional
```

The current VM disk is an x86_64 Ubuntu environment. A Windows recruit can use this architecture normally.

## Configure Networking

In VirtualBox:

```text
Select VM
→ Settings
→ Network
→ Adapter 1
```

Set:

```text
Attached to: Bridged Adapter
```

Choose the laptop's active Wi-Fi or Ethernet adapter.

Bridged networking gives the VM its own address on the same local network as the host laptop.

---

# 2. Apple MacBook VM Setup

First check the Mac architecture:

```bash
uname -m
```

## Apple Silicon (`arm64`)

Apple Silicon Macs should use an ARM64 Ubuntu VM.

Do **not** try to use the team's existing x86_64 Ubuntu VDI as the normal VirtualBox guest on Apple Silicon.

Use:

```text
Ubuntu 24.04 LTS ARM64
Qt 6.8.4 Linux ARM64
GCC / G++
CMake
Ninja
Git
can-utils
```

If the team provides an ARM64 Solar Car VM, use it. Otherwise create an Ubuntu 24.04 ARM64 VM.

Recommended starting resources:

```text
RAM: about 8 GB if the Mac has enough memory
CPUs: 4-8 depending on the Mac
Network: Bridged Adapter
Clipboard: Bidirectional
Drag and Drop: Bidirectional
```

## Intel Mac (`x86_64`)

Intel Macs can use an x86_64 Ubuntu 24.04 VM similar to the Windows team environment.

Use Bridged Adapter networking here as well.

---

# 3. Ubuntu Packages Required Inside the VM

After Ubuntu starts, open a terminal.

Install the base development tools:

```bash
sudo apt update
sudo apt install -y \
  git \
  build-essential \
  cmake \
  ninja-build \
  python3 \
  can-utils \
  openssh-client \
  nano \
  vim \
  curl \
  wget
```

Verify:

```bash
git --version
cmake --version
ninja --version
gcc --version | head -n 1
g++ --version | head -n 1
python3 --version
which cansend
which candump
which cansniffer
```

The CAN utilities should normally resolve to paths similar to:

```text
/usr/bin/cansend
/usr/bin/candump
/usr/bin/cansniffer
```

---

# 4. Install Qt 6.8.4 Inside Ubuntu

Mercury requires Qt 6.8 or newer and Interface Systems currently standardizes on Qt 6.8.4.

Do not rely on Ubuntu's system Qt version. Ubuntu may include an older Qt release even when Qt 6 is installed.

Download the official Qt Online Installer for the VM's architecture:

```text
Windows-hosted x86_64 VM -> Linux x64 installer
Apple Silicon ARM64 VM   -> Linux ARM64 installer
Intel Mac x86_64 VM      -> Linux x64 installer
```

After downloading the `.run` installer:

```bash
chmod +x <qt-online-installer>.run
./<qt-online-installer>.run
```

Install:

```text
Qt 6.8.4
Qt Creator
Desktop GCC kit for the VM architecture
Qt MQTT
Qt Serial Bus
```

Mercury requires:

```text
Core
Gui
Qml
Quick
Mqtt
SerialBus
```

On the currently verified x86_64 team VM, the Mercury Qt kit is located at:

```text
/home/vboxuser/Qt/6.8.4/gcc_64
```

Your username may be different, so your path may instead look like:

```text
/home/YOUR_USERNAME/Qt/6.8.4/gcc_64
```

If a system command such as `qtpaths6 --qt-version` reports an older Qt version, that does not automatically mean Mercury is configured incorrectly. What matters is the Qt kit selected by Qt Creator for Mercury.

---

# 5. Clone Mercury Inside the VM

The VM uses its own clone of Mercury.

Using HTTPS:

```bash
cd ~
git clone https://github.com/UCSolarCarTeam/Helios-Mercury.git
cd Helios-Mercury
```

If you already use GitHub SSH, the remote may instead be:

```text
git@github.com:UCSolarCarTeam/Helios-Mercury.git
```

Verify:

```bash
git status
git branch --show-current
git remote -v
```

The main branch is:

```text
master
```

---

# 6. Build Mercury in the VM

Open Qt Creator inside Ubuntu.

Open:

```text
~/Helios-Mercury/CMakeLists.txt
```

Select the Qt 6.8.4 GCC kit.

The currently verified Linux build uses:

```text
Compiler: /bin/g++
Generator: Ninja
Qt: 6.8.4
```

A normal Linux build directory looks similar to:

```text
build/Desktop_Qt_6_8_4-Debug
```

You can confirm the build is using the correct Qt installation with:

```bash
grep -E 'Qt6_DIR|CMAKE_PREFIX_PATH|CMAKE_CXX_COMPILER|CMAKE_GENERATOR' \
  build/*/CMakeCache.txt 2>/dev/null
```

The Qt paths should point to Qt 6.8.4, not Ubuntu's older system Qt.

---

# 7. Host-to-VM Development Workflow

The normal workflow is:

```text
VSC ticket
   ↓
Host laptop: branch from master
   ↓
Edit C++ / QML in VS Code
   ↓
Build and run locally in Qt Creator
   ↓
Commit + push branch
   ↓
VM: fetch + checkout the same branch
   ↓
Build and run in Linux Qt Creator
   ↓
Run Linux/CAN testing
   ↓
Push final changes
   ↓
Open pull request
```

On the VM:

```bash
cd ~/Helios-Mercury
git fetch origin
git checkout YOUR_BRANCH
git pull
```

Always run `git status` before switching branches if you are unsure whether the VM has local changes.

---

# 8. VM Network Verification

Inside Ubuntu:

```bash
hostname
hostname -I
ip -br addr
ip route
```

A bridged VM should normally receive an address from the same local network as the laptop.

Test internet/network access:

```bash
ping -c 4 github.com
```

The exact IP address will change depending on the network.

---

# 9. VM Setup Check

Run:

```bash
echo "===== OS ====="
cat /etc/os-release | grep PRETTY_NAME
uname -m

echo
echo "===== DEV TOOLS ====="
git --version
cmake --version
ninja --version
g++ --version | head -n 1
python3 --version

echo
echo "===== CAN TOOLS ====="
which cansend
which candump
which cansniffer

echo
echo "===== NETWORK ====="
hostname -I
ip route
```

Once Mercury builds with the Qt 6.8.4 kit, continue with [CAN Setup Guide](CanSetupGuide.md).
