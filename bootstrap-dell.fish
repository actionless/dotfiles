#!/bin/fish
for i in (ls | grep -v -e tp -e \. -e theme);
	stow $i; or echo "failed: $i"
end

if test -z $argv[1]
       	ls | grep theme- | bemenu | xargs stow
else
	stow $argv[1]
end
