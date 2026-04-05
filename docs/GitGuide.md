# Git Commands (Code Collaboration)

The Mercury dashboard code is managed using **Git**, a version control system used to track changes and collaborate on code.

#### **git clone**

Downloads a copy of the repository to your computer.

Example: git clone https://github.com/solarcar/Helios-Mercury

#### **git pull**

Downloads the latest changes from the remote repository.

Example: git pull

#### **git status**

Shows the current state of the repository.

Example: git status

#### **git add**

Stages changes so they can be committed.

Example: git add .

#### **git commit**

Creates a snapshot of the staged changes.

Example: git commit -m "Updated C++ parsing"

#### **git push**

Uploads commits to the remote repository on GitHub.

Example: git push

#### **git branch**

Shows available branches in the repository.

Example: git branch

#### **git checkout**

Switches to another branch.

Example: git checkout main

#### **git checkout -b**

Creates and switches to a new branch.

Example: git checkout -b new-feature

#### **git log**

Shows the commit history.

Example: git log

#### **git fetch**

Downloads updates from the remote repository without merging them.

Example: git fetch

# Typical VisComm Workflow

A common VisComm development workflow starts with receiving a ticket, creating a branch from the `master` branch, completing the assigned work, testing it, and then pushing the changes where either me or ahmed will review it.

Laptop  

↓  

Assigned ticket 

↓  

Open local repository  

↓  

Switch to `master` branch 

↓  

Pull latest changes 

↓  

Create branch named after ticket number 

↓  

Complete development work  

↓  

Test changes locally (In QT)

↓  

Commit changes  

↓  

Push branch to GitHub

↓  

Open pull request (No Comments = sybau)

↓  

Merge after review  
