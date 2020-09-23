local local_config = {}

function local_config.init(awesome_context)
  local conf = awesome_context.config

  conf.wlan_if = 'wlp4s0'
  conf.eth_if = 'enp0s25'
  conf.net_preset = 'systemd'


  awesome_context.have_battery = false
  awesome_context.sensors = {
    gpu = {
      device = 'amdgpu-pci-0100',
      sensor = 'edge',
      warning = 89,
    },
    cpu = {
      device = 'k10temp-pci-00c3',
      sensor = 'temp1',
      warning = 65,
    },
  }

  --awesome_context.cmds.file_manager = "pcmanfm"

  --conf.music_players = { 'spotify', 'clementine', 'mopidy' }
  conf.music_players = {
    'gradio',
    'mpv',
    --'headset',
    --'clementine',
    --'spotify',
    --'mopidy'
  }

  local au = awesome_context.autorun
    --"~/.scripts/tp_unmute",
    --"killall compton ; compton",
    --'xinput disable "ELAN Touchscreen"',
    --"touchegg",
    --"~/.scripts/tp_unmute",
    --"killall compton ; compton",

  local sanwa_pad = true
  if sanwa_pad then  -- detect it after asynchronously reading `xinput list` output
    --legacy evdev-based:
    --local sanwa_big = 12
    --with_shell('xinput set-prop ' .. sanwa_pad .. ' "Device Accel Velocity Scaling" 26')
    --with_shell('xinput set-prop ' .. sanwa_pad .. ' "Evdev Middle Button Emulation" 1')
    --with_shell('xinput set-prop ' .. sanwa_pad .. ' "Evdev Wheel Emulation" 1')
    --with_shell('xinput set-prop ' .. sanwa_pad .. ' "Evdev Wheel Emulation Button" 2')
    --with_shell('xinput set-prop ' .. sanwa_pad .. ' "Evdev Wheel Emulation Timeout" 200')
    ----wheel inertia:
    ----default:
    --with_shell('xinput set-prop ' .. sanwa_pad .. ' "Evdev Wheel Emulation Inertia" 350')
    ----from workstation:
    ----with_shell('xinput set-prop ' .. sanwa_pad .. ' "Evdev Wheel Emulation Inertia" 50')
    ----from vm:
    ----with_shell('xinput set-prop ' .. sanwa_pad .. ' "Evdev Wheel Emulation Inertia" 170')

    --libinput-based:
    au[#au+1] = {
        'xinput', 'set-prop', 'HID 04d9:1166',
        "libinput Scroll Method Enabled", '0', '0', '1'
      }
  end

  -- Available options, actual theme usually set in config/local.lua:
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/lcars-xresources-hidpi/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/gtk/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/twmish/theme.lua"

  --awesome_context.before_config_loaded[#(awesome_context.before_config_loaded)+1] = function()
  --end

  return awesome_context
end

return local_config
