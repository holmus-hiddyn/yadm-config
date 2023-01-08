#!/usr/bin/env fish

function asdf_install_latest -d "Install a plugin and make the latest version global"
    asdf plugin add $argv[1] && asdf install $argv[1] latest && asdf global $argv[1] latest
end
