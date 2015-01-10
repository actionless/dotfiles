for i in (ls | grep -v -e dell -e \.md -e \.fish -e \.sh);
	stow $i; or echo "failed: $i"
end
