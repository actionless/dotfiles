local awful = require("awful")


local local_config = {}

function local_config.init(awesome_context)

  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/lcars-xresources-hidpi/theme.lua"
  awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/twmish/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/gtk/theme.lua"

  --awesome_context.apw_on_the_left= true

  --awesome_context.before_config_loaded[#(awesome_context.before_config_loaded)+1] = function()
    --local beautiful = require('beautiful')
  --end

  return awesome_context
end

return local_config
