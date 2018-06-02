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

if test ! $(which spoof)
then
  # Install spoof to enable MAC address spoofing.
  sudo npm install spoof -g
fi

if test ! $(which grunt-cli)
then
  # Install grunt as a global npm package.
  npm install -g grunt-cli
fi

if test ! $(which npm-check-updates)
then
  npm install -g npm-check-updates
fi
