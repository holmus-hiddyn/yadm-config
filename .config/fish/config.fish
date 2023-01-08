set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_STATE_HOME "$HOME/.local/state"
set -x XDG_BIN_HOME "$HOME/.local/bin"

set -x DOTFILES "$XDG_DATA_HOME/chezmoi"
set -x DOTFILES_CONFIG "$DOTFILES/dot_config"
# set -x DOTFILES_ASSETS "$DOTFILES/assets"

for dir in $XDG_CACHE_HOME $XDG_CONFIG_HOME $XDG_DATA_HOME \
    $XDG_BIN_HOME $DOTFILES_DATA "$XDG_CONFIG_HOME/asdf"
    if not test -d "$dir"
        mkdir -p "$dir"
    end
end

set -x FDOTDIR "$XDG_CONFIG_HOME/fish"

# Hush now, quiet now
set fish_greeting

# Set vi mode
fish_vi_key_bindings

source "$FDOTDIR/vars.fish"
# source "$FDOTDIR/keybindings.fish"
source "$FDOTDIR/aliases.fish"

# if type -q zoxide
#     zoxide init fish | source
# end

# if test -f "$ASDF_DATA_DIR/asdf.fish"
#     source "$ASDF_DATA_DIR/asdf.fish"
# end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
