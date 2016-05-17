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
- **Brewfile**: This is a list of applications for [Homebrew Cask](http://caskroom.io) to install: things like Chrome and 1Password and Adium and stuff. Might want to edit this file before running any initial setup.
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

`setup-project-directories` can be used once SSH keys are available to grab
VVV, WSUWP Platform, jeremyfelt.com, etc...

`reload!` is included to re-source new aliases, etc...

## Applications to install manually and other caveats.

* **Xcode** - I don't really understand the relationship between Xcode and the terminal, but strange stuff happens and then I find myself installing this.
	* I really thought `xcode-select --install` was supposed to take care of things, but it likely does cd /usrnot. /shrug
* **Slack** - Slack seems to have a hard time updating via the cask managed package, and installing it through the App Store appears to just work.
* **Airsonos** - So. Things seem to be broken now with node 6.0.0 and the `lame` package's handling of `node-gyp` during `npm install -g airsonos`. I was able to get around this by installing `nvm` and switching to node 4.8.3 to install this.
	* Install VM with `wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash`
	* Use `nvm use 4.8.3` to run `airsonos`. Use `nvm use system` to run anything else.
	* I had to use `sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer` so that `node-gyp` could use `xcodebuild` properly. I have no idea why this is, and it may not have mattered in the end.