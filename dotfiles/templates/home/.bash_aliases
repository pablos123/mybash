#!/usr/bin/env bash
# Aliases and functions are reserved for things that I'll use in the terminal emulator
# and not in scripts nor dmenu.
#
# Common
if [[ -f "$HOME/.minimal_environment" ]]; then
    alias ls="ls --group-directories-first --color=always -F"
else
    alias ls="eza --icons --extended --group-directories-first"
fi

alias l="ls"
alias s="ls"
alias sl="ls"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -al"
alias mkdir="mkdir -p -v"
alias rm="rm -i"
alias tree="tree --dirsfirst --gitignore -F -C"
alias nemo="(nemo . &>> /dev/null) & disown"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias :q="exit"
alias :wq="exit"
alias vim="nvim"
alias bat="batcat"
alias df="duf"
# Git
alias genc="git add . && git commit -m 'genc'"
alias ga="git add"
alias gs="git status"
alias gl="git log"
alias gc="git commit"
# Others
alias bigdirs="(sudo du -h / | sort -rh | head -n 15) 2> /dev/null"
alias myip="printf 'External: ' && curl -s ifconfig.me && echo && printf 'Local: ' && hostname -I"
alias sources="grep --color=always -v -E '^#|^ *$' /etc/apt/sources.list /etc/apt/sources.list.d/*"
alias noneo="noneo -e -c -d -m -s 10000000"
alias weather="curl wttr.in/rosario"
alias calendar_fact="calendar | head -n 1 | cowsay -f duck | lolcat"
