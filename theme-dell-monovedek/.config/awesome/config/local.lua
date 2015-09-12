local awful = require("awful")


local local_config = {}

function local_config.init(awesome_context)

  local function set_colorscheme(part_path)
    awesome_context.theme_dir = awful.util.getdir("config") ..
      "/themes/" .. part_path .. "/theme.lua"
  end

  awesome_context.config = {
    wlan_if = 'wlp12s0',
    eth_if = 'enp0s25',
    net_preset = 'netctl-auto',
    cpu_cores_num =2,
    music_players = { 'spotify', 'clementine' },
  }
  --set_colorscheme("lcars")
  --set_colorscheme("lcars_modern")
  --set_colorscheme("pokemon_dark")
  --set_colorscheme("pokemon_light")
  --set_colorscheme("monovedek")
  --set_colorscheme("pro-medium-light")
  --set_colorscheme("vertex")
  --set_colorscheme("transparent-xresources")
  --set_colorscheme("lcars-xresources")
  --set_colorscheme("noble_dark")
  --set_colorscheme("pokemon-xresources")
  --set_colorscheme("lcars-xresources-overridden")
  --set_colorscheme("lcars-xresources-hidpi")
  --set_colorscheme("pro-medium-light")
  --set_colorscheme("dell")
  table.insert(awesome_context.autorun, "pulseaudio")
end

return local_config
