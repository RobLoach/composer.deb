VERSION=1.0.0-alpha11

default: composer package

composer: clean
	@curl -sS https://getcomposer.org/installer | php -- --version=$(VERSION)$
	@mkdir -p debian/usr/bin
	@cp composer.phar debian/usr/bin/composer

package:
	@fakeroot make finish

finish:
	@chown -R root:root debian
	@dpkg-deb --build debian .

clean:
	@rm -rf debian/usr
	@rm -f *.deb
	@rm -f composer.phar

.PHONY: default
