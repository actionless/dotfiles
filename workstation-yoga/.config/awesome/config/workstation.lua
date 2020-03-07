local awful = require("awful")

local run_once = require("actionless.util.spawn").run_once


local local_config = {}

function local_config.init(awesome_context)
  local conf = awesome_context.config

  conf.wlan_if = 'wlp4s0'
  conf.eth_if = 'enp0s25'
  --conf.net_preset = 'systemd'
  conf.net_preset = 'netctl'

  awesome_context.have_battery = true
  awesome_context.sensors = {
    --gpu_v = {
    --  device = 'nouveau-pci-0300',
    --  sensor = 'GPU core',
    --  sensor_input = 'in0',
    --  warning = 1,
    --},
    cpu = {
      device = 'coretemp-isa-0000',
      sensor = 'Package id 0',
      sensor_input = 'temp1',
      warning = 90,
    },
    cpu0 = {
      device = 'coretemp-isa-0000',
      sensor = 'Core 0',
      sensor_input = 'temp2',
      warning = 90,
    },
    cpu1 = {
      device = 'coretemp-isa-0000',
      sensor = 'Core 1',
      sensor_input = 'temp3',
      warning = 90,
    },
  }

  awesome_context.apw_on_the_left= true

  --awesome_context.cmds.file_manager = "pcmanfm"

  --conf.music_players = { 'spotify', 'clementine', 'mopidy' }
  conf.music_players = {
    --'spotify',
    'gradio',
    'mpv',
    --'clementine'
  }


  local au = awesome_context.autorun
  au[#au+1] = 'xinput disable "ELAN Touchscreen"'
  --{
    --"touchegg",
    --"~/.scripts/tp_unmute",
    --"killall compton ; compton",
  --}

  local touchpad_id = "SynPS/2 Synaptics TouchPad"
  if touchpad_id then  -- detect it after asynchronously reading `xinput list` output
    --https://github.com/p2rkw/xf86-input-mtrack
    for _, line in ipairs({
      'xinput set-prop "' .. touchpad_id .. '" "Device Accel Velocity Scaling" 10',
      'xinput set-prop "' .. touchpad_id .. '" "Trackpad Sensitivity" 0.3',
      'xinput set-prop "' .. touchpad_id .. '" "Trackpad Edge Sizes" {0,0,0,0}',
      'xinput set-prop "' .. touchpad_id .. '" "Trackpad Button Emulation Values" {1,3,2}',
      'xinput set-prop "' .. touchpad_id .. '" "Trackpad Palm Detection" {0,0}',
    }) do
      table.insert(awesome_context.autorun, line)
    end
  end

  -- Available options, actual theme usually set in config/local.lua:
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/lcars-xresources-hidpi/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/gtk/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/twmish/theme.lua"

  --awesome_context.before_config_loaded[
  --  #(awesome_context.before_config_loaded)+1
  --] = function()
  --end

  awesome_context.after_config_loaded[
    #(awesome_context.after_config_loaded)+1
  ] = function()
    --run_once('python /usr/sbin/autolight')
    run_once{"xscreensaver -no-splash"}
  end

  local modkey = awesome_context.modkey
  awesome_context.extra_global_keys[
    #(awesome_context.extra_global_keys)+1
  ] = awful.key({modkey}, "Page_Up", function ()
    awesome_context.widgets.volume.Up()
  end)
  awesome_context.extra_global_keys[
    #(awesome_context.extra_global_keys)+1
  ] = awful.key({modkey}, "Page_Down", function ()
    awesome_context.widgets.volume.Down()
  end)

  return awesome_context
end

return local_config
