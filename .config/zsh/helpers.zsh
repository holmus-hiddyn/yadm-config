# zsh/helpers.zsh
export ANA_SOURCE="$ANA_SOURCE -> zsh/helpers.zsh"

# ============================================================================
# Helpers
# ============================================================================

# silently determine existence of executable
# $1 name of bin
__ana_has() { command -v "$1" >/dev/null 2>&1; }

__ensure_repo() {
  local target=$1
  local dest=$2
  if [[ ! -d $dest ]]; then
    if [[ $target =~ "^[^/]+/[^/]+$" ]]; then
      url=https://github.com/$target
    elif [[ $target =~ "^[^/]+$" ]]; then
      url=git@github.com:$USER/$target.git
    fi
    [[ -n ${dest%/*} ]] && mkdir -p ${dest%/*}
    git clone --recursive "$url" "$dest"
  fi
}

__load_repo() {
  __ensure_repo "$1" "$2" && source "$2/$3" || >&2 "Failed to load $1."
}

__is_interactive() { [[ $- == *i* || -n $EMACS ]]; }

# ============================================================================
# Loggers
# ============================================================================

__ana_echo() { printf '          %s\033[0;m\n' "$1"; }
__ana_status() { printf '\033[0;34m==>       %s\033[0;m\n' "$1"; }
__ana_status_() { printf '\033[0;34m          %s\033[0;m\n' "$1"; }
__ana_ok() { printf '\033[0;32m==> OK:   %s\033[0;m\n' "$1"; }
__ana_ok_() { printf '\033[0;32m==>       %s\033[0;m\n' "$1"; }
__ana_err() { printf '\033[0;31m==> ERR:  %s\033[0;m\n' "$1" >&2; }
__ana_err_() { printf '\033[0;31m          %s\033[0;m\n' "$1" >&2; }
__ana_warn() { printf '\033[0;33m==> WARN: %s\033[0;m\n' "$1" >&2; }
__ana_warn_() { printf '\033[0;33m          %s\033[0;m\n' "$1" >&2; }
__ana_usage() { printf '\033[0;34m==> USAGE: \033[0;32m%s\033[0;m\n' "$1"; }
__ana_usage_() { printf '\033[0;29m           %s\033[0;m\n' "$1"; }
