#!/bin/bash

sudo apt update
sudo apt upgrade -y
cd ~
touch ~/.hushlogin
mkdir github
mkdir work-github
cd .connorhsm/config-scripts
cp .git* ~
cp .wakatime.cfg ~
# Need to copy zsh config files
# Store a env var file in bitwarden and import it?
# Wakatime key
cd ~
sudo apt install -y zsh
chsh -s $(which zsh)
exec zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm .zshrc.pre-oh-my-zsh
curl -sS https://starship.rs/install.sh | sh
# Need to be able to pass yes to above
git clone https://github.com/dracula/zsh.git .dracula-zsh
ln -s ~/.dracula-zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
exec zsh
nvm install --lts
nvm use --lts
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install -y unzip
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws/
sudo apt install -y gh
gh auth login # Need to automate this
# Still need vim config, aws cli, github cli and whatever other config I can find in my old home dir
# Remove setup items? bash profiles?
# Need basic vim setup
# Setup work github env
# Setup personal github env
# Setup ssh keys
