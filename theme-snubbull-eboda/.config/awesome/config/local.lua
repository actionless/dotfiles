local awful = require("awful")


local local_config = {}

function local_config.init(awesome_context)

  --awesome_context.apw_on_the_left= true

  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/lcars-xresources-hidpi/theme.lua"
  awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/gtk/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/twmish/theme.lua"

  awesome_context.before_config_loaded[#(awesome_context.before_config_loaded)+1] = function()
    local beautiful = require('beautiful')
    local dpi = beautiful.xresources.apply_dpi
    local color_utils = require("actionless.util.color")
    local string_utils = require("actionless.util.string")
    local gsc = beautiful.get().gtk
    local xrdb = beautiful.get().xrdb

    -- force pseudo-shadow client decorations:
    --beautiful.border_shadow_width = dpi(4)
    --beautiful.titlebar_shadow_focus = string_utils.max_length(gsc.fg_color, 7).."cc"
    --beautiful.titlebar_shadow_normal = string_utils.max_length(gsc.fg_color, 7).."38"
    --beautiful.titlebar_bg_normal = "#00000000"
    --beautiful.titlebar_bg_focus = "#00000000"

    --local ACCENT_COLOR = "#dab1ff"
    --beautiful.border_focus = color_utils.darker(ACCENT_COLOR, 47)
    local ACCENT_COLOR = gsc.selected_bg_color
    beautiful.border_focus = ACCENT_COLOR

    -- custom color for music widget:
    --beautiful.widget_music_bg = color_utils.mix(
      --beautiful.panel_fg, gsc.selected_bg_color, 0.67
    --)
    beautiful.widget_music_bg = ACCENT_COLOR

    -- set all fonts to bold
    beautiful.font = beautiful.titlebar_font
    beautiful.tasklist_font = beautiful.font
  end

  return awesome_context
end

return local_config
