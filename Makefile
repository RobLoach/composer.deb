COMPOSER_VERSION ?= 1.0.0-alpha11

default: composer package

composer: clean
	@curl -sS https://getcomposer.org/installer | php -- --version=$(COMPOSER_VERSION)$
	@mkdir -p debian/usr/bin
	@cp composer.phar debian/usr/bin/composer

package:
	@sed "s/{{ VERSION }}/$(COMPOSER_VERSION)/g" debian/DEBIAN/control.default > debian/DEBIAN/control
	@fakeroot make finish

finish:
	@chown -R root:root debian
	@dpkg-deb --build debian .

clean:
	@rm -rf debian/usr
	@rm -f *.deb
	@rm -f composer.phar

.PHONY: default
