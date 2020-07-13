local awful = require("awful")


local local_config = {}

function local_config.init(awesome_context)

  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/lcars-xresources-hidpi/theme.lua"
  awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/gtk/theme.lua"
  awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/pokemon/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/twmish/theme.lua"

  --awesome_context.config.bat_show_when_charged = true

  --awesome_context.apw_on_the_left= true

  awesome_context.before_config_loaded[#(awesome_context.before_config_loaded)+1] = function()
    local beautiful = require('beautiful')
    local theme = beautiful.get()

    --beautiful.mono_font = "Monospace Bold 9"
    --local font_size = "9.171974522292993"
    --beautiful.bold_font = "Monospace Bold " .. font_size
    --beautiful.mono_font = "Monospace " .. font_size
    --beautiful.sans_font = "Sans Bold " .. font_size
    --beautiful.text_font = "Monospace " .. font_size
    --beautiful.font = beautiful.mono_font
    --beautiful.tasklist_font = beautiful.font
    --beautiful.taglist_font = beautiful.mono_font
    --beautiful.tasklist_font = beautiful.bold_font

    beautiful.menu_height = beautiful.xresources.apply_dpi(28)

    local color_utils = require("actionless.util.color")

    beautiful.panel_widget_fg = color_utils.darker(
      beautiful.panel_fg,
      -13
    )
    beautiful.panel_widget_bg = color_utils.mix(
      beautiful.gsc.base_color,
      beautiful.panel_bg,
      0.5
    )
    --beautiful.panel_widget_bg = color_utils.darker(
    --  beautiful.panel_bg,
    --  -17
    --)

    beautiful.taglist_bg_occupied = theme.gsc.base_color
    --beautiful.taglist_bg_occupied = color_utils.darker(
    --  beautiful.panel_bg,
    --  -23
    --)

    beautiful.tasklist_bg_minimize = beautiful.xrdb.color6
    beautiful.apw_fg_color = beautiful.xrdb.color4
    beautiful.apw_bg_color = beautiful.panel_widget_bg

    beautiful.panel_widget_progress_bg = theme.gsc.base_color
    beautiful.panel_widget_progress_border_color = beautiful.panel_widget_border_color
    --beautiful.panel_widget_border_color = beautiful.panel_bg

    beautiful.border_focus = beautiful.xrdb.color10
    beautiful.border_focus = beautiful.xrdb.color11
    beautiful.border_normal = color_utils.darker(beautiful.border_normal, -20)
    theme.widget_music_bg = color_utils.mix(
      theme.xrdb.color5,
      theme.panel_fg,
      0.8
    )

    --beautiful.panel_close = beautiful.xrdb.color1
    --beautiful.widget_close_bg = beautiful.xrdb.color1
  end

  --awesome_context.after_config_loaded[#(awesome_context.after_config_loaded)+1] = function()
  --end

  return awesome_context
end

return local_config
