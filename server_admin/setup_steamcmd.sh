#!/bin/bash

# Assumed setup_ubuntu_20.04.sh has been run, with user 'steam'

# Source https://developer.valvesoftware.com/wiki/SteamCMD#Linux
sudo add-apt-repository multiverse
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install lib32gcc1 steamcmd