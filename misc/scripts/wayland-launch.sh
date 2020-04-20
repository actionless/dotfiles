#!/bin/bash
#    WLC_DRM_DEVICE=card1 \
exec env \
	GDK_BACKEND=wayland CLUTTER_BACKEND=wayland \
	QT_QPA_PLATFORM_THEME=wayland-egl \
	SDL_VIDEODRIVER=wayland \
	MOZ_ENABLE_WAYLAND=1 MOZ_DBUS_REMOTE=1 \
	$@
