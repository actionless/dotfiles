local awful = require("awful")
local color_utils = require("actionless.util.color")


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

  awesome_context.autorun = {
    --"~/.scripts/tp_unmute",
    --"killall compton ; compton",
  }

  awesome_context.have_battery = false
  --awesome_context.have_battery = true
  awesome_context.sensor = "temp1"
  awesome_context.new_top = true

  awesome_context.before_config_loaded = function()
    local beautiful = require("beautiful")
    local dpi = beautiful.xresources.apply_dpi
    -- size fixes for Fanstasque Sans Mono:
    --local beautiful = require("beautiful")
    beautiful.font = "Monospace Bold 11"
    beautiful.tasklist_font = "Monospace 11"
    beautiful.panel_widget_font = beautiful.tasklist_font
    beautiful.taglist_font =  beautiful.font
    beautiful.titlebar_font =  beautiful.font
    beautiful.small_font = "Monospace 8"
    beautiful.sans_font = "Sans 11"
    beautiful.notification_font = beautiful.sans_font
    beautiful.text_font = beautiful.sans_font
    -- Height fixes for that font:
    beautiful.border_radius = dpi(8)
    beautiful.panel_widget_border_radius = dpi(7)
    beautiful.border_focus = beautiful.xrdb.color10
    beautiful.actionless_titlebar_bg_focus  = beautiful.border_focus
    beautiful.basic_panel_height = dpi(20)
    beautiful.panel_padding_bottom = dpi(3)
    beautiful.panel_height = beautiful.basic_panel_height + beautiful.panel_padding_bottom
    beautiful.titlebar_height = beautiful.basic_panel_height + beautiful.base_border_width*2

    beautiful.taglist_bg_focus		= color_utils.darker(
      color_utils.mix(beautiful.panel_bg, beautiful.taglist_fg_occupied, 0.8),
      -97
    )
    beautiful.taglist_fg_focus	        = beautiful.panel_bg

    beautiful.taglist_bg_occupied       = beautiful.gtk.base_color

    -- Use music style from xresources theme:
    beautiful.widget_music_bg = beautiful.xrdb.color11
    beautiful.apw_fg_color = beautiful.xrdb.color14
    beautiful.apw_bg_color = beautiful.panel_widget_bg

    --beautiful.show_widget_icon = true
  end

  --awesome_context.after_config_loaded = function()
  --end

  return awesome_context
end

return local_config
