local awful = require("awful")


local local_config = {}

function local_config.init(awesome_context)
  awesome_context.config = {
    wlan_if = 'wlp12s0',
    eth_if = 'enp0s25',
    net_preset = 'netctl-auto',
    cpu_cores_num =2,
    music_players = { 'spotify', 'clementine' },
  }
  awesome_context.sensor = "Core 0"
  table.insert(awesome_context.autorun, "pulseaudio")
end

return local_config
