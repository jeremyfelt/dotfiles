#!/bin/sh
#
# Atom
#
# Install or update Atom with the latest debian package.
cd /tmp
wget https://atom.io/download/deb -O atom.deb
sudo dpkg -i atom.deb

# Install a monokai theme for Atom.
apm install atom-monokai
