# zsh/aliases.zsh
export ANA_SOURCE="$ANA_SOURCE -> zsh/aliases.zsh"

alias cdd="cd $DOTFILES"
alias cddc="cd $DOTFILES_CONFIG"

# mnemonic: verb+subject+file (e.g. edit+shell+zsh+aliases)
alias e="$EDITOR"
alias eza="$EDITOR $XDG_CONFIG_HOME/zsh/aliases.zsh"
alias ezv="$EDITOR $XDG_CONFIG_HOME/zsh/functions.zsh"
alias ezv="$EDITOR $XDG_CONFIG_HOME/zsh/vars.zsh"

g() { [[ $# = 0 ]] && git status --short . || git $*; }

alias ls="gls --color=auto --group-directories-first -N"
# macOS-specific; GNU ls doesn't support ACLs and macOS doesn't have getfacl
# alias ls="ls -G"
alias l='ls -1'
# alias le="ls -ale@"
alias la="ls -Al"
alias ll='ls -l'
alias la='LC_COLLATE=C ls -la'
# alias date=gdate

alias b=brew
alias bi='b install'
alias br='b reinstall'
alias bu='b uninstall'
alias bs='b search'
alias bz='bu --zap'
alias bbun="b bundle --file '$XDG_CONFIG_HOME/darwin/Brewfile'"

alias brci='bi --cask'
alias brcr='br --cask'
alias brcz='bz --cask'
alias ci='brci'

alias md='mkdir -p'

y() { [[ $# = 0 ]] && yadm status --short || yadm $*; }
alias ya='y add'
alias yau='ya -u'
alias yal='y alt'
