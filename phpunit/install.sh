#!/bin/sh
#
cd /tmp/
mkdir -p ~/bin
wget https://phar.phpunit.de/phpunit.phar
chmod +x phpunit.phar
mv phpunit.phar ~/bin/phpunit
