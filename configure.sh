#!/usr/bin/env bash

cd
sudo apt-get update && sudo apt-get upgrade
sudo apt-get dist-upgrade
sudo apt-get install -y git ssh fzf curl cmake pkg-config python3-dev gcc-arm-none-eabi ninja-build \
    gettext unzip build-essential can-utils xz-utils python3-virtualenv
mkdir repos && cd repos
mkdir binotation god-is-a-crab
git clone https://github.com/binotation/misc.git

# Install Neovim
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd ..
mkdir -p "$HOME/.config/nvim"
cp misc/init.lua "$HOME/.config/nvim"
git clone --depth=1 https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim
echo 'alias vi=nvim' >> "$HOME/.bashrc"

# Set up git
cp misc/.gitconfig "$HOME"
cp misc/.gitconfig_binotation binotation/
cp misc/.gitconfig_god-is-a-crab god-is-a-crab/
ssh-keygen -t ed25519 -f $HOME/.ssh/binotation -N ''
ssh-keygen -t ed25519 -f $HOME/.ssh/god-is-a-crab -N ''

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
echo 'eval "$(zoxide init --cmd cd bash)"' >> "$HOME/.bashrc"
