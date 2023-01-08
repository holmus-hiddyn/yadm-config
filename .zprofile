export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_BIN_HOME="$HOME/.local/bin"

export DOTFILES="$XDG_CONFIG_HOME"
export DOTFILES_CONFIG="$DOTFILES/yadm"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# export DOTFILES_ASSETS="$DOTFILES/assets"

if [ -z "$ANA_INIT" ]; then
  export ANA_SOURCE="$ANA_SOURCE -> .zshenv"
  # TODO: 1password-cli puts op in /usr/local/bin for some stupid reason; fix this someday
  path=($XDG_BIN_HOME /opt/homebrew/bin /usr/local/bin /usr/sbin /usr/bin /sbin /bin)
  # path=($XDG_BIN_HOME /usr/local/bin /usr/sbin /usr/bin /sbin /bin)
  fpath=($XDG_BIN_HOME $fpath)
  export ANA_INIT=1
else
  export ANA_SOURCE="$ANA_SOURCE -> .zshenv:skip-init"
fi