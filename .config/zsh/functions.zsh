# zsh/functions.zsh
export ANA_SOURCE="$ANA_SOURCE -> zsh/functions.zsh"

__asdf_install_latest() {
  if [[ -z "$(asdf current $1)" ]]; then
    asdf plugin add "$1" && asdf install "$1" latest &&
      asdf global "$1" latest && asdf reshim "$1"
  fi
}

__ensure_emacs() {
  __ensure_repo "doomemacs/doomemacs" "$XDG_CONFIG_HOME/emacs"

  # Clone, install dependencies, build, sign, and install extensions for Emacs
  local builddir="$XDG_DATA_HOME/build-emacs-for-macos"

  __ensure_repo jimeh/build-emacs-for-macos $builddir
  /opt/homebrew/bin/brew bundle --file "$builddir/Brewfile"
  [[ ! -d "/Applications/Emacs.app" ]] && \
  "$builddir/build-emacs-for-macos" emacs-29 --no-dbus --no-frame-refocus --no-archive
  if read -q "REPLY?Replace current Emacs installation? "; then
    /bin/rm -rf /Applications/Emacs.app
    mv $builddir/builds/*/Emacs.app /Applications && \
      codesign --force --deep -s - /Applications/Emacs.app
  fi
  # brew tap d12frosted/emacs-plus
  # yes | "$EMACSDIR/bin/doom" install
}

__ensure_vscode_extensions() {
  extensions=$1
  local_extensions=("${(@f)$($(which code) --list-extensions)}")

  if __ana_has "code"; then
    for i in $extensions[@]; do 
      if [[ ! $local_extensions =~ "$i" ]]; then
        ___ana_echo "$i not found, installing..."
        code --install-extension "$i"
      fi
    done
  fi
}

__check_signedin_appleid() {
  identifier=$(/usr/libexec/PlistBuddy -c "print:Accounts:Services:AccountID" ~/Library/Preferences/MobileMeAccounts.plist)
  if [[ ! -z "$identifier" ]]; then
    return 1
  else
    return 0
  fi
}
