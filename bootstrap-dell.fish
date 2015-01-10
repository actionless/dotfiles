#!/bin/fish
for i in (ls | grep -v -e tp -e \.md -e \.fish -e \.sh);
	stow $i; or echo "failed: $i"
end
