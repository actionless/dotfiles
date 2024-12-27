#!/usr/bin/env fish
set -l old_python_version (echo $argv[1])
test -z $old_python_version ; and begin
	echo "Usage: "(status filename)" OLD_PYTHON_VERSION [IGNORE_PKGS ...]"
	exit 2
end

set -l ignore $argv[2..(count $argv)]
set -l extra_grep_args
for arg in $ignore
	set -a extra_grep_args "-e" $arg
end

echo Looking for packages installed for Python version $old_python_version:
set -l pkglist ( \
	for path in /usr/lib/python$old_python_version/site-packages/ ; \
		pikaur -Qo $path ; \
	end \
	| co 5 \
	| grep -v \
		-e python(echo $old_python_version | tr -d ".") \
		$extra_grep_args \
)
echo (count $pkglist) packages found
echo

echo Checking package install status:
set -l explicit
for pkg in $pkglist
	echo -ne "."
	if pacman -Qi "$pkg" | grep -q "Installed as a dependency"
		true
	else
		set -a explicit $pkg
	end
end
echo

if test -n "$pkglist"
	echo
	echo pikaur -S --rebuild --asdeps $pkglist
	echo
	if test -n "$explicit"
		echo and sudo pacman -D --asexplicit $explicit
		echo
	end
else
	echo 👌😸 nothing to do
end
