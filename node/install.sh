mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

if test ! $(which grunt-cli)
then
  # Install grunt as a global npm package.
  npm install -g grunt-cli
fi

if test ! $(which npm-check-updates)
then
  npm install -g npm-check-updates
fi
