for i in (ls | grep -v -e theme-tp -e \.md -e \.fish);
	stow $i; or echo "failed: $i"
end
