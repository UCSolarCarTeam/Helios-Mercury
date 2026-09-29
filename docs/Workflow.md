# Interface Systems Workflow

Mercury is managed with Git and GitHub.

Repository:

```text
https://github.com/UCSolarCarTeam/Helios-Mercury.git
```

The main branch is:

```text
master
```

Do not do feature development directly on `master`.

---

# Common Git Commands

## Clone the repository

```bash
git clone https://github.com/UCSolarCarTeam/Helios-Mercury.git
```

## Check repository state

```bash
git status
```

## Check the current branch

```bash
git branch --show-current
```

## Download remote updates

```bash
git fetch
```

## Pull the latest changes for the current branch

```bash
git pull
```

## Switch to `master`

```bash
git checkout master
```

## Create a feature branch

Use the VSC ticket number plus a short description.

Example:

```bash
git checkout -b VSC623-can-receiver
```

Typical format:

```text
VSC###-short-description
```

## Review your changes

```bash
git status
git diff
```

## Stage changes

```bash
git add .
```

## Commit changes

```bash
git commit -m "VSC623: update CAN receiver"
```

## Push a new branch

```bash
git push -u origin VSC623-can-receiver
```

After the first push, normal updates can use:

```bash
git push
```

## View commit history

```bash
git log
```

---

# Typical Interface Systems Workflow

```text
Assigned VSC ticket
        ↓
Open Mercury repository
        ↓
git checkout master
        ↓
git pull
        ↓
Create VSC### feature branch
        ↓
Edit C++ / QML in VS Code
        ↓
Build + test locally in Qt Creator
        ↓
Commit changes
        ↓
Push branch to GitHub
        ↓
Ubuntu VM: fetch + checkout same branch
        ↓
Build + run in Linux Qt Creator
        ↓
Test Linux / CAN behavior
        ↓
Push any final fixes
        ↓
Open pull request
        ↓
Team Lead review
        ↓
Merge after approval
```

---

# Moving a Branch from the Host Laptop to the VM

The host laptop and Ubuntu VM use separate Mercury clones.

After pushing the branch from your laptop, open the VM and run:

```bash
cd ~/Helios-Mercury
git fetch origin
git checkout VSC623-can-receiver
git pull
```

If the branch already exists in the VM:

```bash
git checkout VSC623-can-receiver
git pull
```

Before switching branches, check:

```bash
git status
```

If the VM has uncommitted changes, do not blindly overwrite them. Ask a lead if you are unsure what they are.

---

# Before Opening a Pull Request

Check:

```bash
git status
git diff master...HEAD
```

Make sure:

- the branch is based on current `master`
- the project builds
- the feature works locally
- Linux/CAN-related changes were tested in the VM when relevant
- no passwords, keys, credentials, generated junk, or unrelated files were committed
- the branch has been pushed to GitHub

Then open a pull request into `master` for review.
