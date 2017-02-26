local awful = require("awful")
local beautiful = require("beautiful")


local local_config = {}

function local_config.init(awesome_context)

  local conf = awesome_context.config
  conf.wlan_if = 'wlp4s0'
  conf.eth_if = 'enp0s25'
  conf.net_preset = 'systemd'
  conf.music_players = { 'spotify', 'clementine', 'mopidy' }
  --conf.music_players = { 'mopidy', }

  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/lcars-xresources-hidpi/theme.lua"
  awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/gtk/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/twmish/theme.lua"
  OOMOX_THEME_NAME="tumblr01"
  --OOMOX_SEL_BG = "#546cc4"

  awesome_context.autorun = {
    --"~/.scripts/tp_unmute",
    --"killall compton ; compton",
  }

  awesome_context.have_battery = false
  awesome_context.sensor = "temp1"
  awesome_context.new_top = true

  awesome_context.before_config_loaded = function()
    --beautiful.widget_music_bg = "#c45754"
    --beautiful.widget_music_bg = "#748ce4"
    --beautiful.border_focus = "#546cc4"
    beautiful.taglist_bg_focus  = "#ff0000"
    beautiful.taglist_fg_focus  = "#0000ff"
  end
  awesome_context.after_config_loaded = awesome_context.before_config_loaded

  return awesome_context
end

return local_config
