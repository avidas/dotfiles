alias perf='p4'
alias less='less -r'
alias time='/usr/bin/time -v'

alias skim="(head -8; echo; tail -8) <"

# Full version, reverse while sorting, last modified
alias ls='ls -lrthFG'

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
alias gitit="if [ -d ".git" ]; then git status; git branch -avv | grep -E 'ahead|behind'; git remote -v; fi"
