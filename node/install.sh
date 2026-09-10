#!/bin/sh
#
# NVM: https://github.com/nvm-sh/nvm

NVM_VERSION="0.40.3"
export NVM_DIR="$HOME/.nvm"

# Load nvm before checking its version. Without this, `nvm` is undefined in a
# fresh shell, the check always fails, and ~/.nvm gets wiped on every run.
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use

if [ "$(nvm --version 2>/dev/null)" != "$NVM_VERSION" ]
then
  curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh" | bash
  . "$NVM_DIR/nvm.sh" --no-use
fi

nvm install --lts --latest-npm
nvm use --lts

# Help check for package updates in projects.
npm install -g npm-check-updates
