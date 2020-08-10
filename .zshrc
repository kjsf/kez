# Kez's zsh

# Oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
export UPDATE_ZSH_DAYS=3
DISABLE_AUTO_TITLE="true"
DISABLE_AUTO_UPDATE=true
plugins=(zsh-syntax-highlighting git vi-mode mix tmux ssh-agent)
ZSH_THEME="kez"
source $ZSH/oh-my-zsh.sh

# Export
export kfiles='/mnt/k'
export cfiles='/mnt/c'
alias kfiles=$kfiles
alias cfiles=$cfiles

# Aliases
alias cp="cp -v"
alias rm="rm -v"
alias mv="mv -v"
alias mkdir="mkdir -v"
alias qopw="vim $kfiles/Dump/template"
alias utyr="vim $kfiles/Dump/d.list"
alias explo='explorer.exe .'
alias vmshut='cmd.exe | wsl.exe --shutdown'
alias win~='/mnt/c/Users/Asus/'
alias desk~='/mnt/c/Users/Asus/Desktop'

#History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use vim keys n tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# WSL remove console highlight
LS_COLORS=$LS_COLORS:'ow=1;34:' ; export LS_COLORS

# X server - may cause delay
export DISPLAY=$(awk '/nameserver/ {print $2}' /etc/resolv.conf):0.0

# fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
