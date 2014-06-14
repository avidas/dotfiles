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

#Lookup bash history and print top 20 most frequently used bash comments
top20() {
 history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -vE "./|\"|{|}|:|-|\[|\]" | column -c3 -s " " -t | sort -nr | nl | head -n20
 }

#Remind that certain projects might be getting stale
stale() {
    find $1 -type d -maxdepth 1 -mtime +30 -print0 | xargs -0 ls -ldtr
}

#Find files that might be junk and mail
#alternatively just delete files with names that I know are junk
findjunk() {
    find /Users/anadas/src/ -type d -mtime +90 -print0 | xargs -0 ls -ldtr | grep -E "tmp|junk"
}
