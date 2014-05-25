# Setup local branches to track all remote branches for a cloned repo
cloneall(){
	for branch in `git branch -a | grep remotes | grep -v HEAD | grep -v master `;
	do
   		git branch --track ${branch#remotes/origin/} $branch;
	done
}

# Colors on man pages
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}