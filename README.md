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


#### Theme structure

```
theme-WORKSTATION_NAME-THEME_NAME/
├── .config
│   ├── awesome
│   │   └── config
│   │       └── local.lua  # awesome wm customization
│   ├── compton.conf  # compositor (shadow, transparency and other effects)
│   ├── fish
│   │   └── modules
│   │       └── Z999-theme-override.fish  # custom prompt decoration @TODO: remove it and use only .profile_theme
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
├── .profile_theme  # term decorations and tmux decorations fg
├── .vim
│   └── theme_local.vim  # theme override
├── .Xresources  # override colorscheme, st options or other @TODO: rename .Xresources->.Xresources_theme .Xresources.common->.Xresources
└── .xsettingsd  # GTK2 and GTK3 themes, icons, font and other options
```
