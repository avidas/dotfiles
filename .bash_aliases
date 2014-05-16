alias perf='p4'
alias less='less -r'
alias time='/usr/bin/time -v'

alias skim="(head -8; echo; tail -8) <"

# Full version, reverse while sorting, last modified
alias ls='ls -lrth --color=auto -F'

# Similar to vim for cd 
alias k='cd ..'

alias lsdirs="ls -l | grep '^d'"

# Show where you copy
alias cp="cp -v"

# Make it no matter what
alias mkdir="mkdir -vp"

# Disk usage summary
alias dus="du | sort -nr | head -20 | cut -f2- | xargs du -hs"

if ! type "hub" > /dev/null; then
  alias git=hub;
fi


# git status+branch+remotes
alias gitit="if [ -d ".git" ]; then git status; git branch -a; git remote -v; fi"
#git log better format
alias gitl='git log --stat --graph --summary'
alias gitll='git log --pretty="%C(auto)%h%Creset %C(auto)[%ci]%Creset %Cgreen[%cn]%Creset %s" --graph'
aliad gitd='git diff --minimal -b --color=always | less -R'

alias update='sudo apt-get update && sudo apt-get upgrade'

alias c="clear"

## get rid of command not found ##
alias cd..='cd ..'
 
## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
