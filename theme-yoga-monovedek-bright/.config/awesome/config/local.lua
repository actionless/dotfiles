local awful = require("awful")


local local_config = {}

function local_config.init(awesome_context)

  local conf = awesome_context.config
  conf.wlan_if = 'wlp4s0'
  conf.eth_if = 'enp0s25'
  --conf.net_preset = 'systemd'
  conf.net_preset = 'netctl'
  --conf.music_players = { 'spotify', 'clementine', 'mopidy' }
  --conf.music_players = { 'clementine', }
  conf.music_players = { 'spotify', 'gradio', 'clementine' }

  awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/lcars-xresources-hidpi/theme.lua"
  awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/gtk/theme.lua"

  awesome_context.autorun = {
    "touchegg",
    --"~/.scripts/tp_unmute",
    --"killall compton ; compton",
  }

  awesome_context.have_battery = false
  awesome_context.have_battery = true
  awesome_context.sensor = "temp1"
  awesome_context.new_top = true

  awesome_context.apw_on_the_left= true

  return awesome_context
end

return local_config
