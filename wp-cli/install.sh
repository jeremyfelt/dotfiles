#!/bin/sh
#
# wp-cli

if test ! $(which wp)
then
	mkdir -p ~/bin
	curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /tmp/wp-cli.phar
	chmod +x /tmp/wp-cli.phar
	mv /tmp/wp-cli.phar ~/bin/wp
fi
