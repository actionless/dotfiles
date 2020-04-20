local awful = require("awful")


local local_config = {}

function local_config.init(awesome_context)

  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/lcars-xresources-hidpi/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/gtk/theme.lua"
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
    beautiful.font = beautiful.mono_font
    beautiful.tasklist_font = beautiful.font
    beautiful.taglist_font = beautiful.bold_font
    beautiful.tasklist_font = beautiful.bold_font

    beautiful.menu_height = beautiful.xresources.apply_dpi(28)

    beautiful.border_radius = beautiful.xresources.apply_dpi(3)
    beautiful.panel_widget_border_radius = beautiful.border_radius
    beautiful.client_border_radius = beautiful.border_radius

    local color_utils = require("actionless.util.color")

    beautiful.apw_fg_color = beautiful.xrdb.color14
    beautiful.apw_bg_color = color_utils.mix(
      beautiful.apw_fg_color,
      beautiful.panel_bg,
      0.3
    )

    beautiful.panel_widget_fg = color_utils.darker(
      beautiful.panel_fg,
      -13
    )
    beautiful.panel_widget_bg = color_utils.mix(
      beautiful.panel_fg,
      beautiful.panel_bg,
      0.3
    )

    beautiful.panel_widget_progress_fg = beautiful.xrdb.color14
    beautiful.panel_widget_progress_fg = beautiful.xrdb.color13
    beautiful.panel_widget_progress_fg = beautiful.xrdb.color12
    --beautiful.panel_widget_progress_fg = beautiful.panel_widget_fg
    beautiful.panel_widget_progress_bg = color_utils.mix(
      beautiful.panel_widget_progress_fg,
      beautiful.panel_widget_bg,
      0.2
    )

    beautiful.border_focus = beautiful.xrdb.color10
    beautiful.border_normal = color_utils.darker(beautiful.border_normal, -20)
    theme.widget_music_bg = color_utils.mix(theme.xrdb.color11, theme.panel_fg, 0.8)

    --beautiful.taglist_bg_occupied = beautiful.panel_widget_bg
    --beautiful.taglist_fg_occupied = beautiful.panel_widget_fg

    beautiful.taglist_bg_focus = theme.gsc.bg_color
    beautiful.taglist_bg_focus = theme.xrdb.color13
    beautiful.taglist_fg_focus = beautiful.panel_bg

  end

  --awesome_context.after_config_loaded[#(awesome_context.after_config_loaded)+1] = function()
  --end

  return awesome_context
end

return local_config
