#!/bin/bash

# Assumed setup_ubuntu_20.04.sh has been run, with user 'steam'

# Source https://developer.valvesoftware.com/wiki/SteamCMD#Linux

# Add package repo and install, make sure to accept the license
sudo add-apt-repository multiverse
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install lib32gcc1 steamcmd -y

# Initiate update and login
steamcmd
login blueysmits
# Password prompt
# Steamguard prompt

quit