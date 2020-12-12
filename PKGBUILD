pkgname=actionless_dotfiles_meta
pkgver=0.1
pkgrel=12
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
	'python-language-server'
	'python-rope'
	'bash-language-server'
	'xsel'
	# see more: `pikaur -Ssq language server | grep -i -e 'language[-]server' -e ls`

	# theming:
	'breeze'  # cursor themes
	'gnome-icon-theme'

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
)
optdepends=(
	#'gnome-settings-daemon: rc: alternative to xsettingsd'
	'fzf: menu'
)

#package() {
	#config_dir=$(pwd)/..
	#install -Dm755 ${config_dir}/packaging/awesome_argb \
	#"$pkgdir/usr/bin/awesome_argb"
#}
