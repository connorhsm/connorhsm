#!/bin/bash
set -e

echo ""
echo ""
echo -n "Enter IP of clean DO ubuntu 20.04 server: "
read IP

ssh root@${IP} < setup_ubuntu_20.04.sh

ssh steam@${IP} < install_steamcmd.sh

ssh steam@${IP} < setup_valheim_server.sh