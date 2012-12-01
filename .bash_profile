alias gs="git status"
alias ga="git add ."
alias gc="git commit -am"
alias gsvnc="git svn dcommit"
alias gsvng="git svn rebase"
alias gpm="git push origin master"
alias gk="gitk --all &"
alias gpl="git pull"
alias gph="git push "
alias gm="git merge "
alias gfix="git mergetool"

function vs12(){
/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 11.0/Common7/IDE/devenv $1.sln&
}

function vs10(){
/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 10.0/Common7/IDE/devenv $1.sln&
}

function gsvnclone(){
	git svn clone $1 --authors-file=/c/Projects/authors-transform.txt --no-metadata -s $2
	cd $2
	
	if [ -d .git/refs/remotes/tags ]; then
	cp -Rf .git/refs/remotes/tags/* .git/refs/tags/
	rm -Rf .git/refs/remotes/tags
	fi

	if [ -d .git/refs/remotes ]; then
	cp -Rf .git/refs/remotes/* .git/refs/heads/
	rm -Rf .git/refs/remotes
	fi

	git branch -D trunk
}


function newSolution(){
	echo "Microsoft Visual Studio Solution File, Format Version 11.00
	# Visual Studio 2010
	Global
		GlobalSection(SolutionProperties) = preSolution
				HideSolutionNode = FALSE
					EndGlobalSection
					EndGlobal" > $1.sln
}


function gac(){
	git add .
	git commit -am "$1"
}

function creategi(){ 
echo "# Visual Studio left-overs
*.suo        # 'user' settings like 'which file is open in Visual Studio'
*.ncb        # Used for debugging
*.user
*.ccscc      # Used for versioning
*.cache

# Editor left-overs
*~           # (x)emacs
*.bak        # Windows related
\#*\#        # (x)emacs
*.orig       # Own usage

# Compiled files
*/bin/
*/obj/
*/Obj/       # git is case sensitive
*/Generated_Code/
PrecompiledWeb
*ClientBin
*.[Oo]bj
*.user
*.aps
*.pch
*.vspscc
*.vssscc
*_i.c
*_p.c
*.ncb
*.suo
*.tlb
*.tlh
*.bak
*.[Cc]ache
*.ilk
*.log
*.lib
*.sbr
*.sdf
*.datasource
ipch/
obj/
[Bb]in
[Dd]ebug*/
[Rr]elease*/
*.orig

App_Data/
# Windows left-overs
Thumbs.db    # Having images in the source tree generates those files in Explorer

# Resharper Files
_ReSharper.*
*.resharper.user" > .gitignore
}
