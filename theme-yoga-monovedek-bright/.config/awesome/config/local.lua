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

  --awesome_context.cmds.file_manager = "pcmanfm"

  awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/lcars-xresources-hidpi/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/gtk/theme.lua"

  awesome_context.autorun = {
    --"touchegg",
    --"~/.scripts/tp_unmute",
    --"killall compton ; compton",
  }

  --awesome_context.have_battery = false
  awesome_context.have_battery = true
  awesome_context.sensor = "temp1"
  awesome_context.apw_on_the_left= true

  awesome_context.before_config_loaded = function()
    local beautiful = require('beautiful')

    --beautiful.mono_font = "Monospace Bold 9"
    local font_size = "9.171974522292993"
    beautiful.bold_font = "Monospace Bold " .. font_size
    beautiful.mono_font = "Monospace " .. font_size
    beautiful.sans_font = "Sans Bold " .. font_size
    beautiful.text_font = "Monospace " .. font_size
    beautiful.font = beautiful.mono_font
    beautiful.tasklist_font = beautiful.font
    beautiful.taglist_font = beautiful.bold_font
    beautiful.tasklist_font = beautiful.bold_font

    beautiful.menu_height = beautiful.xresources.apply_dpi(28)

    beautiful.border_radius = beautiful.xresources.apply_dpi(3)
    beautiful.panel_widget_border_radius = beautiful.border_radius
    beautiful.client_border_radius = beautiful.border_radius

    local color_utils = require("actionless.util.color")

    --beautiful.apw_fg_color = beautiful.xrdb.color14
    --beautiful.apw_bg_color = color_utils.mix(
      --beautiful.apw_fg_color,
      --beautiful.panel_bg,
      --0.3
    --)

    --beautiful.panel_widget_fg = color_utils.darker(
      --beautiful.panel_fg,
      ---13
    --)
    --beautiful.panel_widget_bg = color_utils.mix(
      --beautiful.panel_fg,
      --beautiful.panel_bg,
      --0.3
    --)

    --beautiful.panel_widget_progress_fg = beautiful.xrdb.color14
    --beautiful.panel_widget_progress_fg = beautiful.panel_widget_fg
    --beautiful.panel_widget_progress_bg = color_utils.mix(
      --beautiful.panel_widget_progress_fg,
      --beautiful.panel_widget_bg,
      --0.2
    --)
    --

  end

  return awesome_context
end

return local_config
