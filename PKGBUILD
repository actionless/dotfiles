pkgname=actionless_dotfiles_meta
pkgver=0.1
pkgrel=18
pkgdesc="Actionless dotfiles dependencies"
arch=('x86_64' 'i686')
url="https://github.com/actionless/dotfiles"
license=('GPL3')
depends=(
	'stow'
	'awesome'
	'bash'
	'coreutils'
	'fish'

	## vim stuff:
	'vim'
	'python-lsp-server'
	'python-rope'
	'bash-language-server'
	'xsel'
	'ctags'
	# see more: `pikaur -Ssq language server | grep -i -e 'language[-]server' -e ls`

	# theming:
	'breeze'
	#'xcursor-breeze'
	'adwaita-icon-theme'

	# fonts:
	'adobe-source-code-pro-fonts'
	'adobe-source-sans-pro-fonts'
	'adobe-source-serif-pro-fonts'
	'adobe-source-han-sans-jp-fonts'
	'adobe-source-han-serif-jp-fonts'
	'otf-fantasque-sans-mono'
	#
	'ttf-input'
	'ttf-go-mono-git'
	'ttf-go-sans-git'
	'ttf-paratype'

	# apps:
	'mpv'
	'mpv-mpris'
	'tldr'

	# shell aliases:
	'ripgrep'
	'exa'
	'broot'
	# shell/script helpers:
	'highlight'

	'wireplumber'  # pipewire
	'realtime-privileges'  # pipewire
	# theming:
	'breeze'  # cursor themes
)
optdepends=(
	#'gnome-settings-daemon: rc: alternative to xsettingsd'
	'fzf: menu'

	'noto-fonts-emoji: or'
	'ttf-twemoji-color: or'

	'pipewire-zeroconf'  # pipewire over network, but Sonobus seems to be better
)

#package() {
	#config_dir=$(pwd)/..
	#install -Dm755 ${config_dir}/packaging/awesome_argb \
	#"$pkgdir/usr/bin/awesome_argb"
#}
