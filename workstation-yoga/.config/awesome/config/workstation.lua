local local_config = {}

function local_config.init(awesome_context)
  local conf = awesome_context.config

  conf.wlan_if = 'wlp4s0'
  conf.eth_if = 'enp0s25'
  --conf.net_preset = 'systemd'
  conf.net_preset = 'netctl'

  awesome_context.have_battery = true
  awesome_context.sensors = {}
    --gpu_v = {
      --device = 'nouveau-pci-0300',
      --sensor = 'in0',
      --warning = 1,
    --},
    --cpu = {
      --device = 'coretemp-isa-0000',
      --sensor = 'temp1',
      --warning = 90,
    --},
    --cpu0 = {
      --device = 'coretemp-isa-0000',
      --sensor = 'temp2',
      --warning = 90,
    --},
    --cpu1 = {
      --device = 'coretemp-isa-0000',
      --sensor = 'temp3',
      --warning = 45,
    --},
  --}

  awesome_context.apw_on_the_left= true

  --awesome_context.cmds.file_manager = "pcmanfm"

  --conf.music_players = { 'spotify', 'clementine', 'mopidy' }
  conf.music_players = { 'spotify', 'gradio', 'clementine' }

  awesome_context.autorun = {
    'xinput disable "ELAN Touchscreen"',
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
