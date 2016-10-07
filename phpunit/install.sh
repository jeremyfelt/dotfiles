#!/bin/sh
#
cd /tmp/
wget https://phar.phpunit.de/phpunit.phar
chmod +x phpunit.phar
mv phpunit.phar ~/bin/phpunit
