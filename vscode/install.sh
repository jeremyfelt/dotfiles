rm $HOME/Library/Application\ Support/Code/User/settings.json
ln -s $HOME/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

rm $HOME/Library/Application\ Support/Code/User/keybindings.json
ln -s $HOME/dotfiles/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json

rm -rf $HOME/Library/Application\ Support/Code/User/snippets/
ln -s $HOME/dotfiles/vscode/snippets $HOME/Library/Application\ Support/Code/User/snippets
