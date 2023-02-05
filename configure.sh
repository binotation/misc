#!/bin/bash

cd
sudo dnf upgrade -y
mkdir repos && cd repos
mkdir binotation god-is-a-crab
sudo dnf install -y git
git clone https://github.com/binotation/misc.git
cp misc/.gitconfig ~
cp misc/.gitconfig_binotation ~/repos/binotation/.gitconfig

# vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
