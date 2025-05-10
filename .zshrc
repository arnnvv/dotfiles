if [[ -f '/opt/homebrew/bin/brew' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
export NODE_EXTRA_CA_CERTS='/opt/homebrew/etc/ca-certificates/cert.pem'
export CURL_CA_BUNDLE='/opt/homebrew/etc/ca-certificates/cert.pem'
export PKG_CONFIG_PATH='/opt/homebrew/opt/openssl/lib/pkgconfig'
export LDFLAGS='-L/opt/homebrew/opt/openssl/lib'
export CPPFLAGS='-I/opt/homebrew/opt/openssl/include'
export SSL_CERT_FILE='/opt/homebrew/etc/openssl@3/cert.pem'
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
export PATH="$HOME/development/flutter/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PNPM_HOME="$HOME/Library/pnpm"
[[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PNPM_HOME:$PATH"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
PROMPT='%F{#87CEEB}%2~%f '
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=2000
setopt appendhistory hist_find_no_dups inc_append_history hist_ignore_all_dups
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
[[ -f "$HOME/Desktop/.aliases.sh" ]] && source "$HOME/Desktop/.aliases.sh"
[[ -f "$HOME/.zshenv" ]] && source "$HOME/.zshenv"
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
autoload -U compinit
compinit -C
[[ -s '/usr/local/share/zsh/site-functions/_bun' ]] && source '/usr/local/share/zsh/site-functions/_bun'
source <(jj util completion zsh)
