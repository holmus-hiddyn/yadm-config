#!/usr/bin/env fish

function ensure_repo -d "Check if repository exists and clone if not"
    # Usage: ensure_repo holmus-hiddyn/dotfiles dest_dir
    if test (count $argv) -lt 2; echo "Must have two arguments" && return 1; end
    if not test -d $argv[2]
        # TODO: Add switch defaults
        set -l base_url "https://github.com"
        if type -q git
            git clone "$base_url/$argv[1]" $argv[2]
        end
    else
        echo "ERR: Directory exists and is not empty."
    end
end
