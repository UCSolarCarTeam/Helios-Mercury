# CAN Interface Setup

When developing in the Ubuntu VM without physical CAN hardware, we use a **virtual CAN interface called `vcan0`**.

This lets Mercury communicate with a simulated CAN bus using the same Linux SocketCAN interface style used for physical CAN.

---

# Quick Start

Inside the Ubuntu VM:

```bash
cd ~/Helios-Mercury
sudo ip link add dev vcan0 type vcan
sudo ip link set up vcan0
ip link show vcan0
```

Then make sure Mercury's active config uses:

```ini
[Can]
interface=vcan0
```

Run Mercury and use `candump` / `cansend` to test traffic.

---

# 1. Verify CAN Tools Are Installed

Run:

```bash
which cansend
which candump
which cansniffer
```

If they are missing:

```bash
sudo apt update
sudo apt install can-utils
```

---

# 2. Create `vcan0`

Run:

```bash
sudo ip link add dev vcan0 type vcan
```

This creates the virtual CAN interface.

If you see:

```text
RTNETLINK answers: File exists
```

that only means `vcan0` already exists. Continue to the next step.

If the system reports that the virtual CAN type is unavailable, load the kernel module and try again:

```bash
sudo modprobe vcan
sudo ip link add dev vcan0 type vcan
```

---

# 3. Bring `vcan0` Up

Run:

```bash
sudo ip link set up vcan0
```

Verify:

```bash
ip link show vcan0
```

You should see `vcan0` listed and enabled. Virtual interfaces do not always display exactly the same state flags as a physical CAN adapter, so the important part is that the interface exists and is up.

`vcan0` normally needs to be recreated after the VM is restarted.

---

# 4. Configure Mercury to Use `vcan0`

Mercury's example configuration is:

```text
config.ini.example
```

A fresh clone may not have a root `config.ini` yet.

Create one:

```bash
cd ~/Helios-Mercury
cp config.ini.example config.ini
```

Open it:

```bash
nano config.ini
```

or:

```bash
vi config.ini
```

Find:

```ini
[Can]
interface=can0
```

Change it to:

```ini
[Can]
interface=vcan0
```

Save the file.

Mercury's code defaults to `can0` when no interface setting is available, so a missing or wrong config can cause the dashboard to try the physical interface.

---

# 5. Check the Build Configuration

Qt builds may also have a copied `config.ini` inside the build directory.

Common location:

```text
./build/Desktop_Qt_6_8_4-Debug/config.ini
```

Search all active configs:

```bash
grep -R "interface=" config.ini build 2>/dev/null
```

For VM development, the active config used by Mercury should show:

```text
interface=vcan0
```

If the build copy still says `can0`, update that copy or rebuild/reconfigure Mercury so the current configuration is used.

---

# 6. Verify Virtual CAN Traffic

Open **Terminal 1**:

```bash
candump vcan0
```

Leave it running.

Open **Terminal 2** and send a basic test frame:

```bash
cansend vcan0 123#1122334455667788
```

Terminal 1 should display the frame.

This proves that `vcan0` itself works.

Important: CAN ID `123` is only a generic bus test. Mercury may ignore it because Mercury only processes CAN IDs and payload layouts that its parser understands.

For a dashboard-level smoke test, use a known Mercury/vehicle CAN frame provided by the current CAN specification or a team lead.

Stop `candump` with:

```text
Ctrl + C
```

---

# 7. Run Mercury

Once `vcan0` exists and Mercury is configured for it:

1. Open Qt Creator in the Ubuntu VM.
2. Open `~/Helios-Mercury/CMakeLists.txt`.
3. Select the Qt 6.8.4 GCC kit.
4. Build Mercury.
5. Run Mercury.

If Mercury starts without a `can0` connection error, the CAN interface configuration is being read correctly.

---

# Troubleshooting

## `RTNETLINK answers: File exists`

`vcan0` already exists.

Check it:

```bash
ip link show vcan0
```

Then bring it up if needed:

```bash
sudo ip link set up vcan0
```

## `Cannot find device "vcan0"`

Create it:

```bash
sudo ip link add dev vcan0 type vcan
sudo ip link set up vcan0
```

## `Operation not supported` when creating `vcan0`

Try:

```bash
sudo modprobe vcan
```

Then create the interface again.

## `candump: command not found`

Install CAN utilities:

```bash
sudo apt update
sudo apt install can-utils
```

## Mercury says it failed to connect to `can0`

Check the interface:

```bash
ip link show vcan0
```

Then search the Mercury configs:

```bash
grep -R "interface=" config.ini build 2>/dev/null
```

Change any active VM configuration still using `can0` to:

```text
vcan0
```

Restart Mercury after changing the config.

## Unsure which CAN interfaces exist

Run:

```bash
ip link show
```

Typical names include:

```text
vcan0  -> virtual CAN in the VM
can0   -> physical CAN interface / adapter
```

---

# Useful CAN Commands

```bash
ip link show
ip link show vcan0
candump vcan0
cansniffer vcan0
cansend vcan0 123#1122334455667788
```

For general Linux, SSH, networking, and Raspberry Pi commands, see [LinuxCommandGuide.md](LinuxCommandGuide.md).
