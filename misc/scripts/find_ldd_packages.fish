#!/usr/bin/env fish
for lib in (ldd $argv[1] | awk '{print $1}' );
	begin
		pkgfile $lib
		or echo ERROR:$lib
	end | head -n1
end | sort -u
