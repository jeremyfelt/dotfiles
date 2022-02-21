#!/bin/sh
#
# NVM: https://github.com/nvm-sh/nvm

if test ! $(nvm --version | grep "39.1")
then
  rm -rf $HOME/.nvm
  mkdir $HOME/.nvm
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
fi

export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

nvm install --lts --latest-npm
nvm use --lts

# Help check for package updates in projects.
npm install -g npm-check-updates
