#!/bin/bash

# Assumed setup_steamcmd.sh has been run

# Sources
# https://www.reddit.com/r/valheim/comments/ll927v/valheim_dedicated_liknux_server_disconnect_when/
# https://www.pcgamer.com/au/valheim-multiplayer-dedicated-server/
# https://www.shacknews.com/article/122720/how-to-set-up-a-valheim-dedicated-server
# Valheim Dedicated Server Manual (Ships with dedicated server from Steam)
# https://developer.valvesoftware.com/wiki/SteamCMD#Creating_a_script

# Allow Valheim ports on firewall
sudo ufw allow 2456
sudo ufw allow 2457
sudo ufw allow 2458

# Correct an issue with DO's default image
# Remove the private IP address under eth0
sudo sed -e '12d' /etc/netplan/50-cloud-init.yaml
sudo netplan apply

mkdir ~/valheim
mkdir ~/valheim/worlds

# Download the game server
steamcmd +runscript install_valheim.txt

# Copy original start script as steam will overwrite it during updates
cp ~/valheim/start_server.sh ~/valheim/start_server_edit.sh

# Insert settings into startup script
# To Do