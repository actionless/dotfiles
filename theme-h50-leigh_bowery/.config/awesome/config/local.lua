local awful = require("awful")


local local_config = {}

function local_config.init(awesome_context)

  local conf = awesome_context.config
  conf.wlan_if = 'wlp4s0'
  conf.eth_if = 'enp0s25'
  conf.net_preset = 'systemd'
  conf.music_players = { 'gradio', 'spotify', 'clementine', }
  --conf.music_players = { 'mopidy', }

  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/lcars-xresources-hidpi/theme.lua"
  awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/gtk/theme.lua"
  OOMOX_THEME_NAME = 'popart/leigh_bowery_3'
  OOMOX_SEL_BORDER = "#5ebe38"

  awesome_context.autorun = {
    --"~/.scripts/tp_unmute",
    --"killall compton ; compton",
  }

  awesome_context.have_battery = false
  awesome_context.sensor = "temp1"
  awesome_context.new_top = true

  return awesome_context
end

return local_config
