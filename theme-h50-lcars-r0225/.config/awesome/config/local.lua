local awful = require("awful")


local local_config = {}

function local_config.init(awesome_context)

  local conf = awesome_context.config
  conf.wlan_if = 'wlp4s0'
  conf.eth_if = 'enp0s25'
  conf.net_preset = 'systemd'
  conf.music_players = { 'spotify', 'clementine', 'mopidy' }
  --conf.music_players = { 'mopidy', }

  awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/lcars-xresources-hidpi/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/twmish/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/gtk/theme.lua"

  awesome_context.autorun = {
    --"~/.scripts/tp_unmute",
    --"killall compton ; compton",
  }

  awesome_context.before_config_loaded = function()
    local beautiful = require("beautiful")
    --beautiful.useless_gap = beautiful.xresources.apply_dpi(10)
    beautiful.client_border_radius = beautiful.xresources.apply_dpi(10)
    --beautiful.icon_theme = "oomox-lcars-r0225-3"
    --beautiful.icon_path = "/home/lie/.icons/oomox-lcars-r0225-3"
    beautiful.icon_theme = "Adwaita"
    beautiful.icon_path = "/usr/share/icons/Adwaita"
  end

  awesome_context.have_battery = false
  awesome_context.sensor = "temp1"
  awesome_context.new_top = true

  return awesome_context
end


return local_config
