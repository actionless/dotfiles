{
  config,
  pkgs,
  lib,
  ...
}:

{
  # List services that you want to enable:
  services = {
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
      windowManager.awesome.enable = false;
      displayManager.session = [ {
        name = "awesome";
        manage = "window";
        start = ''
          ${lib.concatMapStrings
            (pkg: ''
              export LUA_CPATH=$LUA_CPATH''${LUA_CPATH:+;}${pkg}/lib/lua/${pkgs.awesome.lua.luaversion}/?.so
              export LUA_PATH=$LUA_PATH''${LUA_PATH:+;}${pkg}/lib/lua/${pkgs.awesome.lua.luaversion}/?.lua
            '')
            config.services.xserver.windowManager.awesome.luaModules
          }
          ${pkgs.awesome}/bin/awesome >> ~/.cache/awesome_stdout 2>> ~/.cache/awesome_stderr &
          ${pkgs.coreutils}/bin/sleep 5 && ${pkgs.compton}/bin/compton &
          waitPID=$!
        '';
      } {
        name = "awesome_no_ARGB";
        manage = "window";
        start = ''
          ${lib.concatMapStrings
            (pkg: ''
              export LUA_CPATH=$LUA_CPATH''${LUA_CPATH:+;}${pkg}/lib/lua/${pkgs.awesome.lua.luaversion}/?.so
              export LUA_PATH=$LUA_PATH''${LUA_PATH:+;}${pkg}/lib/lua/${pkgs.awesome.lua.luaversion}/?.lua
            '')
            config.services.xserver.windowManager.awesome.luaModules
          }
          ${pkgs.awesome}/bin/awesome --no-argb >> ~/.cache/awesome_stdout 2>> ~/.cache/awesome_stderr &
          waitPID=$!
        '';
      } ];
    };
  };
}
