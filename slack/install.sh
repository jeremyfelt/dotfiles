#!/bin/sh
#
# Vagrant
#
cd /tmp
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-2.2.1-amd64.deb -O slack.deb
sudo dpkg -i slack.deb
