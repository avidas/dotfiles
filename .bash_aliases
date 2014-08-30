alias perf='p4'
alias less='less -r'
alias time='/usr/bin/time -v'

alias skim="(head -8; echo; tail -8) <"

# Full version, reverse while sorting, last modified
alias ls='ls -lrtha --color=auto -F'
alias sl='ls'
# Longdir
alias lsl="ls -lhFA | less"

# Do full set of processes
alias ps="ps auxf"

#Searchable process table, (e.g. psg bash) from digital ocean
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# Continue download in case of problems
alias wget="wget -c"

# Similar to vim for cd 
alias k='cd ..'

alias lsdirs="ls -l | grep '^d'"

# Show where you copy
alias cp="cp -v"

# Make it no matter what
alias mkdir="mkdir -vp"

# Disk usage summary
alias dus="du | sort -nr | head -20 | cut -f2- | xargs du -hs"

# Sort files by Size
alias sortbysize="ls -s | sort -n"

if ! type "hub" > /dev/null; then
  alias git=hub;
fi

#git frequently used 
alias ga="git add"
alias gcm="git commit -m"
alias gpo="git push origin"
alias gpom="git push origin master"
alias gcl="git clone"
alias gr="git remote -v"
alias gra="git remote add"
alias gc="git checkout"

# git status+branch+remotes
alias gitit="if [ -d ".git" ]; then git status; git branch -a; git remote -v; fi"
#git log better format
alias gitl='git log --stat --graph --summary'
alias gl=gitl
alias gitll='git log --pretty="%C(auto)%h%Creset %C(auto)[%ci]%Creset %Cgreen[%cn]%Creset %s" --graph'
alias gll=gitll
aliad gitd='git diff --minimal -b --color=always | less -R'
alias gd='gitd'
# get commit messages between last two git tags
alias gitcbt=`git log --oneline $(echo git tag | tail -2 | head -1)...$(echo git tag | tail -1) | cut -d " " -f 2-`

# Pip upgrade all local packages in virtualenv
alias pip-upgrade='pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U'

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
