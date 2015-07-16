{ config, pkgs, lib, ... }:

pkgs.stdenv.mkDerivation rec {
	version = "0.1.4";
	name = "lxmenu-data";
	src = pkgs.fetchurl {
		url = "http://ftp.osuosl.org/pub/blfs/conglomeration/lxmenu-data/lxmenu-data-0.1.4.tar.xz";
		sha256 = "8802fbc88e4cac80dbf0a2926deb30eeb127c54b93254d7bda591cbe174bfb1c";
	};
	preBuild = "patchShebangs ./scripts";
	buildInputs = with pkgs; [
		intltool
	];
	meta = {
		homepage = "http://www.lxde.org";
		description = "freedesktop.org desktop menus for LXDE";
		platforms = pkgs.stdenv.lib.platforms.linux;
	};
}
