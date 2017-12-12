dotfiles
========
see this post (not mine) for details:
http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

or its offline dump:
https://github.com/actionless/dotfiles/blob/master/README_offline.md


Usage
--

Create symlinks for the first time:

```sh
./bootstrap.sh WORKSTATION_NAME [THEME_NAME]
```


Change the theme:

```sh
./change-theme.sh
```


To recreate symlink structure:

```sh
./resync.sh
```


Info
--


#### Workstation structure

```sh
workstation-WORKSTATION_NAME/
├── .config
│   ├── mpv
│   │   └── mpv.conf  # define HW acceleration and so on
│   └── pulse  # tweaks for the soundcard
│       ├── client.conf
│       ├── daemon.conf
│       └── default.pa
├── etc  # some extra configs @TODO: rename to misc
├── .profile_workstation  # vdpau, dpi and other env vars
└── .Xresources.workstation  # dpi, st font size and other options
```


#### Theme structure

```sh
theme-WORKSTATION_NAME-THEME_NAME/
├── .config
│   ├── awesome
│   │   └── config
│   │       └── local.lua  # awesome wm customization
│   ├── compton.conf  # compositor (shadow, transparency and other effects)
│   ├── fontconfig
│   │   └── fonts.conf  # default fonts (sans, serif, monospace)
│   ├── hexchat
│   │   └── colors.conf
│   ├── nitrogen
│   │   └── bg-saved.cfg  # wallpaper
│   └── qt5ct
│       └── qt5ct.conf  # Qt5 theme
├── images
│   └── theme-wallpapers
│       └── wallpaper.png
├── .profile_theme  # term (tmux, fish) decorations
├── .vim
│   └── theme_local.vim  # theme override
├── .Xresources  # override colorscheme, st options or other @TODO: rename .Xresources->.Xresources_theme .Xresources.common->.Xresources
└── .xsettingsd  # GTK2 and GTK3 themes, icons, font and other options
```
