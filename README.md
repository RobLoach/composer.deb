Composer Debian Package
=======================

Builds a [Debian](http://debian.org) package to install and run [Composer](http://getcomposer.org).


Usage
-----

The first thing you must do is assemble Composer:
``` bash
 $ make composer
```

Now that Composer is available, we can build the package:
``` bash
 $ make package
```

This will create our Debian package, which we can now interact with:
``` bash
$ ln *.deb
composer_1.0.0-alpha11_all.deb
$ sudo dpkg --install composer_1.0.0-alpha11_all.deb
```

If you want to use a different version of Composer you can override the `COMPOSER_VERSION` variable:
``` bash
$ COMPOSER_VERSION=1.0.0-alpha9 make composer
$ COMPOSER_VERSION=1.0.0-alpha9 make package
```

Development
-----------

When changing the default target Composer version, make sure to update:
* Makefile

About
-----
* Author: [Rob Loach](http://robloach.net)
* Source: [composer.deb](http://github.com/RobLoach/composer.deb)
