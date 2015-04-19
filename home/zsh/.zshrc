# Zsh history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Emulate vim
bindkey -v

# Stuff
setopt HIST_IGNORE_DUPS
[[ -n "${key[Home]}" ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n "${key[End]}" ]] && bindkey "${key[End]}" end-of-line

# Loading stuff
autoload -Uz compinit promptinit
compinit
promptinit
setopt CORRECT

# Prompt
autoload -U colors && colors
#RPROMPT="%{$fg_bold[white]%}%~%{$reset_color%}"
PROMPT="%{$fg_bold[white]%}%~%{$reset_color%} %{$fg_bold[yellow]%}$ %{$reset_color%}"

# Aliases
alias sf='screenfetch'
alias image="feh -B white -."
alias ls="ls --color=yes"
alias aur="yaourt"
alias visual="mpdviz -f /tmp/mpd.fifo --icolor=true --scale=2 --step=8 -v spectrum -d true"
alias upl="teknik"
alias place="toilet -f mono12 --gay"

# Path for Ruby Gems
PATH=$PATH:/home/pacha/.gem/ruby/2.2.0/bin

# Man
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# Sourcing stuff
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.aliases
