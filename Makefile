VERSION=1.0.0-alpha7

default: composer package

composer: clean
	@curl -sS https://getcomposer.org/installer | php
	@php composer.phar create-project composer/composer -s alpha debian/usr/share/composer $(VERSION)$
	@mkdir -p debian/usr/bin
	@ln -sf ../share/composer/bin/composer debian/usr/bin/composer

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
