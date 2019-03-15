# Upstream URL: https://github.com/actionless/dotfiles

pkgname=actionless_dotfiles_meta
pkgver=0.1
pkgrel=1
pkgdesc="Actionless dotfiles dependencies"
arch=('x86_64' 'i686')
url="https://github.com/actionless/dotfiles"
license=('GPLv3')
depends=(
	'awesome'
	'bash'
	'coreutils'
	'fish'
	## vim stuff:
	'vim'
	'python-language-server'
	'python-rope'
	'bash-language-server'
	# see more: `pikaur -Ssq language server | grep -i -e 'language[-]server' -e ls`
)
optdepends=(
	#'gnome-settings-daemon: rc: alternative to xsettingsd'
)

#package() {
  #config_dir=$(pwd)/..
  #install -Dm755 ${config_dir}/packaging/awesome_argb \
	#"$pkgdir/usr/bin/awesome_argb"
#}
