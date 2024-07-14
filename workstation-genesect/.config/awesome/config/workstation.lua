local awful = require("awful")
local run_once = require("actionless.util.spawn").run_once

local local_config = {}

function local_config.init(awesome_context)
  local conf = awesome_context.config

  conf.wlan_if = 'wlp4s0'
  conf.eth_if = 'enp0s25'
  conf.net_preset = 'systemd'
  conf.high_swap_ratio = 0.8
  conf.critical_swap_ratio = 0.9
  conf.disk_warnings = {
    ['*'] = {
      pcent=90,
      avail=10485760,  -- 10GiB
    },
  }

  awesome_context.have_battery = false
  awesome_context.apw_on_the_left = true
  --awesome_context.apw_on_the_left = false
  --awesome_context.music_on_the_left = true
  awesome_context.sensors = {
    --gpu = {
    --  device = 'amdgpu-pci-0100',
    --  sensor = 'temp1',
    --  warning = 89,
    --},
    --cpu = {
    --  device = 'dell_smm-isa-0000',
    --  sensor = 'CPU',
    --  sensor_input = 'temp1_input',
    --  warning = 65,
    --},
    cpu0 = {
      device = 'coretemp-isa-0000',
      sensor = 'Package id 0',
      sensor_input = 'temp1',
      warning = 82,
      ----------critical = 96,
    },
    cpu1 = {
      device = 'coretemp-isa-0001',
      sensor = 'Package id 1',
      sensor_input = 'temp1',
      warning = 82,
      ----------critical = 96,
    },
    gpu = {
      device = 'nvidia',
      sensor = 'GPU Current Temp',
      warning = 88,
      ----------critical = 93,
    },
  }

  --awesome_context.cmds.file_manager = "pcmanfm"

  --conf.music_players = { 'spotify', 'clementine', 'mopidy' }
  conf.music_players = {
    'goodvibes',
    'mpv',
    --'headset',
    --'clementine',
    'spotify',
    --'mopidy'
    'firefox',
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

  --au[#au+1] = {
  --  'xinput', 'set-button-map', 'KYE OPTICAL MOUSE',
  --  '1', '2', '3', '4', '5', '6', '7', '7', '6',
  --}
  -- moved to /etc/X11/xorg.conf.d/91-sanwa-trackball.conf

  au[#au+1] = {
    'sudo', 'nvidia-smi', '-pm', '1'
  }
  au[#au+1] = {
    'sudo', 'nvidia-smi', '-cc', '1'
  }
  au[#au+1] = {
    'sudo', 'nvidia-smi', '-pl', '150'
  }

  -- Available options, actual theme usually set in config/local.lua:
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/lcars-xresources-hidpi/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/gtk/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/twmish/theme.lua"

  --awesome_context.before_config_loaded[#(awesome_context.before_config_loaded)+1] = function()
  --end

  awesome_context.after_config_loaded[
    #(awesome_context.after_config_loaded)+1
  ] = function()
    local _ = run_once -- placeholder
    --run_once('python /usr/sbin/autolight')
    --run_once("xscreensaver -no-splash")
    --run_once{"firefox-dpms"}
    --run_once{"bluetooth_headphones"}
    --run_once{"xst", "-c", "bluetooth_workaround_cli", "-e", "bluetooth_workaround_cli"}
    --run_once{
    --  "/usr/bin/barriers",
    --  "-f", "--no-tray",
    --  "--debug", "INFO",
    --  "--name", "genesect",
    --  "--disable-crypto", "--disable-client-cert-checking",
    --  "-c", os.getenv('HOME').."/.config/barrier.conf",
    --  "--address", ":24800"
    --}
    --run_once{"bash", "-c", "sleep 5 && sudo systemctl start nut-monitor && nut-monitor --start-hidden"}
    run_once{"pipewire_server"}
    run_once{"easyeffects"}
  end

  local modkey = awesome_context.modkey
  awesome_context.extra_global_keys[
    #(awesome_context.extra_global_keys)+1
  ] = awful.key({modkey, "Shift"}, "Return", function ()
    awful.spawn{"xst", "-e", "ssh", "cloyster", "-t", "fish", "-c", "tmux"}
  end)

  return awesome_context
end

return local_config
