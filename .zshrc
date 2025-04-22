if [[ -f '/opt/homebrew/bin/brew' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
export \
  NODE_EXTRA_CA_CERTS='/opt/homebrew/etc/ca-certificates/cert.pem' \
  CURL_CA_BUNDLE='/opt/homebrew/etc/ca-certificates/cert.pem' \
  PKG_CONFIG_PATH='/opt/homebrew/opt/openssl/lib/pkgconfig' \
  LDFLAGS='-L/opt/homebrew/opt/openssl/lib' \
  CPPFLAGS='-I/opt/homebrew/opt/openssl/include' \
  SSL_CERT_FILE='/opt/homebrew/etc/openssl@3/cert.pem'
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
export PATH="$HOME/development/flutter/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
PROMPT='%F{#87CEEB}%2~%f '
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=2000
setopt appendhistory
setopt hist_find_no_dups
setopt inc_append_history
setopt hist_ignore_all_dups
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
source "$HOME/Desktop/.aliases.sh"
source "$HOME/.zshenv"
source "$HOME/.cargo/env"
[[ -s '/usr/local/share/zsh/site-functions/_bun' ]] && source '/usr/local/share/zsh/site-functions/_bun'
