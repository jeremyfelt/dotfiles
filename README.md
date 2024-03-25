# Jeremy's dotfiles

The structure and many (most?) of the files in this repository are forked
from [Zach Holman's dotfiles](https://github.com/holman/dotfiles). See his [post on the
subject](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).

## Structure

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

### Components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **Brewfile**: This is a list of applications for [Homebrew](https://brew.sh) to install.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## Install

Run this:

```sh
git clone https://github.com/jeremyfelt/dotfiles.git ~/dotfiles
cd ~/dotfiles
script/bootstrap
```

This will symlink the appropriate files in `dotfiles` to your home directory.
Everything is configured and tweaked within `~/dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane OS X
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

`reload!` is included to re-source new aliases, etc...

## Applications to install manually and other caveats.

### App Store

* **Slack**
* **Harvest**
* **GarageBand**
* **Cyberduck**
* **LastPass**

### Download and install

* **Firefox**
* **Code**
    * After installation, open VS Code and use the command palette to install the shell command.
    * Install One Monokai theme: `code --install-extension azemoh.one-monokai`
    * Install intelephense: `code --install-extension bmewburn.vscode-intelephense-client`
	* Install WP Hooks: `code --install-extension johnbillion.vscode-wordpress-hooks`
	* Install PHP Debug: `code --install-extension xdebug.php-debug`
* **Zoom**
* **Spotify**
* **LICEcap** https://www.cockos.com/licecap/
* **Calibre** https://calibre-ebook.com/download_osx
* **Sketch**
* **Obsidian**
* **Sonos**
* **Chrome**
* **Google Drive**

### Caveats

* Valet is installed via a Composer script. These commands should be run manually afterward:
    * `valet install` (defaults to PHP 8.3)
	* `valet use php@8.2`
	* `brew services start mariadb`
	* Inside a `~/Development` directory, `valet park`.
* **Xcode** - I don't really understand the relationship between Xcode and the terminal, but strange stuff happens and then I find myself installing this.
	* I really thought `xcode-select --install` was supposed to take care of things, but it likely does cd /usrnot. /shrug
* `zsh compinit: insecure directories, run compaudit for list.`
    * I was getting this toward the end of installation and when I ran `compaudit` was told that `/usr/local/share/zsh` was insecure.
	* I ran `sudo chmod -R 755 /usr/local/share/zsh`, which removed the group write permissions, and it stopped showing in `compaudit`.
	* Before doing that I had also tried `sudo chmod -R 755 /usr/local/share/zsh/site-functions`, but failed to check permissions or `compaudit` beforehand.
	* After restarting zsh, my auto completion issue (`_complete:96: bad math expression: operand expected at end of string`) was resolved as well.
* `ls` didn't work after a `brew upgrade` updated Python
	* `zsh: /opt/homebrew/bin/grc: bad interpreter: /opt/homebrew/opt/python@3.10/bin/python3: no such file or directory`
	* I ran `brew uninstall grc` and `brew install grc` and it worked.
