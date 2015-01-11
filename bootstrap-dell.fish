#!/bin/fish
for i in (ls | grep -v -e tp -e \. -e theme);
	stow $i; or echo "failed: $i"
end

./change-theme.sh $argv
