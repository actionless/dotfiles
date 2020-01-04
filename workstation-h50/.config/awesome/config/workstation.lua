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
    --'clementine',
    --'spotify',
    --'mopidy'
  }

  awesome_context.autorun = {
    --"~/.scripts/tp_unmute",
    --"killall compton ; compton",
    --'xinput disable "ELAN Touchscreen"',
    --"touchegg",
    --"~/.scripts/tp_unmute",
    --"killall compton ; compton",
  }

  -- Available options, actual theme usually set in config/local.lua:
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/lcars-xresources-hidpi/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/gtk/theme.lua"
  --awesome_context.theme_dir = awful.util.getdir("config") .. "/themes/twmish/theme.lua"

  --awesome_context.before_config_loaded = function()
  --end

  return awesome_context
end

return local_config
