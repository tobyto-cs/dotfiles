#!/bin/sh
packages=(wget rofi picom pango firefox unicode-emoji cmake ctags npm python-pip lldb)
aur_packages=(pa-applet-git nvim-packer-git ttf-twemoji-color lua-language-server-git codelldb-git)
pip_packages=(neovim)
npm_packages=(bash-language-server neovim)

# YAY Installation for AUR packages

# Pipewire requirements
packages+=(pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber)

# Arch Packages
packages+=(ccls-git)

# Check GPU for comp
if $(lspci | grep -q 'NVIDIA'); then
	packages+=(nvidia-dkms nvidia-settings nvidia-utils)
fi

# Install required packages
sudo pacman -S --needed "${packages[@]}"
yay -S --needed "${aur_packages[@]}"
pip install "${pip_packages[@]}"
sudo npm i -g "${npm_packages[@]}"

### From Source

## zsh Plugins
ZSH_DIR=$HOME/.zsh
if [ ! -d "$ZSH_DIR" ]; then
	mkdir -p $ZSH_DIR
fi

# powerlevel10k
if [ ! -d "$ZSH_DIR/powerlevel10k" ]; then
	mkdir -p $ZSH_DIR/powerlevel10k
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_DIR/powerlevel10k
fi
# zsh-syntax-highlighting
if [ ! -d "$ZSH_DIR/zsh-syntax-highlighting" ]; then
	mkdir -p $ZSH_DIR/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_DIR/zsh-syntax-highlighting
fi
# history substring search
if [ ! -d "$ZSH_DIR/zsh-history-substring-search" ]; then
	mkdir -p https://github.com/zsh-users/zsh-syntax-highlighting.git
	git clone https://github.com/zsh-users/zsh-history-substring-search $ZSH_DIR/zsh-history-substring-search
fi
