function svn
	if test (count $argv) -ge 2 ; and test $argv[2] = 'nocolor'
		set -l real_argv $argv[1]
		if test (count $argv) -ge 3
			set -l real_argv $real_argv $argv[3..(count $argv)]
		end
		env SVN_COLOR=never $HOME/scripts/svn-color.sh $real_argv
	else
		env SVN_COLOR=always $HOME/scripts/svn-color.sh $argv
	end
end

function _svn_check
	if test -z $SVN_USERNAME
		echo "SVN_USERNAME env var is not set"
		return 1
	end
end

function svn_ci
	if not _svn_check
		return 1
	end
	if test (count $argv) -lt 2
		echo "Usage: svn_ci 'message' ./file1 ./file2"
		return 2
	end
	set -l commit_message $argv[1]
	set -l commit_list $argv[2..(count $argv)]
	svn ci --username $SVN_USERNAME -m "$commit_message" $commit_list
end

function svn_st
	if test -f ./.svnignore
		if test (count $argv) -lt 1 ; or test $argv[1] != 'nocolor'
			echo "Using .svnignore:"
		end
		svn status $argv | grep -v -f ./.svnignore
	else
		set -l original_pwd (pwd)
		cd ..
		svn_st
		cd $original_pwd
	end
end

function svn_diff
	if test (count $argv) -lt 1
		for file in (svn_st nocolor $argv)
			svn diff -x -w (echo $file | sed -r 's/^.\s+//g')
		end
	else
		svn diff -x -w $argv
	end
end
