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
  last, after `compinit`. Anything that registers completions or calls
  `compinit` itself (nvm does) belongs here, or `compinit` runs twice.
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

`dot` installs Homebrew if needed, runs `brew bundle`, and runs each
topic's `install.sh`. Run it from time to time to keep things current.
`dot --defaults` also applies `osx/set-defaults.sh`, which restarts Dock
and Finder, so it is off unless asked for. `script/bootstrap` passes it.

`reload!` is included to re-source new aliases, etc...

## Development Backup & Restore

Two scripts are provided to backup and restore the `~/Development` directory:

### backup-development

Creates timestamped tar archives of each project in `~/Development`:

```sh
backup-development
```

Archives are saved to `~/Desktop/<timestamp>-Development/` with each project as a separate tar file.

### restore-development-backup

Restores tar archives from a backup directory back to `~/Development`:

```sh
restore-development-backup ~/Desktop/20250106-1234-Development
```

This extracts all `.tar` files from the specified directory into `~/Development`.

## Applications to install manually and other caveats.

### App Store

* **Bitwarden**
* **Harvest**
* **NepTunes**
* **Slack**
* **Sequel Ace**

### Download and install

* **Firefox**
* **Raycast**
* **Claude**
* **Zed**
* **Code**
  * After installation, open VS Code and use the command palette to install the shell command.
  * Then run `dot` (or `vscode/install.sh`) to link settings and install extensions.
* **Obsidian**
* **Chrome**
* **Cleanshot X**
* **Orbstack**
	* Homebrew version tries to use Rosetta?

And then when you need them:
* **Calibre** https://calibre-ebook.com/download_osx
* **Loom**
* **NordVPN**
* **Ollama**
* **Spotify**
* **Zoom**

### Environment setup

* `valet install`
* `valet use php@8.4`
* `brew services start mariadb`
* `mysql` (`GRANT ALL PRIVILEGES ON *.* TO ...@localhost IDENTIFIED BY '...'`)
* Inside `~/Development` directory, run `valet park` - subdirectories will now work
* Run `valet secure` inside one of the subdirectories and certificates will be installed.

### Restore backups

* `restore-db-local {backup-dir}`
* `restore-development-backup {backup-dir}`

### Miscellany

* **Xcode** - I don't really understand the relationship between Xcode and the terminal, but strange stuff happens and then I find myself installing this.
	* I really thought `xcode-select --install` was supposed to take care of things, but it likely does not. /shrug
* `zsh compinit: insecure directories, run compaudit for list.`
    * I was getting this toward the end of installation and when I ran `compaudit` was told that `/usr/local/share/zsh` was insecure.
	* I ran `sudo chmod -R 755 /usr/local/share/zsh`, which removed the group write permissions, and it stopped showing in `compaudit`.
	* Before doing that I had also tried `sudo chmod -R 755 /usr/local/share/zsh/site-functions`, but failed to check permissions or `compaudit` beforehand.
	* After restarting zsh, my auto completion issue (`_complete:96: bad math expression: operand expected at end of string`) was resolved as well.
* `ls` didn't work after a `brew upgrade` updated Python
	* `zsh: /opt/homebrew/bin/grc: bad interpreter: /opt/homebrew/opt/python@3.10/bin/python3: no such file or directory`
	* I ran `brew uninstall grc` and `brew install grc` and it worked.
