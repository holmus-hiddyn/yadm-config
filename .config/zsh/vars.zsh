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

export PAGER='less'
export GIT_PAGER="$PAGER"
export MANWIDTH=88

# ==========================================================================
# System
# ==========================================================================

export HOMEBREW_NO_ANALYTICS=true
export HOMEBREW_AUTO_UPDATE_SECS=86400
export HISTSIZE=1000000

# ==========================================================================
# Toolchains
# ==========================================================================

export LESS='-g -i -M -R -S -w -z-4'