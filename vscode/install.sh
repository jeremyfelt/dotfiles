#!/bin/sh
#
# Link VS Code settings from this repo and install extensions.

SETTINGS_DIR="$HOME/Library/Application Support/Code/User"

if ! command -v code >/dev/null
then
  echo "  VS Code shell command not found. Open VS Code and run 'Install code command in PATH'."
  exit 0
fi

mkdir -p "$SETTINGS_DIR"
rm -f "$SETTINGS_DIR/settings.json"
ln -s "$HOME/dotfiles/vscode/settings.json" "$SETTINGS_DIR/settings.json"

for ext in azemoh.one-monokai bmewburn.vscode-intelephense-client johnbillion.vscode-wordpress-hooks xdebug.php-debug
do
  code --install-extension "$ext" --force
done
