local awful = require("awful")


local local_config = {}

function local_config.init(awesome_context)
  awesome_context.config = {
    net_preset = 'systemd',
    music_players = { 'spotify', 'clementine' },
  }
  awesome_context.autorun = {
    --"~/.scripts/tp_unmute",
    --"killall compton ; compton",
    "xscreensaver -no-splash",
  }
  awesome_context.have_battery = false
  awesome_context.new_top = true
  awesome_context.sensor = "Core 0"
  awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/lcars-xresources-hidpi/theme.lua"
end

return local_config
