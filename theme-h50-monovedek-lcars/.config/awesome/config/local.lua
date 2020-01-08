local awful = require("awful")
local gears = require("gears")
local color_utils = require("actionless.util.color")


local local_config = {}

function local_config.init(awesome_context)

  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/lcars-xresources-hidpi/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/gtk/theme.lua"
  awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/pokemon/theme.lua"

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
    beautiful.client_border_radius = dpi(8)
    beautiful.panel_widget_border_radius = dpi(7)
    --beautiful.border_focus = beautiful.xrdb.color10
    --beautiful.actionless_titlebar_bg_focus  = beautiful.border_focus
    beautiful.basic_panel_height = dpi(20)
    beautiful.panel_padding_bottom = dpi(3)
    beautiful.panel_height = beautiful.basic_panel_height + beautiful.panel_padding_bottom
    beautiful.titlebar_height = beautiful.basic_panel_height + beautiful.base_border_width*2


    beautiful.taglist_bg_occupied = color_utils.mix(
      beautiful.gsc.base_color,
      beautiful.gsc.header_button_bg_color,
      0.3
    )

    beautiful.taglist_fg_focus = beautiful.panel_bg
    beautiful.taglist_bg_focus = color_utils.mix(
      color_utils.mix(
        beautiful.taglist_bg_occupied,
        beautiful.taglist_fg_occupied,
        0.4
      ),
      beautiful.gsc.selected_bg_color,
      0.8
    )

    --nlog(beautiful.taglist_fg_occupied)

    -- Use music style from xresources theme:
    beautiful.widget_music_bg = beautiful.xrdb.color11
    beautiful.apw_fg_color = beautiful.xrdb.color14
    beautiful.apw_bg_color = beautiful.panel_widget_bg

    local rounded_rect_shape = function(cr,w,h)
      gears.shape.rounded_rect(
        cr, w, h, beautiful.client_border_radius
      )
    end
    local less_rounded_rect_shape = function(cr,w,h)
      gears.shape.rounded_rect(
        cr, w, h, beautiful.panel_widget_border_radius
      )
    end
    beautiful.notification_shape = rounded_rect_shape
    beautiful.tasklist_shape_minimized = less_rounded_rect_shape
      --
    --beautiful.show_widget_icon = true
  end

  --awesome_context.after_config_loaded = function()
  --end

  return awesome_context
end

return local_config
