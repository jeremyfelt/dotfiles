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

### Download and install

* **Firefox**
* **Chrome**
* **Code**
    * After installation, open VS Code and use the command palette to install the shell command.
    * Install One Monokai theme: `code --install-extension azemoh.one-monokai`
    * Install intelephense: `code --install-extension bmewburn.vscode-intelephense-client`
* **Zoom**
* **Spotify**
* **LICEcap** https://www.cockos.com/licecap/
* **Calibre** https://calibre-ebook.com/download_osx
* **Cyberduck**

### App Store

* **Slack**
* **Harvest**
* **Ulysses**
* **Keynote**

### Optional

* Google Drive
* Sonos
* Sketch

### Caveats

* Valet+ is installed via a Composer script, but these commands may need to be run manually afterward:
    * `sudo mysql_secure_installation` (set root password)
    * `valet fix`
    * `valet install`
    * Then, inside a `~/Development` directory, `valet park`
    * Also, `valet domain test`, which I think is supposed to happen automatically?
* **Xcode** - I don't really understand the relationship between Xcode and the terminal, but strange stuff happens and then I find myself installing this.
	* I really thought `xcode-select --install` was supposed to take care of things, but it likely does cd /usrnot. /shrug
