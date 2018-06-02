#!/bin/sh
#
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if test ! $(nvm --version | grep "33.11")
then
  rm -rf $HOME/.nvm
  mkdir $HOME/.nvm
  wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
fi

nvm install stable
nvm use stable

# Install grunt as a global npm package.
npm install -g grunt-cli

# Help check for package updates in projects.
npm install -g npm-check-updates

# Install spoof to enable MAC address spoofing.
sudo npm install spoof -g
