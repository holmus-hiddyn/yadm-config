# zsh/vars.zsh
#
# Rebuild path starting from system path
# Regarding tmux/zellij:
# Since my tmux/zellij shells are not login shells, the path needs to be rebuilt.

export ANA_SOURCE="$ANA_SOURCE -> zsh/vars.zsh"

export LANG=${LANG:-en_US.UTF-8}
export PAGER=less
export LESSHISTFILE="$XDG_DATA_HOME/lesshst"

# ==========================================================================
# Editor
# ==========================================================================

export EDITOR=~/.local/bin/editor
export VISUAL=$EDITOR

export PAGER='nvim +Man!'
export GIT_PAGER="$PAGER"
export MANWIDTH=88

# ==========================================================================
# System
# ==========================================================================

export HOMEBREW_NO_ANALYTICS=true
export HOMEBREW_AUTO_UPDATE_SECS=86400
export HISTSIZE=1000000
export GNUPGHOME="$XDG_CONFIG_HOME/gpg"

export VDOTDIR="$XDG_CONFIG_HOME/nvim"
export NVIM_PYTHON_LOG_FILE="$XDG_CONFIG_HOME/logs/nvim_python.log"
export NVIM_LISTEN_ADDRESS=localhost:90210

# ==========================================================================
# Toolchains
# ==========================================================================

export LESS='-g -i -M -R -S -w -z-4'

export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"
export ASDF_DIR=$ASDF_DIR
export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/asdf/asdfrc"
# bug: this doesn't support full XDG path, needs manual specification
# https://github.com/asdf-vm/asdf/issues/687
export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME=".config/asdf/tool-versions"
export ASDF_PYTHON_DEFAULT_PACKAGES_FILE=".config/asdf/tool-versions"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

# https://nodejs.org/api/repl.html#repl_environment_variable_options
export NODE_REPL_HISTORY="${XDG_DATA_HOME}/node_repl_history"
export NPMRC_STORE="${HOME}/.local/npmrcs"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/config"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
# if you do this one, make sure to add $XDG_DATA_HOME/npm/bin to the $PATH,
# otherwise global installed executables won't be accessible on the cli.
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"
export PATH="$XDG_DATA_HOME/npm/bin:$PATH"

# ==========================================================================
# Editors
# ==========================================================================

export EMACSDIR="$XDG_CONFIG_HOME/emacs"
export DOOMDIR="$XDG_CONFIG_HOME/doom"
export PATH="$EMACSDIR/bin:/Applications/Emacs.app/Contents/MacOS/bin:$PATH"
