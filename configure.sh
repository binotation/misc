#!/usr/bin/env bash

cd
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install -y git ssh fzf cmake pkg-config python3-dev gcc-arm-none-eabi \
    unzip build-essential can-utils xz-utils python3-virtualenv gdb-multiarch openocd
mkdir repos && cd repos
mkdir binotation god-is-a-crab
git clone https://github.com/binotation/misc.git

# Set up git
cp misc/.gitconfig "$HOME"
cp misc/.gitconfig_binotation binotation/
cp misc/.gitconfig_god-is-a-crab god-is-a-crab/
mkdir -p "$HOME"/.ssh
ssh-keygen -t ed25519 -f "$HOME"/.ssh/binotation -N ''
ssh-keygen -t ed25519 -f "$HOME"/.ssh/god-is-a-crab -N ''

# Install Neovim
mkdir -p "$HOME"/.config/nvim
cp misc/init.lua "$HOME"/.config/nvim
mkdir -p "$HOME"/.local/bin
echo 'export PATH="$PATH":"$HOME"/.local/bin' >> "$HOME"/.bashrc
(cd "$HOME"/Downloads && curl -OL https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz && tar xzf nvim-linux64.tar.gz && cp -r nvim-linux64/* "$HOME"/.local)
git clone --depth=1 https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim
echo 'alias vi=nvim' >> "$HOME"/.bashrc

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
echo 'eval "$(zoxide init --cmd cd bash)"' >> "$HOME"/.bashrc
