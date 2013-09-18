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
composer_1.0.0-alpha7_all.deb
$ sudo dpkg --install composer_1.0.0-alpha7_all.deb
```

Development
-----------

When changing the target Composer version, make sure to update:
* Makefile
* debian/DEBIAN/control


About
-----
* Author: [Rob Loach](http://robloach.net)
* Source: [composer.deb](http://github.com/RobLoach/composer.deb)
