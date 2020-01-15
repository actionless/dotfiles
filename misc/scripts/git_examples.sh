#!/bin/bash

##########
# contents
##########

# contents
# notes
# script setup
# git config files
# local versioning within a single commit
# local versioning across commits
# local branches
# remote repos
# remote repos with multiple users
# commands that can change published commit history
# misc
# script cleanup

##########
# notes
##########

# this script creates repos in a sandbox directory and uses them for demos.
# add an exit command anywhere to stop the script and examine repo state.
# rerun the script freely. it cleans up the sandbox before each run.
# the sandbox dir is ignored so created files are not added to any uber repo.

# terminology

	# working, staged, committed <=> filesystem, index, commit graph
	# ref => a branch ref or a tag ref

# direction of git diff

	# "git diff commitA commitB", where commitA predates commitB, 
	# will show the changes required to transform commitA into commitB.
	# similarly, when diffing within a single commit 
	# (e.g., diff staged and committed),
	# git shows the changes needed to transform older state into newer state.
	# in this case, committed is "older", 
	# so git diff shows how to transform committed into staged.
	
# examining repo state

	# suggest to set the git la alias described below and run it often.
	# it's an easy way to visualize HEAD, branches, tags, and the commit graph.

##########
# script setup
##########

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
	# this gets the directory where the current script resides,
	# as long as the last element in the path is not a symlink.
	# https://stackoverflow.com/a/246128/2512141

cd $SCRIPT_DIR
mkdir -p $SCRIPT_DIR/sandbox

# if sandbox has unexpected content, stop script
EXP_CONT='\(repoA\|localA\|localB\|remoteUpstream\|remoteDownstream\)'
UNEXP_CONT=$(ls sandbox/ | sed "/$EXP_CONT/d" | wc -l)
if [[ $UNEXP_CONT -gt 0 ]]
then
	echo 'found some unexpected content in sandbox dir.'
	echo 'did you already have a directory named sandbox?'
	echo 'this script will clean out sandbox. best to run it from an empty dir.'
	exit
fi
rm -rf $SCRIPT_DIR/sandbox/*
	
# if no .gitignore or .gitignore doesn't have sandbox, ignore sandbox
if ! grep -q 'sandbox' ./.gitignore 2> /dev/null
then
	printf "sandbox\n" >> ./.gitignore
fi

##########
# git config files
##########

# list git configs with sources.
git config --list --show-origin
	#C:/Program Files/Git/mingw64/etc/gitconfig (system)
	#C:/Users/$USER/.gitconfig (global)
	#.git/config (local)
	#"C:\\ProgramData/Git/config" (Windows)
echo

git config --list --show-origin --system
echo

git config --list --show-origin --global
echo

git config --list --show-origin --local
echo

# configs in C:\\ProgramData/Git/config (Windows specific) are not 
# available through a flag.

# contents of global gitconfig
cat ~/.gitconfig
echo

# list aliases
git config --get-regexp alias
echo

# set alias.
#git config --global alias.la log --all --graph --oneline --decorate

# unset alias
#git config --global --unset alias.la

# add alias manually to global config.
# vim ~/.gitconfig
# [alias]
#     la = log --all --graph --oneline --decorate

# set username/email
# git config --global user.name "john smith"
# git config --global user.email "jsmith@domain.com"


##########
# local versioning within a single commit
##########

REPA=$SCRIPT_DIR/sandbox/repoA
mkdir -p $REPA
cd $REPA

# initialize
git init
git status 
	# "No commits yet"

# working -> staged
printf "apple\npear\npeach\n" >> fruits.txt
git add -A
	# prefer "-A" instead of "." because "-A" capture all changes in repo.
	# "." only captures changes in current dir.

# staged -> committed
git commit -m 'added apple, pear, peach'

# working <- staged <- committed 
# (copy commited to working and staged, and clean up untracked files and dirs)
# CAUTION: this will permanently erase files that are not committed.
# consider committing and then reverting to a previous commit instead.
printf "cherry\n" >> fruits.txt
git add fruits.txt
	# now cherry is staged.
printf "apricot\n" >> fruits.txt
	# apricot is not staged, only exists in working.
printf "sourdough\n" >> breads.txt
	# file breads.txt is untracked.
mkdir other
printf "potato\n" >> other/vegetables.txt
	# directory other is untracked.
git status --untracked-files=all 
	# -u for short. shows individual files, not just dirs.

git reset --hard HEAD
git clean -x -d -n
	# -x: disregard .gitignore exclusions when cleaning up
	# -d: clean directories as well
	# -n: trial run only
	# no way to list files inside of directories, unfortunately.
git clean -x -d -f
	# -f: force
	

# staged <- committed
printf "cherry\n" >> fruits.txt
git add fruits.txt
printf "apricot\n" >> fruits.txt
	# working has cherry and apricot, staged has cherry only.
	
git reset --mixed HEAD
	# staged no longer has cherry.
	# note that --mixed is the default mode for reset.

# working <- staged 
git checkout . 
	# working no longer has cherry or apricot.
	# note: checkout doesn't support -A flag like add.

# working <- staged, single file
printf "cherry\n" >> fruits.txt
git checkout fruits.txt
	

# compare working, staged
printf "lemon\n" >> fruits.txt
git add fruits.txt 
	# stages lemon
printf "lime\n" >> fruits.txt 
	# lime is only in working directory

git diff
	# for this and other diff examples, append 
	# " -- fruits.txt" to limit diff to one file.

# compare staged, committed
git diff --cached

# compare working, committed
git diff HEAD

# remove file from working, staged, and committed
printf "shiitake\n" >> mushrooms.txt
git add -A
git commit -m 'added shiitake'

rm mushrooms.txt
git add -A
git commit -m 'removed mushrooms.txt'

# leave file in working, ignore it, and remove from staged and committed
# CAUTION: the file can be deleted by git clean.
printf "oat\n" >> milks.txt
git add -A
git commit -m 'added oat to milks.txt'

git rm --cached milks.txt
printf "milks.txt\n" >> .gitignore
git add -A
git commit -m 'moved milks.txt to gitignore'
git status
cat milks.txt

##########
# local versioning across commits
##########

# see which commit HEAD is pointed to
git rev-parse HEAD
git rev-parse master
git log --all --oneline --graph --decorate

# compare two commits
printf "strawberry\n" >> fruits.txt
git add -A
git commit -m 'added strawberry'

git diff HEAD^ HEAD
git diff HEAD~1 HEAD
git diff @~1 @
git diff @~1 @ -- fruits.txt
	# -- fruits.txt limits diff to that file.

git diff master~1 master

# see what a file looked like in a previous commit
git show HEAD~2:fruits.txt > tmp.txt
cat tmp.txt
rm tmp.txt

# see what a file looked like at a certain date/time (must specify branch)
#git show master@{2019-10-02}:fruits.txt
#git show master@{"2019-10-02 20:39:04"}:fruits.txt

# create a commit which restores the state of a previous commit

# first, notes on what not do do.
# checkout and reset can modify history, so don't use those.
# https://www.atlassian.com/git/tutorials/resetting-checking-out-and-reverting

# another caution against using git reset:
# https://www.atlassian.com/git/tutorials/undoing-changes/git-revert

# now, the correct way:

printf "banana\n" >> fruits.txt
git add -A
git commit -m 'added banana'

printf "kiwi\n" >> fruits.txt
git add -A
git commit -m 'added kiwi'

printf "pineapple\n" >> fruits.txt
git add -A
git commit -m 'added pineapple'

printf "mango\n" >> fruits.txt
git add -A
git commit -m 'added mango'

# we wish to revert all the changes that came after banana.
git revert --no-commit HEAD~3..HEAD
	# --no-commit flag avoids generation of a commit for each reverted commit.
cat fruits.txt
git diff HEAD
	# shows the changes we will make in the upcoming commit.
git commit -m 'reverting all changes after banana'

##########
# local branches
##########

# list local branches
git branch -l
	# -l for local, -a for all, -r for remote. -l is default.

# create a branch
git branch sweet_fruits

# switch to a branch
git checkout sweet_fruits

# create and switch to a branch
git checkout -b sour_fruits

# rename a branch
git branch -m sweet_fruits sugary_fruits
git branch -l
git branch -m sugary_fruits sweet_fruits
git branch -l

# you can modify working and staged and later decide where to commit them.
printf "grape\n" >> fruits.txt
git add -A
printf "cantaloupe\n" >> fruits.txt
git status

git checkout master
git log --all --oneline --graph --decorate
git checkout sweet_fruits
git log --all --oneline --graph --decorate
git checkout sour_fruits
git log --all --oneline --graph --decorate

# commit changes to a particular branch
git checkout sweet_fruits
git add -A
git commit -m 'added grape and cantaloupe'
git log --all --oneline --graph --decorate

# diverged branches
git checkout sour_fruits
printf "grapefruit\n" >> fruits.txt
git add -A
git commit -m 'added grapefruit'
git log --all --oneline --graph --decorate

# merging and merge conflicts
git checkout master
git merge sweet_fruits
	# fast-forward merge (master is ancestor of sweet_fruits in commit graph).
	# no commit object is created, so no commit message required.
git log --all --oneline --graph --decorate
	
git merge sour_fruits
	# conflict! sweet_fruits and sour_fruits both modified fruits.txt.
	
sed '/[<<<|>>>|===]/d' ./fruits.txt >> tmp.txt;
rm fruits.txt
mv tmp.txt fruits.txt
git add -A
git commit -m 'resolved conflicts and merged sour_fruits'
	# this commit takes us out of conflict state and completes the merge.
git log --all --oneline --graph --decorate

# delete a local branch that has been merged
git branch -d sweet_fruits
git branch -d sour_fruits

# delete a local branch that has not been merged
git checkout -b savory_fruits
printf "???\n" >> fruits.txt
git add -A
git commit -m 'cannot think of any savory fruits'
git checkout master
	# cannot delete the branch if it is checked out, so we switch.
git branch -d savory_fruits
	# warning
git branch -D savory_fruits
git log --all --oneline --graph --decorate

# note: because a branch is simply a pointer to a commit object,
# deleting the branch does not delete the commit.
# we can still find the savory_fruits commit with git reflog.
# and, if we wish, we can reattach a branch to the commit and recover it.
# (not shown.)

# detached HEAD
# this is when we point HEAD directly to a commit instead of a branch ref.
# this can happen in several ways. for example:
# - point HEAD to a past commit which has no branch ref.
# - point HEAD to a commit where the branch ref was deleted.
# - point HEAD to a commit using a tag.
# to fix detached HEAD, just checkout a commit that has a branch ref.

# if you commit when in detached HEAD state, git will still create a new commit,
# but that commit object will have no branch ref 
# and therefore won't be discoverable in the commit graph after you leave it.
# if you are in detached HEAD and have made changes you need to preserve,
# commit your changes and then create a branch at that commit.

printf "watermelon\n" >> fruits.txt
git add -A
git commit -m 'added watermelon'
git tag -a watermelonTag -m 'tagging watermelon'

printf "honeydew\n" >> fruits.txt
git add -A
git commit -m 'added honeydew'

git checkout watermelonTag
	# detached HEAD warning
git checkout master
	# detached HEAD warning gone

git checkout watermelonTag
	# detached HEAD warning
printf "raisin\ncurrant\nprune\n" >> dried_fruits.txt
git add -A
git commit -m 'added raisin, currant, prune'
	# succeeds, creates new commit. HEAD points to new commit.
	# but new commit has no branch ref.
git checkout -b dried_fruits
	# now commit has a branch ref.
	# we can switch to master and merge it in.
git checkout master
git merge dried_fruits -m 'merged dried fruits'
	# this is not a fast-forward merge, so a new commit object will be created.
	# we must supply a message for that new commit.
	

# take single-file changes from another branch
git checkout -b dressings
printf "balsamic\nred\n" >> vinaigrettes.txt
printf "french\nitalian\n" >> sauces.txt
git add -A
git commit -m 'added balsamic, red, french, italian'

git checkout master
git checkout dressings -- vinaigrettes.txt
git add -A
git commit -m 'added balsamic, red'


##########
# remote repos
##########

# git allows us to treat a repo on local disk the same as
# a repo that lives in a hosting service like github.
# we will create bare repos on disk and 
# pretend they are remote for demo purposes.
# (a bare repo has no working or staged area.)

REMUP=$SCRIPT_DIR/sandbox/remoteUpstream
LOCA=$SCRIPT_DIR/sandbox/localA

mkdir -p $REMUP
cd $REMUP
git init --bare


# two ways to create a local repo and associate remote:
# 1) init locally and add remote manually. (commented out)
# 2) clone remote. (uncommented) 
	# this 2nd approach copies down any repo content if it exists.
	# also, it sets the default fetch/push location for the local master branch.

# 1) init locally
#mkdir -p $LOCA
#cd $LOCA
#git init
#ls -a
#git remote add remUp $REMUP
#	# note: we are departing slightly from convention here.
#	# normally, we name the remote repo "origin", not "remUp".

# 2) clone remote
cd $SCRIPT_DIR/sandbox
git clone -o remUp $REMUP $LOCA
	# if we omit the -o <name> param, git will 
	# give the remote the default name, "origin".
cd $LOCA

# push some content to the remote repo
printf "pinto\n" >> legumes.txt
git add -A
git commit -m 'added pinto'
printf "lima\n" >> legumes.txt
git add -A
git commit -m 'added lima'

# 1) init locally
#git push remUp master
#git branch --set-upstream-to=remUp/master

# 2) clone remote
git push

# list remotes
git remote -v
git remote show remUp

# see which remote branch the local master branch is tracking
git branch -avv

# rename a remote
git remote rename remUp remFoo
git remote -v
git remote rename remFoo remUp
git remote -v

# add a remote
git remote add remBar ./../bar
	# (dir does not exist)

# delete a remote
git remote remove remBar

# in most workflows, a coder will pull code from an upstream repo,
# edit it, and push it back to the upstream repo, possibly in a new branch.
# in other cases, it is useful to pull code from an upstream repo,
# edit it, and then push the edited code to a separate downstream repo.
# we demonstrate this latter workflow now so we can more fully explore
# manipulation of remotes.

REMDN=$SCRIPT_DIR/sandbox/remoteDownstream
mkdir -p $REMDN
cd $REMDN
git init --bare

# add a downstream remote
cd $LOCA
git remote add remDn $REMDN

# push to a downstream remote
git push remDn master

# configure master branch to push to downstream remote by default
git branch -avv
git branch --set-upstream-to=remDn/master
git branch -avv
	# note: the terminology here is confusing.
	# there is not really a good way to get around that.
	# a branch may have only one remote associated as its default,
	# and that remote is set with "--set-upstream-to", regardless of its use.
	# the default remote is used for fetch and push commands run without args.
	
	# it is possible to configure a remote to use different fetch and push urls.
	# this means we could configure a branch to have a default remote which
	# pulls from one repo and pushes to another repo.
	# however, this breaks the convention that a remote represents one "repo".
	# also, the convention used by github is to define a separate remote
	# for each push or pull location.
	# https://stackoverflow.com/a/47959803/2512141
	# https://stackoverflow.com/q/9257533/2512141
	
	# summarizing:
	# a repo has multiple branches.
	# a branch has one default remote (set with "--set-upstream-to").
	# a remote has a fetch url and a push url.

# now that default is set, we can push to downstream remote without args
printf "chickpea\n" >> legumes.txt
git add -A
git commit -m 'added chickpea'
git push



# downstream demo is done, point master back to upstream by default
git branch --set-upstream-to=remUp/master
git push

# add a branch, push it to remote, and list local and remote branches
git checkout -b are_these_beans
printf "green bean\nsoybean\nsnap peas\n" >> legumes.txt
git add -A
git commit -m 'added green bean, soybean, snap pea'
git branch -avv
git push
	# "fatal: No configured push destination"
	# this is a new branch, so it doesn't have push configured yet.
git push remUp
	# "fatal: The current branch are_these_beans has no upstream branch."
git push remUp are_these_beans
git branch -avv
git branch --set-upstream-to=remUp/are_these_beans
git branch -avv

# delete a local branch and the remote branch it tracks
# an aside: this is the highest-voted SO post i've ever seen:
# https://stackoverflow.com/q/2003505/2512141

git checkout master
git push remUp --delete are_these_beans
	# delete the remote branch first (allows tab completion for remote).
git branch -D are_these_beans

##########
# remote repos with multiple users
##########

# create a second local repo.
LOCB=$SCRIPT_DIR/sandbox/localB
cd $SCRIPT_DIR/sandbox
git clone $REMUP $LOCB
	# no name arg passed, so git will create remote with default name, "origin".
cd $LOCB
ls -a
git log --all --graph --oneline --decorate
cat legumes.txt

# merging another user's changes
cd $LOCA
printf "mung\n" >> legumes.txt
git add -A
git commit -m 'added mung'
git push

cd $LOCB
git status
git log --all --graph --oneline --decorate
	# local B is not yet aware that anything has changed in the upstream repo.
git fetch
	# makes local repo aware of all changes in remote repo, across all branches.
git status
git log --all --graph --oneline --decorate
	# now the changes are visible. we can merge them into local master.
git merge

# merging another user's changes with conflict
cd $LOCA
printf "ricebean\n" >> legumes.txt
git add -A
git commit -m 'added ricebean'
git push

cd $LOCB
printf "lentil\n" >> legumes.txt
git add -A
git commit -m 'added lentil'

git fetch
git status
git log --all --graph --oneline --decorate
	# notice repo localB has diverged from origin/master.
git merge
	# conflict
sed '/[<<<|>>>|===]/d' ./legumes.txt >> tmp.txt;
rm legumes.txt
mv tmp.txt legumes.txt
git add -A
git commit -m 'resolved merge conflict'

git log --all --graph --oneline --decorate
git status
	# "Your branch is ahead of 'origin/master' by 2 commits."
	# the upstream repo and repoA are not aware of the resolved merge.
git push

cd $LOCA
git pull
	# does a fetch and merge
cat legumes.txt

# adding a branch added by another user
cd $LOCA
git checkout -b grains
printf "millet\n" >> grains.txt
git add -A
git commit -m 'added millet'
git push remUp grains

cd $LOCB
git fetch
git branch -a
git log --all --graph --oneline --decorate
	# note: although origin/grains is present, there is no local grains branch
	
git checkout -b bGrains origin/grains
	# creates a local branch based on the newly copied remote branch.
	# observe that local branch name is not required to match remote branch.
	# however, by convention local branch name should match the remote.
git branch -m bGrains grains
	# rename bGrains to grains


# cleaning up a branch deleted by another user
cd $LOCA
git checkout master
git push remUp --delete grains
git branch -D grains

cd $LOCB
git fetch
git branch -a
	# note: origin/grains is still visible. fetch did not delete it.
git fetch --prune
git branch -a
	# now origin/grains is gone.
git checkout master
git branch -D grains
	# delete local branch that was tracking remote branch.




##########
# commands that can change published commit history
##########

# use these with caution.
# if working on a shared repo, changing and pushing commit history will
# break the repo for your collaborators.

cd $SCRIPT_DIR/sandbox/repoA

# reset --soft
# git reset --soft takes the branch tag that HEAD points to
# and moves it backwards in the graph without changing working or staged.
# if you reset --soft and then commit, it has the effect of "squashing"
# multiple commits into a single commit.

printf "almond\n" >> nuts.txt
git add -A
git commit -m 'added almond'

printf "cashew\n" >> nuts.txt
git add -A
git commit -m 'added cashew'

printf "pecan\n" >> nuts.txt
git add -A
git commit -m 'added pecan'

git log --all --graph --oneline --decorate
git reset --soft HEAD~3
git commit -m 
git log --all --graph --oneline --decorate


# interactive rebase, squash
printf "celery\n" >> vegetables.txt
git add -A
git commit -m 'added celery'

printf "carrot\n" >> vegetables.txt
git add -A
git commit -m 'added carrot'

printf "plum\n" >> fruits.txt
git add -A
git commit -m 'added plum'

printf "tomato\n" >> vegetables.txt
git add -A
git commit -m 'added tomato'

printf "onion\n" >> vegetables.txt
git add -A
git commit -m 'added onion'

# we wish to rebase such that the fruit commit comes first, 
# and the vegetable commits are squashed together.
# unfortunately, interactive rebase can't be done cleanly by script.
# steps are described instead:
# git rebase -i HEAD~5
# in editor, move plum to the top, 
# leave celery as pick,
# and change carrot, tomato, and onion action to "squash"
# finally, in commit message editor, 
# remove all lines and write a single commit line for the squashed veg commits:
# add carrot, tomato, onion

# amend
# affects only the most recent commit.
# useful if you forgot to include a file in the last commit or
# if you have a minor change which you want to add to the last commit.
printf "papaya\n" >> fruits.txt
printf "broccoli\n" >> vegetables.txt
git add fruits.txt
git commit -m 'added papaya'
git log --all --graph --oneline --decorate
git add vegetables.txt
git commit --amend -m 'added papaya, broccoli'
	# if you don't want to change the commit message, use arg --no-edit.
git log --all --graph --oneline --decorate

##########
# misc
##########

# "*" vs "." vs "-A"

	# "git add *" is intercepted by the shell and 
	# git gets a list of files in the current dir.
	# the list will not include files that begin with ".".

	# "git add ." is not intercepted by the shell, 
	# and git will interpret it to mean all files in the current dir and down.
	# https://stackoverflow.com/q/26042390/2512141

	# "git add -A" adds all changes from repo root down, 
	# regardless of where it is called.
	
# "origin/master" vs "origin master"

	# roughly, "origin/master" is a branch ref which refers to a
	# local copy of a remote branch and is used in local operations,
	# while "origin master" is used in commands that 
	# actually change the remote repo.

# git checkout vs git reset

	# git checkout moves only HEAD, and copies contents 
	# of addressed commit to staged and working.
	# git reset moves HEAD and HEAD's tag, then copies to staged 
	# and working, depending on flags.
	# git reset can alter pushed history (use caution).
	# https://stackoverflow.com/q/3639342/2512141

# .gitignore syntax
	
	# a "/" at the beginning or middle of an ignore pattern means the pattern
	# will use the location of the .gitignore file as root.
	
	# patterns without a "/" at the beginning or middle apply everywhere.
	
	# patterns with "/" at the beginning or middle can be made to apply anywhere
	# by preceding with "**".
	
	# it is possible to use multiple .gitignore files in a repo.

	# *.txt
		# ignore all files that end with ".txt".
	# foo
		# ignore all files and directories named "foo".
	# foo/
		# ignore all directories named "foo".
	# /foo
		# ignore file or directory named "foo" in repo root.
	
	# /foo/bar
		# ignore file or directory "bar" in repo root directory "foo"
	# **/foo/bar
		# ignore all files and directories "bar" which live in a dir "foo".

# not covered

	# stashing
	# patching
	# switch and restore
		# experimental functions added Aug 2019 in git 2.23.
		# https://github.blog/2019-08-16-highlights-from-git-2-23/
		# https://www.infoq.com/news/2019/08/git-2-23-switch-restore/
		# https://git-scm.com/docs/git-restore
		# in short, functionality of git checkout is split: 
		# switch changes branches and restore reverts files.
	# cherry pick
		# was going to cover, then found this series of blog posts:
		# https://devblogs.microsoft.com/oldnewthing/?p=98245
		# omitting until i have understood the warning.



# create a tag and push to remote
cd $LOCA
git checkout master
printf "tangerine\n" >> fruits.txt
git add -A
git commit -m 'added tangerine'
git push

git tag -a tangerineTag -m 'tagging tangerine'
git push --tags
git log --all --graph --oneline --decorate
git ls-remote --tags remUp
	# git tag -r would have been more natural here...

# remove a tag and delete from remote
git tag -d tangerineTag
git push --delete remUp tangerineTag
git log --all --graph --oneline --decorate
git ls-remote --tags remUp

##########
# script cleanup
##########

echo 'goodbye'

