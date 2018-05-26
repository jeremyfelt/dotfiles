#!/bin/sh
#
cd /tmp/
wget -O phpunit https://phar.phpunit.de/phpunit-6.phar
chmod +x phpunit
mv phpunit /usr/local/bin/phpunit
