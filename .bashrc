#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="[\u@\h:\w ] $ "

export VIRTUALENVWRAPPER_PYTHON=/usr/sbin/python2
source $(which virtualenvwrapper_lazy.sh)
#workon scratch

export ANDROID_HOME="/Users/anadas/Downloads/adt-bundle-mac-x86_64-20131030/sdk"

#clang needs to know all flags for CPython build
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

# Always enable GREP colors
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

# Git auto completion
if [ -f ~/git-completion.bash ]; then
    . ~/git-completion.bash
fi

# PHP composer binaries (e.g. phpunit)
if [ -d ~/.composer/vendor/bin/ ]; then
      export PATH=$PATH:~/.composer/vendor/bin/
fi
