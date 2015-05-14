local awful = require("awful")


local local_config = {}

function local_config.init(awesome_context)
  awesome_context.config = {
    wlan_if = 'wlp4s0',
    eth_if = 'enp0s25',
    net_preset = 'bond',
    music_players = { 'spotify', 'clementine', },
  }
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/vertex/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/lcars_xresources/theme.lua"
  awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/lcars-xresources-hidpi/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/pokemon_dark/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/monovedek/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/pokemon_light/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/lcars_modern/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/noble_dark/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/pokemon-xresources/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/pro-medium-light/theme.lua"
  awesome_context.autorun = {
    --"~/.scripts/tp_unmute",
    --"killall compton ; compton",
  }
  awesome_context.volume_widget='apw'
  awesome_context.have_battery = false
  awesome_context.new_top = true

  return awesome_context
end

return local_config
