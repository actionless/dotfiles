#!/bin/fish

for i in (ls | grep -v -e tp -e theme -e "\.");
	echo -n "$i: " ;
	if stow $i
		echo "ok"
	else
		echo "FAILED"
	end
end

./change-theme.sh $argv
