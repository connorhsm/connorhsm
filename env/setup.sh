#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install -y python3-pip
pip install pipenv
cd ~
touch ~/.hushlogin
mkdir github
mkdir work-github
cd .connorhsm/config-scripts
cp .git* ~
cp .wakatime.cfg ~
cp .zshrc ~
# Store a env var file in bitwarden and import it?
# Wakatime key
cd ~
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -sS https://starship.rs/install.sh | sh
# Need to be able to pass yes to above
git clone https://github.com/dracula/zsh.git .dracula-zsh
ln -s ~/.dracula-zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme
curl https://pyenv.run | bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
nvm install --lts
nvm use --lts
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install -y unzip
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws/
sudo apt install -y gh
# Need to automate this
gh auth login
# Still need vim config and whatever other config I can find in my old home dir
# Need basic vim setup
# Setup work github env
# Setup personal github env
# Setup ssh keys

# Install zsh last due to chsh weirdness
sudo apt install -y zsh
chsh -s $(which zsh)

# Cleanup
rm .bashrc .bash_logout .profile .zshrc.pre-oh-my-zsh .shell.pre-oh-my-zsh


# ln -s ~/.connorhsm/config-scripts/.gitconfig-zetifi ~/.gitconfig-zetifi
# ln -s ~/.connorhsm/config-scripts/.gitignore-global ~/.gitignore-global
# ln -s ~/.connorhsm/config-scripts/.wakatime.cfg ~/.wakatime.cfg
# ln -s ~/.connorhsm/config-scripts/.zsh_aliases ~/.zsh_aliases
# ln -s ~/.connorhsm/env/ghostty ~/.config/ghostty/config
# sudo ln -s /snap/k9s/current/bin/k9s /snap/bin

# snap install steam spotify k9s discord obsidian firefox
 
# install gcloud k9s uv 