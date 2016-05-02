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

if test ! $(which airsonos)
then
  # Install airsonos to provide an interface directly to Sonos.
  npm install -g airsonos
fi
