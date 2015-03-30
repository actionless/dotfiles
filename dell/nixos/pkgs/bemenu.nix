{ config, pkgs, lib, ... }:

pkgs.stdenv.mkDerivation rec {
	version = "0.201.1";
	name = "bemenu";
	src = pkgs.fetchurl {
		url = "https://github.com/Cloudef/bemenu/archive/d8097c44dda6205052c5213f4b69d05fc95f1589.tar.gz";
		sha256 = "1c22ig869lwi20mnxhp8jmyd3fl7d0vmd475vbiqwcgmmyrrra6z";
	};
	buildInputs = with pkgs; [
		intltool cmake
		xlibs.libX11 xlibs.libXinerama zlib xlibs.libXft
		ncurses
		# wayland support not enabled
	];
	meta = {
		homepage = "https://github.com/Cloudef/bemenu";
		description = "Dynamic menu library and client program inspired by dmenu with support for wayland compositors.";
		platforms = pkgs.stdenv.lib.platforms.linux;
	};
}
