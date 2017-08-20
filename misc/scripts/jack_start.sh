#!/bin/sh
pulseaudio  -k ; sleep 1 ; jack_control start ; sleep 1 ; pavucontrol
