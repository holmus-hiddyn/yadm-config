# alias ls    'ls -lG@'
alias l 'ls -la'
alias la 'ls -la'
alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'

alias b brew
alias bi 'b install'
alias br 'b reinstall'
alias bs 'b search'
alias bu 'b uninstall'
alias bz 'bu --zap'

alias brci 'bi --cask'
alias brcu 'bu --cask'
alias brcr 'br --cask'
alias brcz 'brcu --zap'
alias ci brci

alias brup 'b update && b upgrade && b cleanup'
alias bbun 'b bundle install --file $XDG_CONFIG_HOME/darwin/Brewfile'

alias cz chezmoi
alias czi 'cz init'
alias dp 'cz apply -v -k'
alias czia 'czi --apply'

alias cdd 'cd $DOTFILES'

# https://apple.stackexchange.com/questions/17622/how-can-i-make-rm-move-files-to-the-trash-can
alias del trash

alias e '$EDITOR'

alias esfa '$EDITOR $XDG_CONFIG_HOME/fish/aliases.fish'
alias esfc '$EDITOR $XDG_CONFIG_HOME/fish/config.fish'
alias eehc '$EDITOR $XDG_CONFIG_HOME/helix/config.toml'

function g
    if test (count $argv) -gt 0
        git $argv
    else
        git status --short
    end
end

alias gaa 'g add -A'
alias gcm 'g commit -m'

alias mkdir 'mkdir -p'
alias md mkdir

function y
    if test (count $argv) -gt 0
        yadm $argv
    else
        yadm status --short
    end
end

alias ya 'y add'
alias yau 'ya -u'
