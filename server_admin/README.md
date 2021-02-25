Information about using some of these scripts

# To setup a dedicated Valheim server

- Create a new Droplet on Digital Ocean with the default Ubuntu 20.04 image
- ssh root@ip-address
- git clone https://github.com/connorhsm/connorhsm.git
- bash connorhsm/server_admin/setup_ubuntu_20.04.sh "steam"
- logout
- ssh steam@ip-address
- bash connorhsm/server_admin/install_steamcmd.sh
- bash connorhsm/server_admin/setup_valheim_server.sh "Server name" "Server pass (min. 8 chars)"
- sudo reboot
- ssh steam@ip-address
- screen -R valheim
- cd valheim
- ./start_server_edit.sh

Valheim server will now startup.

### Recommended resources for a dedicated Valheim server
From early testing, it seems 1vCPU/1GB is not enough for the server, but 2vCPU/2GB was.