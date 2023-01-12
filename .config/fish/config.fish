set -Ux XDG_CACHE_HOME "$HOME/.cache"
set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -Ux XDG_DATA_HOME "$HOME/.local/share"
set -Ux XDG_STATE_HOME "$HOME/.local/state"
set -Ux XDG_BIN_HOME "$HOME/.local/bin"

# set -x DOTFILES "$XDG_DATA_HOME/chezmoi"
# set -x DOTFILES_CONFIG "$DOTFILES/dot_config"
# set -x DOTFILES_ASSETS "$DOTFILES/assets"

# for dir in $XDG_CACHE_HOME $XDG_CONFIG_HOME $XDG_DATA_HOME \
#     $XDG_BIN_HOME $DOTFILES_DATA "$XDG_CONFIG_HOME/asdf"
#     if not test -d "$dir"
#         mkdir -p "$dir"
#     end
# end

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

ensure_repo "asdf-vm/asdf" "$ASDF_DATA_DIR"

# if test -f "$ASDF_DATA_DIR/asdf.fish"
#   source "$ASDF_DATA_DIR/asdf.fish"
# end

if test -f /opt/homebrew/opt/asdf/libexec/asdf.fish
    source /opt/homebrew/opt/asdf/libexec/asdf.fish
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
