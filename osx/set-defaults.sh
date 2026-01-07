# Sets reasonable macOS defaults.
#
# Or, in other words, set shit how I like in macOS.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#
# And then Jeremy then grabbed this from:
#  https://github.com/holman/dotfiles/blob/master/osx/set-defaults.sh
#
# Run ./set-defaults.sh and you'll be good to go.
#
# Note: Some settings require a logout or restart to take effect.
# Note: Tested on macOS Tahoe (26.x). Some settings may not work on older versions.

# Only show open applications in the dock. Requires Dock restart.
defaults write com.apple.dock static-only -bool true

# Set the tile size for dock icons. Requires Dock restart.
defaults write com.apple.dock tilesize -int 48

# Trackpad -> Point & Click -> Tap to click on the trackpad. Requires logout.
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# These would be useful for the above, but we set them to 2 below so that
# three finger drag can work.
#defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -bool true
#defaults write NSGlobalDomain com.apple.mouse.tapBehavior -bool true

# Trackpad -> Point & Click -> Two finger tap to right click. Requires logout.
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true

# Trackpad -> Scroll & Zoom -> Enable natural scroll direction.
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

# Trackpad -> Scroll & Zoom -> Two finger pinch to zoom out-in. Requires logout.
defaults write com.apple.AppleMultitouchTrackpad TrackpadPinch -bool true

# Trackpad -> Scroll & Zoom -> Two finger double tap to smart zoom. Requires logout.
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -bool true

# Trackpad -> Scroll & Zoom -> Disable rotate. Requires logout.
defaults write com.apple.AppleMultitouchTrackpad TrackpadRotate -bool false

# Mouse -> Point & Click -> Scroll direction: natural
# ?

# Mouse -> Point & Click -> Secondary click: Click on right side
defaults write NSGlobalDomain com.apple.mouse.enableSecondaryClick -bool true

# Mouse -> Point & Click -> Tracking speed: fast
# ?

# Accessibility -> Motor -> Pointer Control -> Trackpad Options -> Dragging style: Three-Finger Drag.
# Requires logout. May need to be enabled manually in System Settings on Tahoe.
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# Tap to click on the login screen should work, but does not.
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 2
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 2

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important. Requires Finder restart.
defaults write com.apple.finder FXPreferredViewStyle Nlsv

# Show the ~/Library folder.
chflags nohidden ~/Library

# Disable most recently used when organizing spaces. Requires Dock restart.
defaults write com.apple.dock mru-spaces -bool false

# Disable Photos from opening automatically when devices are connected.
# On Tahoe, this may need to be set in Photos -> Settings -> General -> "Importing".
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Set a really fast key repeat. Requires logout.
defaults write NSGlobalDomain KeyRepeat -int 2

# Set a shorter delay until repeat. Requires logout.
defaults write NSGlobalDomain InitialKeyRepeat -int 25

# Set the Finder prefs for showing a few different volumes on the Desktop. Requires Finder restart.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Ask for password when returning from the screensaver.
# On Tahoe, this is managed in System Settings -> Lock Screen.
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Run the screensaver if we're in the bottom-right hot corner. Requires Dock restart.
# Hot corner values: 0=no action, 2=Mission Control, 3=App Windows, 4=Desktop,
# 5=Screensaver, 6=Disable Screensaver, 10=Sleep, 11=Launchpad, 12=Notification Center.
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0

# Hide Safari's bookmark bar.
# On Tahoe, Safari settings may need to be configured manually due to sandboxing.
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Set up Safari for development.
# On Tahoe, enable via Safari -> Settings -> Advanced -> "Show features for web developers".
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Store screencaptures on the Desktop as png files. Requires SystemUIServer restart.
defaults write com.apple.screencapture location -string "${HOME}/Desktop"
defaults write com.apple.screencapture type -string "png"

# Stop local Time Machine backups and stop offering to use new drives.
#defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
#hash tmutil &> /dev/null && sudo tmutil disablelocal

# Restart affected services to apply changes.
# Note: Some trackpad and keyboard settings require a full logout to take effect.
echo "Restarting Dock, Finder, and SystemUIServer..."
killall Dock
killall Finder
killall SystemUIServer

echo "Done. Some settings require a logout or restart to take full effect."
