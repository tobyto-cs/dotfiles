# Use powerline
USE_POWERLINE="true"
# Source zsh-configuration
if [[ -e $HOME/.zsh ]]; then
  source $HOME/.zsh/zsh-config
fi
# Use powerlevel10k
if [[ -e /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]]; then
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme 
fi
if [[ -e $HOME/.zsh/.p10k.zsh ]]; then
  source $HOME/.zsh/.p10k.zsh
fi

# Use custom PATH vars
if [[ -e $HOME/.zsh/zsh-path ]]; then
  source $HOME/.zsh/zsh-path
fi

# Use custom aliases
if [[ -e $HOME/.zsh/zsh-alias ]]; then
  source $HOME/.zsh/zsh-alias
fi


# Set base16 env vars
if [[ -e $HOME/.zsh/zsh-colors ]]; then
  source $HOME/.zsh/zsh-colors
fi

alias luamake=/opt/lua-language-server/3rd/luamake/luamake


scr="$HOME"/.zsh/zsh-theme
trap "$scr" USR1 
