#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1="[\u@\h:\w ] $ "

# Add todo to terminal for better tracking
if [ -f "$HOME/Dropbox/TODO.txt" ] ; then head -10 $HOME/Dropbox/TODO.txt; fi

export VIRTUALENVWRAPPER_PYTHON=/usr/sbin/python2
source $(which virtualenvwrapper_lazy.sh)
#workon scratch

export GREP_OPTIONS='--color=auto'

#save command history for all terminals
shopt -s histappend
export PROMPT_COMMAND='history -a'

#spellcheck typos in cd
shopt -s cdspell

# complete sudo and man-pages
complete -cf sudo man

# Separate aliases file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi 

# Separate functions file
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
