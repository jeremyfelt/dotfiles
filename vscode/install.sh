# Remove the VS Code settings file and link a replacement
# from this repo.
rm $HOME/Library/Application\ Support/Code/User/settings.json
ln -s $HOME/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
