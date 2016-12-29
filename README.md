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
bash script/bootstrap
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

* The Monaco for Powerline font must be installed locally. This can't be provided as part of the dotfiles repository because of licensing issues.
* [Atom](https://github.com/atom/atom) does not automatically update in Ubuntu.

### VirtualBox

The VirtualBox process *should* work through an install script, but gave me trouble the last time around, so here's what I did:

1.) Download the `.deb` file from https://www.virtualbox.org/wiki/Linux_Downloads
2.) `sudo dpkg -i ~/Downloads/nameofdebfile.deb`
3.) `sudo apt-get install -f`
