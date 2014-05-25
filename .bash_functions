# Setup local branches to track all remote branches for a cloned repo
cloneall(){
	for branch in `git branch -a | grep remotes | grep -v HEAD | grep -v master `;
	do
   		git branch --track ${branch#remotes/origin/} $branch;
	done
}