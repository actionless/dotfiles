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

    --local font_size = "9.171974522292993"
    local font_size = "9.9"
    --local font_size = "9.7"
    --local font_size = "9.34"
    --local font_size = "9.5"
    beautiful.mono_font = "Monospace " .. font_size
    beautiful.sans_font = "Sans Medium " .. font_size
    --beautiful.bold_font = "Monospace Bold " .. font_size
    beautiful.bold_font = "Sans Semibold " .. font_size
    beautiful.mono_text_font = "Monospace " .. font_size-1
    beautiful.clock_font = "Sans Bold " .. font_size

    beautiful.font = beautiful.sans_font
    --beautiful.font = beautiful.mono_font
    beautiful.tasklist_font = beautiful.sans_font
    --beautiful.tasklist_font = beautiful.bold_font
    beautiful.taglist_font = beautiful.sans_font
    beautiful.taglist_font = beautiful.bold_font
    beautiful.titlebar_font = beautiful.bold_font
    --beautiful.titlebar_font = beautiful.sans_font

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
    beautiful.taglist_bg_focus = beautiful.gsc.header_button_bg_color
    beautiful.taglist_fg_focus = beautiful.gsc.header_button_fg_color

    beautiful.tasklist_bg_minimize = beautiful.xrdb.color6
    beautiful.apw_fg_color = beautiful.gsc.header_button_bg_color
    beautiful.apw_bg_color = beautiful.panel_widget_bg

    beautiful.panel_widget_progress_bg = theme.gsc.base_color
    beautiful.panel_widget_progress_border_color = beautiful.panel_widget_border_color
    --beautiful.panel_widget_border_color = beautiful.panel_bg

    --beautiful.border_focus = beautiful.xrdb.color10
    --beautiful.border_focus = beautiful.xrdb.color11
    --beautiful.border_focus = beautiful.xrdb.color5
    --beautiful.border_normal = color_utils.darker(beautiful.border_normal, -20)
    theme.widget_music_bg = color_utils.mix(
      theme.xrdb.color5,
      theme.panel_fg,
      0.8
    )

    ----beautiful.base_border_width = beautiful.xresources.apply_dpi(7)
    --if awesome.composite_manager_running then
    --  beautiful.base_border_width = beautiful.border_radius * 1.1
    --else
    --  --beautiful.base_border_width = beautiful.xresources.apply_dpi(3)
    --  beautiful.base_border_width = beautiful.xresources.apply_dpi(4)
    --end
    ----beautiful.client_border_radius = beautiful.xresources.apply_dpi(15)
    beautiful.client_border_radius = 0

    beautiful.theme_assets.recolor_titlebar(
      beautiful.get(),
      color_utils.mix(beautiful.titlebar_fg_focus, beautiful.border_focus, 0.4),
      "focus", "hover"
    )

    --beautiful.panel_close = beautiful.xrdb.color1
    --beautiful.widget_close_bg = beautiful.xrdb.color1
  end

  --awesome_context.after_config_loaded[#(awesome_context.after_config_loaded)+1] = function()
  --end

  return awesome_context
end

return local_config
