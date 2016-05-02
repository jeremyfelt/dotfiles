if test ! $(which spoof)
then
  # Install spoof to enable MAC address spoofing.
  sudo npm install spoof -g
  # Install grunt as a global npm package.
  npm install -g grunt-cli
  # Install airsonos to provide an interface directly to Sonos.
  npm install -g airsonos
fi
