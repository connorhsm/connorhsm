Information about using some of these scripts

# To setup a dedicated Valheim server

- Create a new Droplet on Digital Ocean with the default Ubuntu 20.04 image
- `ssh root@ip-address`
- `git clone https://github.com/connorhsm/connorhsm.git`
- `bash connorhsm/server_admin/setup_ubuntu_20.04.sh "steam"`
- `logout`
- `ssh steam@ip-address`
- `bash connorhsm/server_admin/install_steamcmd.sh`
- Agree to Steam license
- `bash connorhsm/server_admin/setup_valheim_server.sh "Server name" "serverpassmorethaneightchars"`
- `sudo reboot`
- `ssh steam@ip-address`
- `screen -R valheim`
- `cd valheim`
- `./start_server_edit.sh`

Valheim server will now startup.

### Experience with Digital Ocean's Droplets (Recommended resources)
- Basic Regular Intel 1vCPU/1GB, game server stalls during startup, CPU sitting at 100% constantly.
- Basic Premium AMD 1vCPU/1GB, game server stalls during startup, CPU sitting at 100% constantly. (Assuming Premium Intel is the same)
- Basic Regular Intel 1vCPU/2GB, game server stalls during startup, CPU sitting at 100% constantly.
- Basic Regular Intel 2vCPU/2GB, game server starts fine and clients can connect to the game server, unsure of gameplay quality.

Seems like a second shared CPU is the minimum to get the game server running. Anything more becomes a bit pricey just to play with some friends; Might be doable for a business though.
Would be nice to try out DO's dedicated CPU's and maybe even a larger dedicated machine with Docker or some other form of containerisation.

Some more on the above testing: each time after the game server was started, the CPU would max out and stay that way until I destroyed the machine roughly 5 minutes later. RAM would sit at around 400MB usage. I noticed a significant difference in the option with multiple CPU's, one CPU seems to do the bulk of the work, but the second still makes a huge difference. After the game server has finished starting, both CPU's drop back to <10% usage and RAM jumps to 1.7GB.

Will keep an eye on the behaviour as I test with more users.