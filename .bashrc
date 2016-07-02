#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.git-prompt.sh

PS1="[\u@\h:\w] $\n"

PS1="[\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]:\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]]$\n"

export VIRTUALENVWRAPPER_PYTHON=/usr/sbin/python2
source $(which virtualenvwrapper_lazy.sh)
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home/"

export ANDROID_HOME="/Users/anadas/Downloads/adt-bundle-mac-x86_64-20131030/sdk"
export PATH="/opt/apache-maven-3.3.9/bin:$PATH"
# added by Anaconda 1.9.2 installer
export PATH="/Users/anadas/anaconda/bin:$PATH"
export GOPATH="$HOME/src/golang/"
if ! [ -L "/usr/local/bin/subl" ]; then
    ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/
fi

#clang needs to know all flags for CPython build
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

# Always enable GREP colors
export GREP_OPTIONS='--color=auto'

#save command history for all terminals
shopt -s histappend
export PROMPT_COMMAND='history -a'

# Remove duplicates from history
export HISTCONTROL=erasedups

# Increase history size
export HISTSIZE=10000

#spellcheck typos in cd
shopt -s cdspell

# complete sudo and man-pages
complete -cf sudo man

# Separate aliases file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi 

# Separate aliases file for work
if [ -f ~/.bash_aliases_work ]; then
    . ~/.bash_aliases_work
fi 

# Separate aliases file for personal
if [ -f ~/.bash_aliases_personal ]; then
    . ~/.bash_aliases_personal
fi 

# Separate functions file
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# Separate functions file for personal
if [ -f ~/.bash_functions_personal ]; then
    . ~/.bash_functions_personal
fi

# Separate functions file for work
if [ -f ~/.bash_functions_work ]; then
    . ~/.bash_functions_work
fi

# Git auto completion
if [ -f ~/git-completion.bash ]; then
    . ~/git-completion.bash
fi

# PHP composer binaries (e.g. phpunit)
if [ -d ~/.composer/vendor/bin/ ]; then
      export PATH=$PATH:~/.composer/vendor/bin/
fi
export PATH="$PATH:/Users/anadas/.bin"
export PATH="$PATH:/usr/local/mysql/bin/"
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/mysql/lib/
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/Users/anadas/Downloads/adt-bundle-mac-x86_64-20131030/sdk/tools:/Users/anadas/Downloads/adt-bundle-mac-x86_64-20131030/sdk/platform-tools"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
rvm use ruby-2.2.1

export NVM_DIR="/Users/anadas/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

fortune -s | cowsay

# Docker
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.101:2376"
export DOCKER_CERT_PATH="/Users/anadas/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"
# Run this command to configure your shell: 
eval "$(docker-machine env default)"
export EDITOR=/Applications/TextEdit.app/Contents/MacOS/TextEdit
