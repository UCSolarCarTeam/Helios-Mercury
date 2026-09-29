# Machine Setup Guide

This guide sets up a Windows laptop or Apple MacBook for normal Mercury development.

By the end, you should be able to:

- edit Mercury in VS Code
- build and run Mercury in Qt Creator 6.8.4
- use the correct Qt kit for your operating system
- clone and work with the Helios-Mercury repository

The Linux VM is set up separately in [VMSetupGuide.md](VMSetupGuide.md).

---

# Windows Setup

## 1. Install Git

Install Git for Windows.

Quick install with Windows Package Manager:

```powershell
winget install --id Git.Git -e
```

Close and reopen PowerShell, then verify:

```powershell
git --version
```

Configure your Git identity once:

```powershell
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

Check it:

```powershell
git config --global --list
```

---

## 2. Install Visual Studio Code

Quick install:

```powershell
winget install --id Microsoft.VisualStudioCode -e
```

Restart PowerShell, then verify:

```powershell
code --version
```

### Required VS Code extensions

Install these from the Extensions tab in VS Code, or run:

```powershell
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.cmake-tools
code --install-extension bbenoist.qml
code --install-extension ms-vscode-remote.remote-ssh
```

Recommended but optional:

```powershell
code --install-extension eamodio.gitlens
code --install-extension mhutchie.git-graph
code --install-extension ms-python.python
```

What they are for:

| Extension | Purpose |
|---|---|
| C/C++ | C++ IntelliSense, navigation, diagnostics |
| CMake Tools | CMake project awareness in VS Code |
| QML | QML syntax support |
| Remote - SSH | Useful for remote Linux/Pi work |
| GitLens | Better Git history/blame tools |
| Git Graph | Visual Git history |
| Python | Useful for Python/RFID scripts |

---

## 3. Install Qt 6.8.4

Download the Qt Online Installer from the official Qt website and sign in with a Qt account.

For Mercury on Windows, use:

```text
Qt version: 6.8.4
Desktop kit: MinGW 64-bit
```

Install Qt Creator as well.

Mercury's CMake configuration requires these Qt modules:

```text
Core
Gui
Qml
Quick
Mqtt
SerialBus
```

Core, Gui, Qml, and Quick are part of the normal desktop Qt installation. Make sure Qt MQTT and Qt Serial Bus are also available for Qt 6.8.4.

A normal team installation looks like:

```text
C:\Qt\6.8.4\mingw_64
C:\Qt\Tools\QtCreator
```

Verify:

```powershell
Test-Path "C:\Qt\6.8.4\mingw_64"
Test-Path "C:\Qt\Tools\QtCreator\bin\qtcreator.exe"
```

Both should return:

```text
True
```

If CMake later reports that `Qt6::Mqtt` or `Qt6::SerialBus` is missing, open:

```text
C:\Qt\MaintenanceTool.exe
```

and add the missing Qt 6.8.4 component.

---

## 4. Clone Mercury

Use the UCSolarCarTeam repository:

```powershell
git clone https://github.com/UCSolarCarTeam/Helios-Mercury.git
cd Helios-Mercury
```

Verify:

```powershell
git status
git branch --show-current
git remote -v
```

The main branch is:

```text
master
```

---

## 5. Open Mercury in VS Code

From the repository:

```powershell
code .
```

Use VS Code for normal C++ and QML editing.

Important files and folders include:

```text
CMakeLists.txt
Mercury.qmlproject
main.qml
content/
imports/
src/
config.ini.example
```

Do not normally edit generated files inside `build/`.

---

## 6. Open Mercury in Qt Creator

Open Qt Creator and open:

```text
Helios-Mercury/CMakeLists.txt
```

When Qt Creator asks for a kit, select:

```text
Desktop Qt 6.8.4 MinGW 64-bit
```

A normal Windows build directory looks like:

```text
build/Desktop_Qt_6_8_4_MinGW_64_bit-Debug
```

The executable target is:

```text
Helios-Mercury
```

Build first, then run.

If Qt Creator selects the wrong Qt version, open its kit settings and make sure the project is using Qt 6.8.4.

---

## 7. Quick Windows Setup Check

Run:

```powershell
Write-Host "===== GIT ====="
git --version

Write-Host "`n===== VS CODE ====="
code --version

Write-Host "`n===== QT ====="
Test-Path "C:\Qt\6.8.4\mingw_64"
Test-Path "C:\Qt\Tools\QtCreator\bin\qtcreator.exe"

Write-Host "`n===== REPOSITORY ====="
git -C .\Helios-Mercury branch --show-current 2>$null
```

You are ready for the next step when Git, VS Code, Qt Creator, and the Qt 6.8.4 MinGW kit are installed and Mercury can build locally.

---

# Apple MacBook Setup

## 1. Check Your Mac Architecture

Open Terminal and run:

```bash
uname -m
```

Typical results:

```text
arm64   -> Apple Silicon Mac (M1/M2/M3/M4/etc.)
x86_64  -> Intel Mac
```

This matters mainly for the VM. The host setup below is otherwise very similar.

---

## 2. Install Apple's Command Line Tools

Run:

```bash
xcode-select --install
```

If they are already installed, macOS will tell you.

Verify:

```bash
xcode-select -p
git --version
clang --version
```

Configure your Git identity once:

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

---

## 3. Install Visual Studio Code

Install Visual Studio Code for macOS.

After installation, open VS Code and press:

```text
Command + Shift + P
```

Search for:

```text
Shell Command: Install 'code' command in PATH
```

Then open a new Terminal and verify:

```bash
code --version
```

### Required VS Code extensions

Install from the Extensions tab, or run:

```bash
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.cmake-tools
code --install-extension bbenoist.qml
code --install-extension ms-vscode-remote.remote-ssh
```

Recommended but optional:

```bash
code --install-extension eamodio.gitlens
code --install-extension mhutchie.git-graph
code --install-extension ms-python.python
```

---

## 4. Install Qt 6.8.4

Download the Qt Online Installer for macOS from the official Qt website and sign in with a Qt account.

Install:

```text
Qt 6.8.4
Qt Creator
macOS Desktop kit
```

Mercury requires these Qt modules:

```text
Core
Gui
Qml
Quick
Mqtt
SerialBus
```

Make sure Qt MQTT and Qt Serial Bus are included for Qt 6.8.4.

On macOS, Mercury uses Apple's Clang toolchain instead of MinGW.

After installation, open Qt Creator and confirm that a Qt 6.8.4 macOS desktop kit is available.

---

## 5. Optional Command-Line Build Tools

Mercury is normally built in Qt Creator, so separate command-line CMake/Ninja installs are not required for basic onboarding.

If you already use Homebrew and want command-line CMake/Ninja available, you can install them with:

```bash
brew install cmake ninja
```

Verify:

```bash
cmake --version
ninja --version
```

---

## 6. Clone Mercury

Run:

```bash
git clone https://github.com/UCSolarCarTeam/Helios-Mercury.git
cd Helios-Mercury
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

## 7. Open Mercury in VS Code

From the repository:

```bash
code .
```

Use VS Code for normal C++ and QML editing.

Important files and folders include:

```text
CMakeLists.txt
Mercury.qmlproject
main.qml
content/
imports/
src/
config.ini.example
```

Do not normally edit generated files inside `build/`.

---

## 8. Open Mercury in Qt Creator

Open Qt Creator and open the root:

```text
CMakeLists.txt
```

Select the Qt 6.8.4 macOS kit.

Build and run the target:

```text
Helios-Mercury
```

The build-directory name will differ from Windows because macOS uses Clang instead of MinGW. That is normal.

---

## 9. Quick Mac Setup Check

Run:

```bash
echo "===== ARCHITECTURE ====="
uname -m

echo
echo "===== APPLE TOOLS ====="
xcode-select -p
git --version
clang --version | head -n 1

echo
echo "===== VS CODE ====="
code --version || echo "VS Code CLI is not in PATH"
```

You are ready for the next step when Git, VS Code, Qt Creator, and the Qt 6.8.4 macOS kit are installed and Mercury can build locally.

---

# Next Step

Once your Windows or Mac host machine is ready, continue to:

[VM Setup Guide](VMSetupGuide.md)
