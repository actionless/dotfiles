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
    ./fonts.nix
    ./xserver.nix
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

    st = ( pkgs.lib.overrideDerivation pkgs.st (attrs: {
      src = pkgs.fetchgit {
        url = "git://git.suckless.org/st";
        sha256 = "0d2wzxwb4wfw3wrdanacmjkm7hd3phbfj3kvhxiyvsv623mmq29a";
      };
      preBuild = ''
        cp /etc/nixos/pkgs/st/config.h config.def.h &&
        patch -i /etc/nixos/pkgs/st/enable_transparency_options.diff
      '';
    }));

    qt48 = (pkgs.qt48.override {
      gtkStyle = true;
    });
    gst_plugins_bad = ( pkgs.lib.overrideDerivation pkgs.gst_plugins_bad (attrs: {
      buildInputs = pkgs.gst_plugins_bad.buildInputs ++ [
        pkgs.faac
        pkgs.faad2
      ];
    }));
    clementine = ( pkgs.lib.overrideDerivation pkgs.clementine (attrs: {
      buildInputs = pkgs.clementine.buildInputs ++ [
        pkgs.gst_plugins_bad
        pkgs.gst_ffmpeg
      ];
    }));

    pcmanfm = ( pkgs.lib.overrideDerivation pkgs.pcmanfm (attrs: {
      buildInputs = pkgs.pcmanfm.buildInputs ++ [
        #pkgs.gvfs
        pkgs.gnome3.gvfs
        #pkgs.gnome.gnome_menus
        pkgs.shared_mime_info
        (pkgs.callPackage ./pkgs/lxmenu_data.nix {})
      ];
    }));
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [

    # CLI apps
    vimHugeX
    vimPlugins.YouCompleteMe # rest is handled by vim-Plug
    python27Full  # needed for YCM
    git
    wget
    inetutils # hostname, whois etc
    which
    file
    psmisc # killall
    fish
    tmux
    tree
    ncdu
    irssi
    scrot
    htop

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
    st
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
    gnome3.eog
    evince
    hexchat
    audacious

    pcmanfm
    (callPackage ./pkgs/lxmenu_data.nix {})
    #
    shared_mime_info
    #
    menu-cache
    gnome.gnome_menus

    # deps for my scripts
    awesome # awesome-client
    lm_sensors
    procps # top
    stow
    xsel

  ];

  services = {
    # printing.enable = true;
    openssh.enable = true;
    nixosManual.enable = true;
    upower.enable = true;
    gnome3.gvfs.enable = true;
  };

  users.extraUsers.lie = {
    isNormalUser = true;
    uid = 1000;
  };
  security.sudo.extraConfig = ''
      lie     ALL=(ALL) SETENV: ALL
  '';

}

