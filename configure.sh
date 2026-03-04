#!/usr/bin/env bash

cd
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install -y git ssh fzf cmake make pkg-config python3-dev gcc-arm-none-eabi \
    unzip curl build-essential can-utils xz-utils python3-venv python3-pip gdb-multiarch \
	automake autoconf libtool texinfo libusb-1.0-0 flatpak libglu1-mesa clang ninja-build \
    libgtk-3-dev stlink-tools wget flex bison gperf ccache libffi-dev libssl-dev dfu-util \
    libgcrypt20 libglib2.0-0 libpixman-1-0 libsdl2-2.0-0 libslirp0
sudo snap install --classic tio
mkdir opt repos && cd repos
mkdir binotation god-is-a-crab
git clone https://github.com/binotation/misc.git

pip3 install cmsis-svd==0.5 --break-system-packages

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
(mkdir -p "$HOME"/Downloads && cd "$HOME"/Downloads && curl -OL https://github.com/neovim/neovim/releases/download/v0.11.6/nvim-linux-x86_64.tar.gz && tar xzf nvim-linux-x86_64.tar.gz && cp -r nvim-linux-x86_64/* "$HOME"/.local)
git clone --depth=1 https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim
echo 'alias vi=nvim' >> "$HOME"/.bashrc

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup target add thumbv7em-none-eabihf

# Install zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
echo 'eval "$(zoxide init --cmd cd bash)"' >> "$HOME"/.bashrc

# Install keepassxc
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub org.keepassxc.KeePassXC

# Install OpenOCD STM
cd $HOME/repos
git clone --recursive https://github.com/STMicroelectronics/OpenOCD.git
cd OpenOCD
git checkout -b v0.12.0 v0.12.0
./bootstrap
./configure
make -j$(nproc)
sudo make install
sudo cp contrib/60-openocd.rules /etc/udev/rules.d/

# Flutter
cd $HOME/Downloads
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.41.3-stable.tar.xz
tar xJf flutter_linux_3.41.3-stable.tar.xz -C $HOME/opt
sed -i '/^export PATH=/ s|$|:"$HOME"/opt/flutter/bin|' $HOME/.bashrc

# esp-idf
echo "deb [trusted=yes] https://dl.espressif.com/dl/eim/apt/ stable main" | sudo tee /etc/apt/sources.list.d/espressif.list
sudo apt update
sudo apt install -y eim
eim install
sudo usermod -aG dialout $USER

# claude code
curl -fsSL https://claude.ai/install.sh | bash

# Obsidian

# Kicad
cd $HOME/opt
wget https://mirror.aarnet.edu.au/pub/kicad/appimage/stable/kicad-9.0.7-1-x86_64.AppImage
./kicad-9.0.7-1-x86_64.AppImage --appimage-extract
cp -r squashfs-root/usr/share/icons/hicolor/ ~/.local/share/icons/
rm -r squashfs-root/
cp $HOME/repos/misc/kicad.desktop $HOME/.local/share/applications/

# salae logic 2
