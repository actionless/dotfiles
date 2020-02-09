local awful = require("awful")


local local_config = {}

function local_config.init(awesome_context)

  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/lcars-xresources-hidpi/theme.lua"
  awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/gtk/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/twmish/theme.lua"

  --awesome_context.apw_on_the_left= true

  awesome_context.before_config_loaded[#(awesome_context.before_config_loaded)+1] = function()
    local beautiful = require('beautiful')
    local dpi = beautiful.xresources.apply_dpi
    local color_utils = require("actionless.util.color")
    local string_utils = require("actionless.util.string")
    local gsc = beautiful.get().gtk

    --beautiful.border_focus = beautiful.xrdb.color9
    beautiful.border_focus = beautiful.xrdb.color10
    --beautiful.border_focus = beautiful.xrdb.color14

    -- force pseudo-shadow client decorations:
    --beautiful.border_shadow_width = dpi(4)
    --beautiful.titlebar_shadow_focus = string_utils.max_length(gsc.fg_color, 7).."cc"
    --beautiful.titlebar_shadow_normal = string_utils.max_length(gsc.fg_color, 7).."38"
    --beautiful.titlebar_bg_normal = "#00000000"
    --beautiful.titlebar_bg_focus = "#00000000"

    -- custom color for music widget:
    --beautiful.widget_music_bg = color_utils.mix(
      --beautiful.panel_fg, gsc.selected_bg_color, 0.67
    --)
  end

  return awesome_context
end

return local_config
