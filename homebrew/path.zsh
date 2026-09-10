# shellenv sets PATH, MANPATH, INFOPATH, and HOMEBREW_* in one go.
if [ -x /opt/homebrew/bin/brew ]
then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
