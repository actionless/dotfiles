local awful = require("awful")


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

  awesome_context.autorun = {
    --"~/.scripts/tp_unmute",
    --"killall compton ; compton",
  }

  awesome_context.sensor = "temp1"
  awesome_context.new_top = true

  awesome_context.before_config_loaded[#(awesome_context.before_config_loaded)+1] = function()
    local beautiful = require('beautiful')
    local dpi = beautiful.xresources.apply_dpi
    local color_utils = require("actionless.util.color")
    local gsc = beautiful.get().gtk
    -- force pseudo-shadow client decorations:
    beautiful.border_shadow_width = dpi(5)
    beautiful.titlebar_shadow_focus = gsc.fg_color.."cc"
    beautiful.titlebar_shadow_normal = gsc.fg_color.."38"
    beautiful.titlebar_bg_normal = "#00000000"
    beautiful.titlebar_bg_focus = "#00000000"
    -- custom color for music widget:
    beautiful.widget_music_bg = color_utils.mix(beautiful.panel_fg, gsc.selected_bg_color, 0.67)
  end

  return awesome_context
end

return local_config
