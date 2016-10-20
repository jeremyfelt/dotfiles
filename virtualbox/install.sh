#!/bin/sh
#
# Vagrant
#
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" > /etc/apt/sources.list.d/virtualbox.list'

sudo apt-get update
sudo apt-get install -y virtualbox-5.1 dkms
