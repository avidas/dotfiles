#
# ~/.bash_functions
#

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

# In current directory, Recursive find and replace $1 with $2
replaceall()
{
  echo $1 $2
  grep -nirl $1 * | xargs sed -i "" -e 's/$1/$2/g'
}

# Git commit date modification
# bash cdc.sh @~1 2014-07-04 20:32:45
#
# commit
# date YYYY-mm-dd HH:MM:SS
gitcdc()
{
  commit="$1" datecal="$2"
  temp_branch="temp-rebasing-branch"
  current_branch="$(git rev-parse --abbrev-ref HEAD)"

  date_timestamp=$(gdate -d "$datecal" +%s)
  date_r=$(gdate -R -d "$datecal")

  if [[ -z "$commit" ]]; then
      exit 0
  fi

  git checkout -b "$temp_branch" "$commit"
  GIT_COMMITTER_DATE="$date_timestamp" GIT_AUTHOR_DATE="$date_timestamp" git commit --amend --no-edit --date "$date_r"
  git checkout "$current_branch"
  git rebase --committer-date-is-author-date "$commit" --onto "$temp_branch"
  git branch -d "$temp_branch"
}

