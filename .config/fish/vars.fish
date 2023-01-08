set --prepend PATH /opt/homebrew/bin

set -Ux EDITOR ~/.local/bin/editor
set -Ux VISUAL ~/.local/bin/editor

set -x LESSHISTFILE /dev/null

set -Ux ASDF_DATA_DIR                       "$XDG_DATA_HOME/asdf"
set -Ux ASDF_DIR                            $ASDF_DATA_DIR
set -Ux ASDF_CONFIG_FILE                    "$XDG_CONFIG_HOME/asdf/asdfrc"
# bug: this doesn't support full XDG path, needs manual specification
# https://github.com/asdf-vm/asdf/issues/687
set -Ux ASDF_DEFAULT_TOOL_VERSIONS_FILENAME ".config/asdf/tool-versions"

set -Ux DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"

set -Ux GNUPGHOME "$XDG_CONFIG_HOME/gnupg"

set -Ux MANWIDTH 88

if type -q "/opt/homebrew/bin/bat"
    set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
end

set -Ux HOMEBREW_NO_ANALYTICS 1

set -Ux NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/config"
set -Ux NPM_CONFIG_CACHE      "$XDG_CACHE_HOME/npm"
set -Ux NPM_CONFIG_TMP        "$XDG_RUNTIME_DIR/npm"

set -Ux DOOMDIR "$XDG_CONFIG_HOME/doom"
set -Ux EMACSDIR "$XDG_CONFIG_HOME/emacs"
# fish_add_path "/Applications/Emacs.app/Contents/MacOS/bin"
# fish_add_path "$EMACSDIR/bin"
