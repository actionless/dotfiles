#!/usr/bin/env fish
set -l old_python_version (echo $argv[1])
echo $old_python_version
test -z $old_python_version ; and begin
	echo "Usage: "(status filename)" OLD_PYTHON_VERSION"
	exit 2
end

pikaur -S --rebuild ( \
	for path in /usr/lib/python$old_python_version/site-packages/ ; \
		pikaur -Qo $path ; \
	end \
	| co 5 \
)
