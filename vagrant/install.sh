#!/bin/sh
#
# Vagrant
#
cd /tmp
wget https://releases.hashicorp.com/vagrant/1.8.6/vagrant_1.8.6_x86_64.deb -O vagrant.deb
sudo dpkg -i vagrant.deb

vagrant plugin install vagrant-hostsupdater
vagrant plugin install vagrant-hosts
