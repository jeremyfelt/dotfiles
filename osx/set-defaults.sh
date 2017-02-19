# Sets reasonable OS X defaults.
#
# Or, in other words, set shit how I like in OS X.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#
# And then Jeremy then grabbed this from:
#  https://github.com/holman/dotfiles/blob/master/osx/set-defaults.sh
#
# Run ./set-defaults.sh and you'll be good to go.

# Only show open applications in the dock.
defaults write com.apple.dock static-only -bool TRUE;

# Set the tile size for dock icons.
defaults write com.apple.dock tilesize -int 48

# Trackpad -> Point & Click -> Tap to click on the trackpad.
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad -> Point & Click -> Two finger tap to right click.
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

# Trackpad -> Scroll & Zoom -> Enable natural scroll direction.
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

# Trackpad -> Scroll & Zoom -> Two finger pinch to zoom out-in.
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -bool true

# Trackpad -> Scroll & Zoom -> Two finger douple tap to smart zoom.
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -bool true

# Trackpad -> Scroll & Zoom -> Disable rotate.
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -bool false

# Mouse -> Point & Click -> Scroll direction: natural

# Mouse -> Point & Click -> Secondary click: Click on right side
defaults write NSGlobalDomain com.apple.mouse.enableSecondaryClick -bool true

# Mouse -> Point & Click -> Tracking speed: fast


# This should work, but does not. Three finger dragging needs to be enabled manually.
# Accessibility -> Mouse & Trackpad -> Trackpad options -. Enable three finger dragging.
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -int 1
#defaults write com.apple.AppleMultitouchTrackpad Dragging -int 1
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -boolean true
#defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -boolean true

# Tap to click on the login screen should work, but does not.
#defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 2
#defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 2

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show the ~/Library folder.
chflags nohidden ~/Library

# Disable most recently used when organizing spaces.
defaults write com.apple.dock mru-spaces -bool false

# Disable Photos from opening automatically.
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Set a really fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 2

# Set a shorter delay until repeat.
defaults write NSGlobalDomain InitialKeyRepeat -int 25

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Ask for password when returning from the screensaver.
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Run the screensaver if we're in the bottom-right hot corner.
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0

# Hide Safari's bookmark bar.
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Store screencaptures on the Desktop as png files.
defaults write com.apple.screencapture location -string "${HOME}/Desktop"
defaults write com.apple.screencapture type -string "png"

# Stop local Time Machine backups and stop offering to use new drives.
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
hash tmutil &> /dev/null && sudo tmutil disablelocal
