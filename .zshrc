if [[ -f '/opt/homebrew/bin/brew' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
export \
	NODE_EXTRA_CA_CERTS='/opt/homebrew/etc/ca-certificates/cert.pem'\
	CURL_CA_BUNDLE='/opt/homebrew/etc/ca-certificates/cert.pem'\
	SSL_CERT_FILE='/opt/homebrew/etc/openssl/cert.pem'\
	PATH="/opt/homebrew/opt/curl/bin:$PATH"\
	PKG_CONFIG_PATH='/opt/homebrew/opt/openssl/lib/pkgconfig'\
	LDFLAGS='-L/opt/homebrew/opt/openssl/lib'\
	CPPFLAGS='-I/opt/homebrew/opt/openssl/include'\
	PNPM_HOME='/Users/arnavsharma/Library/pnpm'\
	PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
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
zshaddhistory() {
  [[ $1 =~ ^(p|px|pa|pad|b|bx|ba|bad|podman|cln|sudo|sl|git|go)$ ]] || return 1
}
source "$HOME/Desktop/.aliases.sh"
source "$HOME/.zshenv"
source "$HOME/.cargo/env"
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
[ -s '/usr/local/share/zsh/site-functions/_bun' ] && source '/usr/local/share/zsh/site-functions/_bun'
