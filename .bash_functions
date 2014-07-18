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

# Extract zip files of different types. Because http://xkcd.com/1168/
# Source http://www.quora.com/Bash-shell/What-are-some-bash-aliases-that-you-use-often
extract()                                               
{                                                                                
   if [ -f $1 ] ; then                                                           
      case $1 in                                                                 
   *.tar.bz2)   tar xvjf $1     ;;                                               
   *.tar.gz)    tar xvzf $1     ;;                                               
   *.bz2)       bunzip2 $1 ;;                                                    
   *.rar) unrar x $1 ;;                                                          
   *.gz) gunzip $1 ;;                                                            
   *.tar) tar xvf $1 ;;                                                          
   *.tbz2) tar xvjf $1 ;;                                                        
   *.tgz) tar xvzf $1 ;;                                                         
   *.zip) unzip $1 ;;                                                            
   *.Z) uncompress $1 ;;                                                         
   *.7z) 7z x $1 ;;                                                              
   *) echo "'$1' cannot be extracted via >extract<" ;;                           
      esac                                                                       
   else                                                                          
      echo "'$1' is not a valid file"                                            
   fi                                                                            
}

unbase64()
{   
    echo $1 | base64 -d
}


# http://stackoverflow.com/questions/6759791/how-do-i-move-forward-and-backward-between-commits-in-git
# Go forward in Git commit hierarchy, towards particular commit 
# Usage:
#  gofwd v1.2.7
# Does nothing when the parameter is not specified.
gofwd() {
  git checkout `git rev-list --topo-order HEAD.."$*" | tail -1`
}

# Go back in Git commit hierarchy
# Usage: 
#  goback
alias goback='git checkout HEAD~'

# Stash current work and and git bisect with given good and 
# bad commit ids, running given script that exits with 0 on failure
# and positive number on success
gbisect() {
    if [ "$#" -ne 1 ]; then
        echo "gbisect good-commit-id bad-commit-id script <arguments>"
    else
        git stash
        git checkout HEAD
        git bisect start
        git bisect good $1
        shift
        git bisect bad $1
        shift
        git bisect run "$@"
        git bisect log
        git bisect reset
        git stash list
        git stash apply
    fi
}
