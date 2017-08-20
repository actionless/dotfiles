#!/bin/bash
exec env WLC_DRM_DEVICE=card1 QT_QPA_PLATFORM_THEME=wayland-egl GDK_BACKEND=wayland CLUTTER_BACKEND=wayland SDL_VIDEODRIVER=wayland $@
