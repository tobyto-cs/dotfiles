#!/bin/sh
packages=(wget rofi picom)
aur_packages=()

sudo pacman -S --needed "${packages[@]}" 
yay -S "${aur_packages[@]}"

## From Source

# Fira Code Mono Nerd Font
firacode_dir=$HOME/.local/share/fonts/ttf/FiraCodeNerdFontMono
if [ ! -d "$firacode_dir" ]; then
	mkdir -p $firacode_dir
	wget -O $firacode_dir/FiraCodeNerdFontMono-Bold.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Bold/FiraCodeNerdFontMono-Bold.ttf
	wget -O $firacode_dir/FiraCodeNerdFontMono-Light.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Light/FiraCodeNerdFont-Light.ttf
	wget -O $firacode_dir/FiraCodeNerdFontMono-Medium.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Medium/FiraCodeNerdFontMono-Medium.ttf
	wget -O $firacode_dir/FiraCodeNerdFontMono-Regular.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/FiraCodeNerdFontMono-Regular.ttf
	wget -O $firacode_dir/FiraCodeNerdFontMono-Retina.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Retina/FiraCodeNerdFontMono-Retina.ttf
	wget -O $firacode_dir/FiraCodeNerdFontMono-SemiBold.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/SemiBold/FiraCodeNerdFontMono-SemiBold.ttf
fi
