#!/bin/bash

cd
sudo dnf upgrade -y
mkdir repos && cd repos
mkdir binotation god-is-a-crab
sudo dnf install -y git neovim
git clone --depth=1 https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim
git clone https://github.com/binotation/misc.git
mkdir -p ~/.config/nvim
cp misc/init.lua ~/.config/nvim
cp misc/.gitconfig ~
cp misc/.gitconfig_binotation ~/repos/binotation/.gitconfig

# vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
