#!/bin/sh
#
# Vagrant
#
cd /tmp
wget https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1_x86_64.deb -O vagrant.deb
sudo dpkg -i vagrant.deb

vagrant plugin install vagrant-hostsupdater
vagrant plugin install vagrant-hosts
