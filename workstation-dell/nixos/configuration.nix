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

  networking.firewall.enable = false;

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
      src = pkgs.fetchgit {
        url = "git://github.com/actionless/awesome.git";
        rev = "3bcb6a2a89dfbaa19c9c55fc82632e8439fbc5d2";
        sha256 = "1f26zc0fzqdwfwjmgqxhp225ijw64qvla07v0ws9wrgi7mvg8g0s";
      };
      nativeBuildInputs = attrs.nativeBuildInputs ++ [
        pkgs.libxkbcommon
      ];
    }));

    st = ( pkgs.lib.overrideDerivation pkgs.st (attrs: {
      src = pkgs.fetchgit {
        url = "git://github.com/actionless/st.git";
        rev = "f0a54af21658ae3e26e14fa52587b1825ddd8100";
        sha256 = "10lmls30acrx6q5ixw7isxicfmjah66ycsa5mcpxdgrbjwvb6pi7";
      };
      /*patches = "/etc/nixos/pkgs/st/enable_transparency_options.diff";*/
      preBuild = "cp /etc/nixos/pkgs/st/config.h config.def.h";
    }));

    /*qt48 = (pkgs.qt48.override {
      gtkStyle = true;
    });*/
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
    gnome3.adwaita-icon-theme
    qt48
    lxappearance

    # GUI apps
    st
    xterm
    rxvt_unicode
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
    evince
    hexchat
    audacious
    meld
    pinta
    gpicview
    arandr

    pcmanfm
    #(callPackage ./pkgs/lxmenu_data.nix {})
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
    xsettingsd

  ];

  services = {
    # printing.enable = true;
    openssh.enable = true;
    nixosManual.enable = true;
    upower.enable = true;
    gnome3.gvfs.enable = true;
    nfs.server.enable = true;
    nfs.server.exports = ''
      /home/lie/    *(ro,nohide)
    '';
  };

  users.extraUsers.lie = {
    isNormalUser = true;
    uid = 1000;
  };
  security.sudo.extraConfig = ''
      lie     ALL=(ALL) SETENV: ALL
  '';

}

