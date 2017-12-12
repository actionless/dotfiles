dotfiles
========
see this post (not mine) for details:
http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

or its offline dump:
https://github.com/actionless/dotfiles/blob/master/README_offline.md


Usage
==

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
==


Theme structure
====

```
theme-WORKSTATION_NAME-THEME_NAME/
├── .config
│   ├── awesome
│   │   └── config
│   │       └── local.lua
│   ├── compton.conf
│   ├── fish
│   │   └── modules
│   │       └── Z999-theme-override.fish
│   ├── fontconfig
│   │   └── fonts.conf
│   ├── hexchat
│   │   └── colors.conf
│   ├── nitrogen
│   │   └── bg-saved.cfg
│   └── qt5ct
│       └── qt5ct.conf
├── images
│   └── theme-wallpapers
│       └── wallpaper.png
├── .profile_theme
├── .vim
│   └── theme_local.vim
├── .Xresources
└── .xsettingsd
```
