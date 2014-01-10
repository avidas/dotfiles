alias perf='p4'
alias less='less -r'
alias time='/usr/bin/time -v'

alias skim="(head -8; echo; tail -8) <"

# Full version, reverse while sorting, last modified
alias ls='ls -lrth -FG'

# Similar to vim for cd 
alias k='cd ..'

alias lsdirs="ls -l | grep '^d'"

# Show where you copy
alias cp="cp -v"

# Make it no matter what
alias mkdir="mkdir -vp"

# Disk usage summary
alias dus="du | sort -nr | head -20 | cut -f2- | xargs du -hs"
