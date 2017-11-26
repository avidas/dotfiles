#
# ~/.bash_aliases
#

alias perf='p4'
alias less='less -r'
alias time='gtime'

alias skim="(head -8; echo; tail -8) <"

# Full version, reverse while sorting, last modified
alias lso='ls -l'
alias ls='ls -lrthFG'

# Similar to vim for cd 
alias k='cd ..'

# Do full set of processes
alias ps="ps"

#Searchable process table, (e.g. psg bash) from digital ocean
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# Continue download in case of problems
alias wget="wget -c"

# Similar to vim for cd 
alias k='cd ..'

# Grep with line number, recursive and case insentitive
alias gnir='grep -nir'

# Reset environment
alias renv='exec bash'

# Previous folder
alias p='cd -'

# Show where you copy
alias cp="cp -v"

# reset system environment on current terminal
alias cp="cp -v"

# Make it no matter what
alias mkdir="mkdir -vp"

# Disk usage summary
alias dus="du | sort -nr | head -20 | cut -f2- | xargs du -hs"

if ! type "hub" > /dev/null; then
  alias git=hub;
fi

# git status+branch+remotes
alias gitit="if [ -d ".git" ]; then git branch; git status; git branch -avv | grep -E 'ahead|behind'; git remote -v; fi"

# git status+branch+remotes
alias gititd="if [ -d ".git" ]; then git status; git branch -avv | grep -E 'ahead|behind'; git diff; git remote -v; fi"

#git frequently used 
alias g="git"
alias ga="git add"
alias gcm="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gpo="git push origin"
alias gplo="git pull origin"
alias gpom="git push origin master"
alias gplom="git pull origin master"
alias gpi="git push internal"
alias gpim="git push internal master"
alias gpis="git push internal stable"
alias gpu="git push upstream"
alias gpum="git push upstream master"
alias gpus="git push upstream stable"
alias gdms="git diff master stable"
alias gcl="git clone"
alias gra="git remote add"
alias gd="git diff"
alias gc="git checkout"
alias gcl="git clone"
alias gst="git status"

#git log better format
alias gitl='git log --stat --graph --summary'
alias gitll='git log --pretty="%C(auto)%h%Creset %C(auto)[%ci]%Creset %Cgreen[%cn]%Creset %s" --graph'
alias gitd='git diff --minimal -b --color=always | less -R'
alias gitcbt='git log --oneline $(echo git tag | tail -2 | head -1)...$(echo git tag | tail -1) | cut -d " " -f 2-'

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

alias tmux-split="sh ~/dotfiles/.tmux-split.sh"

## Ruby
alias be='bundle exec'
