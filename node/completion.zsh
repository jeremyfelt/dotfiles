# nvm loads as a completion file so it runs after compinit. Its bash
# completion calls compinit itself when compdef is not yet defined, which
# doubled shell startup time.
export NVM_DIR="$HOME/.nvm"

if [ -s "$NVM_DIR/nvm.sh" ]; then
  # --no-use skips `nvm use default`, which walks every installed version.
  . "$NVM_DIR/nvm.sh" --no-use
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

  # Put the default version on PATH with a glob instead. Only handles plain
  # version prefixes ("24", "v24.19.0"); lts/* and named aliases fall back
  # to `nvm use`.
  nvm_default_path() {
    local want
    local -a dirs
    [ -r "$NVM_DIR/alias/default" ] || return 1
    want=$(<"$NVM_DIR/alias/default")
    [[ $want == (v|)[0-9]* ]] || return 1
    dirs=("$NVM_DIR"/versions/node/v${want#v}(|.*)/bin(Nn/))
    (( ${#dirs} )) || return 1
    path=($dirs[-1] $path)
    export NVM_BIN=$dirs[-1]
  }
  nvm_default_path || nvm use default --silent
  unfunction nvm_default_path
fi
