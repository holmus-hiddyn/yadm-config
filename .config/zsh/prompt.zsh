# zsh/prompt.zsh
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
export ANA_SOURCE="$ANA_SOURCE -> zsh/prompt.zsh"

# ZSH var, timeout between <Esc> and mode switch update
export KEYTIMEOUT=2

PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '