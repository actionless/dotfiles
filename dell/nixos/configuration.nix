{
	config,
	pkgs,
	lib,
	...
}:

{
	imports = [
		# Include the results of the hardware scan.
		./hardware-configuration.nix
		./pkgs/spotify/default.nix
	];

	# Use the GRUB 2 boot loader.
	boot.loader.grub.enable = true;
	boot.loader.grub.version = 2;
	# Define on which hard drive you want to install Grub.
	boot.loader.grub.device = "/dev/sda";

	networking.hostName = "NSS-RottenVogel"; # Define your hostname.
	networking.hostId = "199a2f00";
	networking.wireless.enable = true; # Enables wireless.

	# Select internationalisation properties.
	time.timeZone = "Europe/Prague";
	i18n = {
		consoleFont = "lat9w-16";
		consoleKeyMap = "us";
		defaultLocale = "en_US.UTF-8";
	};

	hardware.pulseaudio.enable = true;


	nixpkgs.config.allowUnfree = true;
	nixpkgs.config.clementine.spotify = true;

	nixpkgs.config.packageOverrides = pkgs: rec {
		awesome = ( pkgs.lib.overrideDerivation pkgs.awesome (attrs: {
			src = pkgs.fetchurl {
				url = "https://github.com/awesomeWM/awesome/archive/07486f7ead25cae4ba1a301ce2af809fab070dbf.tar.gz";
				sha256 = "17wxirhb7nyr7aqfligw6cj1i3lm6fc08760pgdsv1k4yl0s48rh";
			};
		}));

		qt48 = (pkgs.qt48.override { gtkStyle = true; });
		gst_plugins_bad = ( pkgs.lib.overrideDerivation pkgs.gst_plugins_bad (attrs: {
			buildInputs = pkgs.gst_plugins_bad.buildInputs ++ [ pkgs.faac pkgs.faad2 ];
		}));
		clementine = ( pkgs.lib.overrideDerivation pkgs.clementine (attrs: {
			buildInputs = pkgs.clementine.buildInputs ++ [
				pkgs.gst_plugins_bad
				pkgs.gst_ffmpeg
			];
		}));
	};

	# List packages installed in system profile. To search by name, run:
	# $ nix-env -qaP | grep wget
	environment.systemPackages = with pkgs; [

		# CLI apps
		wget
		vim
		#vimPlugins.vim-addon-nix
		git
		fish
		which
		file
		tmux
		tree
		ncdu
		irssi

		# theming stuff
		gtk_engines
		gtk-engine-murrine
		hicolor_icon_theme
		gnome3.gnome_themes_standard
		gnome3.gnome_icon_theme
		gnome3.gnome_icon_theme_symbolic
		qt48
		lxappearance

		# GUI apps
		pavucontrol
		firefox
		xarchiver
		nitrogen
		dmenu2
		(callPackage ./pkgs/bemenu.nix {})
		mpv
		spotify
		transmission_gtk
		clementine

		pcmanfm
		menu-cache
		(callPackage ./pkgs/lxmenu_data.nix {})


		# deps for my scripts
		lm_sensors
		procps
		stow

	];

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

	# List services that you want to enable:
	services = {
		# Enable CUPS to print documents.
		# printing.enable = true;
		# Enable the OpenSSH daemon.
		openssh.enable = true;
		# Enable the X11 windowing system.
		xserver = {
			enable = true;
			layout = "us";
			xkbOptions = "eurosign:e";
			#videoDrivers = [ "nvidia" ];
			#deviceSection = ''
				#Option "metamodes" "nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
			#'';
			videoDrivers = [ "nouveau" ];
			deviceSection = ''
				Option "GLXVBlank" "true"
			'';
			vaapiDrivers = [ pkgs.vaapiVdpau ];
			desktopManager.xterm.enable = false;
			windowManager.awesome.enable = true;
			windowManager.session = lib.singleton {
				name = "awesomenoargb";
				start = ''
					${lib.concatMapStrings
						(pkg: ''
							export LUA_CPATH=$LUA_CPATH''${LUA_CPATH:+;}${pkg}/lib/lua/${pkgs.awesome.lua.luaversion}/?.so
							export LUA_PATH=$LUA_PATH''${LUA_PATH:+;}${pkg}/lib/lua/${pkgs.awesome.lua.luaversion}/?.lua
						'')
						config.services.xserver.windowManager.awesome.luaModules
					}
					${pkgs.awesome}/bin/awesome --no-argb &
					waitPID=$!
				'';
			};
		};
		nixosManual.enable = true;
	};

	#Define a user account. Don't forget to set a password with ‘passwd’.
	users.extraUsers.lie = {
		isNormalUser = true;
		uid = 1000;
	};
	security.sudo.extraConfig = ''
      lie     ALL=(ALL) SETENV: ALL
	'';
}

# vim: ft=conf:
