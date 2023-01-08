# zsh/.zshrc

# sourced only on interactive/TTY
# sourced when you type ZSH

[[ -n "$TMUX" ]] && ANA_SOURCE="$ANA_SOURCE -> ____TMUX____ {"
[[ -n "$ZELLIJ" ]] && ANA_SOURCE="$ANA_SOURCE -> ____ZELLIJ____ {"
export ANA_SOURCE="$ANA_SOURCE -> .zshrc {"

# export to global and dedupe entries (lowercase are arrays that shadow PATH,
# FPATH, etc). zsh docs recommends setting the flag for both interfaces (i.e.,
# add both PATH var and path array)
typeset -gU cdpath PATH path FPATH fpath MANPATH manpath

source "$ZDOTDIR/helpers.zsh"
source "$ZDOTDIR/vars.zsh"

if [[ ! "$(yadm config local.class)" = "transient" ]]; then
__ana_has "zinit" || {
  __load_repo zdharma-continuum/zinit ${ZINIT_HOME:-$HOME/.config/zsh/.zinit} \
    zinit.zsh
}
fi

# ============================================================================
# Load modules
# ============================================================================

# http://zsh.sourceforge.net/Doc/Release/Zsh-Modules.html
# Completion listing extensions
zmodload zsh/complist
autoload -U add-zsh-hook

source "$ZDOTDIR/config.zsh"
source "$ZDOTDIR/functions.zsh"
source "$ZDOTDIR/keybinds.zsh"
source "$ZDOTDIR/prompt.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/zinit.zsh"

# ============================================================================
# Completion
# ============================================================================

autoload -Uz compinit
# {{- if not .transient }}
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# {{- end }}

# Requires EXTENDED_GLOB=true; run compinit once every 24 hours, not on demand
if [[ -n "$ZSH_CACHE/zcompdump"(#qN.mh+24) ]]; then
    compinit -i -d $ZSH_CACHE/zcompdump
else
    compinit -C -d $ZSH_CACHE/zcompdump
fi

__ana_has 'zoxide' && {
	eval "$(zoxide init zsh)"
}

__ana_has 'asdf' && {
 source "/opt/homebrew/opt/asdf/libexec/asdf.sh"
}

ANA_SOURCE="$ANA_SOURCE }"
