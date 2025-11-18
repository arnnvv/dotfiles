HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=2000
setopt appendhistory hist_find_no_dups inc_append_history hist_ignore_all_dups
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
PROMPT='%F{#87CEEB}%2~%f '
if [[ -f ~/.zsh_brew_cache ]]; then
  source ~/.zsh_brew_cache
else
  if [[ -f '/opt/homebrew/bin/brew' ]]; then
    /opt/homebrew/bin/brew shellenv > ~/.zsh_brew_cache
    source ~/.zsh_brew_cache
  fi
fi
export NODE_EXTRA_CA_CERTS='/opt/homebrew/etc/ca-certificates/cert.pem'
export CURL_CA_BUNDLE='/opt/homebrew/etc/ca-certificates/cert.pem'
export SSL_CERT_FILE='/opt/homebrew/etc/openssl@3/cert.pem'
export PNPM_HOME="$HOME/Library/pnpm"
typeset -U path
path=(
  "/opt/homebrew/opt/postgresql@18/bin"
  "$HOME/.local/bin"
  "$PNPM_HOME"
  $path
)
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git --exclude .jj'
[[ -f "$HOME/Desktop/.aliases.sh" ]] && source "$HOME/Desktop/.aliases.sh"
[[ -f "$HOME/.zshenv" ]] && source "$HOME/.zshenv"
autoload -Uz compinit
compinit -C
