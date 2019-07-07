rm $HOME/Library/Application\ Support/Code/User/settings.json
ln -s $HOME/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

rm $HOME/Library/Application\ Support/Code/User/snippets/
ln -s $HOME/dotfiles/vscode/snippets/ $HOME/Library/Application\ Support/Code/User/snippets
