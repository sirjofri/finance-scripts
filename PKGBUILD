# Maintainer: Joel Fridolin Meyer <sirjofri@sirjofri.de>
pkgname=finance-scripts
pkgver=1.0
pkgrel=1
pkgdesc="a collection of helpful finance scripts"
arch=('x86_64')
url="https://github.com/sirjofri/finance-scripts/"
license=('custom')
depends=('gawk' 'gnuplot')

build() {
	cd ..
	make
}

package() {
	cd ..
	make PREFIX="/usr" PACKAGE="$pkgdir" package
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
