# Setup for Manjaro-i3

The base for the setup is manjaro-i3 minimal
https://manjaro.org/downloads/community/i3/

Download the Installer
`wget https://raw.githubusercontent.com/tobyto-cs/dotfiles/main/dotfiles-install`

Update pacman `sudo pacman -Syu`

Install **YaY** https://github.com/Jguer/yay
```
pacman -S --needed git base-devel
cd /opt
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --save --answerclean None --answerdiff None
```

Add `$USER ALL=(ALL) NOPASSWD: ALL` to the end of `sudo visudo`

Install **python-pip** `yay -S python-pip`

Set **zsh** to default shell `sudo usermod --shell /bin/zhs $USER`
Install **powerlevel10k `yay -S zsh-theme-powerlevel10k-git`

Install **kitty** `yay -S kitty`

Install **mdcat** `yay -S mdcat`

Install **FriaCode Nerdfont** `yay -S nerd-fonts-fira-code`


## Nvim Dependencies

Install **Packer** `yay -S nvim-packer-git`

Install **sumneko** lua-lsp `yay -S lua-language-server-git`

## Configuration Install

```
git clone --bare git@github.com:tobyto-cs/dotfiles.git $HOME/.cfg
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```

