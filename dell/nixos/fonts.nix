{
	config,
	pkgs,
	lib,
	...
}:

{
	fonts = {
		enableCoreFonts = true;
		enableFontDir = true;
		enableGhostscriptFonts = true;
		fontconfig = {
			antialias = true;
			defaultFonts = {
				monospace = [
					"Source Code Pro"
					"Meslo LG S for Lcarsline"
					"DejaVu Sans Mono"
				];
				sansSerif = [
					"Ubuntu"
					"DejaVu Sans"
				];
				serif = [
					"PT Serif"
					"Liberation Serif"
				];
			};
			dpi = 120;
			hinting = {
				autohint = false;
				enable = true;
				style = "slight";
			};
			includeUserConf = true;
			#includeUserConf = false;
			subpixel = {
				lcdfilter = "default";
				rgba = "rgb";
			};
			ultimate.enable = false;
		};
		fonts = [
			pkgs.ubuntu_font_family
		];
	};
}

# vim: ft=conf:
