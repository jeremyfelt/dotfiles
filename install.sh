# Install command line utilities
xcode-select --install

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap homebrew/php

# Install packages with Homebrew
brew install node grc coreutils spark z ack wget git subversion fabric openvpn mysql php56 composer

# Install additional packages with Homebrew's cask
brew cask install google-chrome firefox spotify virtualbox vagrant flux cloudup slack caffeine sequel-pro phpstorm rescuetime google-photos-backup tunnelblick paw alfred atom

# Install the latest beta of iterm2
brew install Caskroom/versions/iterm2-beta

# Install grunt as a global npm package
# Install airsonos to provide an interface directly to sonos
npm install -g grunt-cli airsonos

# Create the directory used for development projects.
mkdir -p ~/Development

# Install powerline fonts for oh my zsh
# git clone https://github.com/powerline/fonts.git ~/Development/powerline-fonts/
# sh ~/Development/powerline-fonts/install.sh

vagrant plugin install vagrant-hostsupdater
vagrant plugin install vagrant-hosts

# Copy over SSH keys

# Clone VVV into a directory of its own.
cd ~/Development
git clone git@github.com:Varying-Vagrant-Vagrants/VVV.git vvv

# Clone WSUWP Platform into a directory of its own.
cd ~/Development
git clone git@github.com:washingtonstateuniversity/WSUWP-Platform.git wsuwp-platform

# Clone the WSU Web Provisioner repository.
cd ~/Development
git clone git@github.com:washingtonstateuniversity/WSU-Web-Provisioner.git wsu-web-provisioner

# Clone jeremyfelt.com into a directory of its own.
cd ~/Development/
git clone git@github.com:jeremyfelt/jeremyfelt.com.git jeremyfelt.com
cd ~/Development/jeremyfelt.com
git submodule update --init

# Server NAT rules for allowing VPN traffic
# iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE

# To update packages every so often.
# brew update && brew upgrade
