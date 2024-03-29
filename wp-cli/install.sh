#!/bin/sh
#
# wp-cli

if test ! $(which wp)
then
	curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /tmp/wp-cli.phar
	chmod +x /tmp/wp-cli.phar
	sudo mv /tmp/wp-cli.phar /usr/local/bin/wp
else
	wp cli update --yes
fi
