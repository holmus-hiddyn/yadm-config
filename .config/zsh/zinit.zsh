# zsh/zinit.zsh

# Order of execution of related Ice-mods: atinit -> atpull! -> make'!!' -> mv
# -> cp -> make! -> atclone/atpull -> make -> (plugin script loading) -> src
# -> multisrc -> atload.

export ANA_SOURCE="${ANA_SOURCE} -> zinit.zsh {"

export _ZO_DATA="$XDG_DATA_HOME/zoxide"
# In-line best history match suggestion
# don't suggest lines longer than
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=78
# as of v4.0 use ZSH/zpty module to async retrieve
export ZSH_AUTOSUGGEST_USE_ASYNC=1
# Removed forward-char
export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(vi-end-of-line)
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
else
	zinit wait lucid light-mode for \
	  atinit"zicompinit; zicdreplay" \
	      zdharma-continuum/fast-syntax-highlighting \
	  atload"_zsh_autosuggest_start" \
	      zsh-users/zsh-autosuggestions \
	  blockf atpull'zinit creinstall -q .' \
	      zsh-users/zsh-completions
fi

# ----------------------------------------------------------------------------
# Syntax last
# autoload and run compinit
# ----------------------------------------------------------------------------

  # don't add wait, messes with zsh-autosuggest
  zinit lucid atload"zicompinit; zicdreplay" for \
    'zdharma/fast-syntax-highlighting'

ANA_SOURCE="${ANA_SOURCE} }"

