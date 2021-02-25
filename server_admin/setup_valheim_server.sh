#!/bin/bash

# Assumed setup_steamcmd.sh has been run

# Sources
# https://www.reddit.com/r/valheim/comments/ll927v/valheim_dedicated_liknux_server_disconnect_when/
# https://www.pcgamer.com/au/valheim-multiplayer-dedicated-server/
# https://www.shacknews.com/article/122720/how-to-set-up-a-valheim-dedicated-server
# Valheim Dedicated Server Manual (Ships with dedicated server from Steam)

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

# Get game server details
echo -n "Server name: "
read SERVER_NAME

echo -n "Server password (min 8 chars): "
read SERVER_PASS

# Copy original start script as steam will overwrite it during updates
cp ~/valheim/start_server.sh ~/valheim/start_server_edit.sh

# Insert settings into startup script
# To Do

echo ""
echo ""
echo -n "Server restarting. Afterwards, start Valheim with ./start_server_edit.sh in a Screen."
echo ""
echo ""

# Apply DO config fix from earlier
sudo reboot