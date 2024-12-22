#!/usr/bin/env fish
set -l old_python_version (echo $argv[1])
set -l ignore $argv[2..(count $argv)]
echo $old_python_version
test -z $old_python_version ; and begin
	echo "Usage: "(status filename)" OLD_PYTHON_VERSION"
	exit 2
end

set -l pkglist ( \
	for path in /usr/lib/python$old_python_version/site-packages/ ; \
		pikaur -Qo $path ; \
	end \
	| co 5 \
)

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
echo
echo pikaur -S --rebuild --asdeps $pkglist
echo
echo and sudo pacman -D --asexplicit $explicit
echo
echo ignore= $ignore
